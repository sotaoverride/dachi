#include <iostream>
#include <thread>
#include <vector>
#include <zmq.hpp>
#include <capnp/message.h>
#include <capnp/serialize.h>
#include "schema.capnp.h"

// Publisher Daemon: Serializes and sends Cap'n Proto messages
void publisher_daemon(zmq::context_t* context, std::string addr) {
    zmq::socket_t pub(*context, zmq::socket_type::pub);
    pub.bind(addr);

    uint32_t counter = 0;
    while (true) {
        capnp::MallocMessageBuilder builder;
        HelloWorld::Builder msg = builder.initRoot<HelloWorld>();
        msg.setId(counter++);
        msg.setMessage("Hello from " + addr);

        // Serialize to flat array for ZMQ transmission
        auto words = capnp::messageToFlatArray(builder);
        auto bytes = words.asBytes();

        zmq::message_t z_msg(bytes.begin(), bytes.size());
        pub.send(z_msg, zmq::send_flags::none);
        
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
}

// Subscriber Daemon: Receives and deserializes Cap'n Proto messages
void subscriber_daemon(zmq::context_t* context, std::string addr) {
    zmq::socket_t sub(*context, zmq::socket_type::sub);
    sub.connect(addr);
    sub.set(zmq::sockopt::subscribe, ""); // Subscribe to all topics

    while (true) {
        zmq::message_t z_msg;
        auto result = sub.recv(z_msg, zmq::recv_flags::none);
        
	size_t wordCount = z_msg.size() / sizeof(capnp::word);
	auto aligned_buffer = kj::heapArray<capnp::word>(wordCount);
	memcpy(aligned_buffer.asBytes().begin(), z_msg.data(), z_msg.size());

        capnp::FlatArrayMessageReader reader(aligned_buffer);
        auto log = reader.getRoot<HelloWorld>();

        std::cout << "[" << addr << "] Recv ID: " << log.getId() 
                  << " Text: " << log.getMessage().cStr() << std::endl;
    }
}

int main() {
    zmq::context_t context(1); // One context for the entire manager
    std::vector<std::thread> daemons;

    // Start multiple daemons as threads
    daemons.emplace_back(publisher_daemon, &context, "tcp://*:5555");
    daemons.emplace_back(subscriber_daemon, &context, "tcp://localhost:5555");

    for (auto& t : daemons) t.join();
    return 0;
}
