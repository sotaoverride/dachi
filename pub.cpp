#include <zmq.hpp>
#include <capnp/serialize.h>
#include "schema.capnp.h"
#include <iostream>
#include <chrono> // Added for sleep
#include <thread> // Added for sleep

int main() {
    zmq::context_t context(1);
    zmq::socket_t publisher(context, zmq::socket_type::pub);
    publisher.bind("tcp://*:5555");

    uint32_t id = 0;
    while (true) {
        ::capnp::MallocMessageBuilder message;
        HelloWorld::Builder hello = message.initRoot<HelloWorld>();
        hello.setId(id++);
        hello.setMessage("Hello from Cap'n Proto!");

        // Serialize to flat array
        auto words = capnp::messageToFlatArray(message);
        auto bytes = words.asBytes();

        zmq::message_t zmq_msg(bytes.begin(), bytes.size());
        publisher.send(zmq_msg, zmq::send_flags::none);
        
        std::cout << "Sent ID: " << id-1 << std::endl;
        std::this_thread::sleep_for(std::chrono::seconds(1));
    }
    return 0;
}

