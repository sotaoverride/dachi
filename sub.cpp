#include <zmq.hpp>
#include <capnp/serialize.h>
#include "schema.capnp.h"
#include <iostream>

int main() {
    zmq::context_t context(1);
    zmq::socket_t subscriber(context, zmq::socket_type::sub);
    subscriber.connect("tcp://localhost:5555");
    subscriber.set(zmq::sockopt::subscribe, "");

    while (true) {
        zmq::message_t z_msg;
        auto result = subscriber.recv(z_msg, zmq::recv_flags::none);
        
	size_t wordCount = z_msg.size() / sizeof(capnp::word);
	auto aligned_buffer = kj::heapArray<capnp::word>(wordCount);
	memcpy(aligned_buffer.asBytes().begin(), z_msg.data(), z_msg.size());

        capnp::FlatArrayMessageReader reader(aligned_buffer);
        auto log = reader.getRoot<HelloWorld>();

        std::cout << "["  << "] Recv ID: " << log.getId() 
                  << " Text: " << log.getMessage().cStr() << std::endl;
    }
    return 0;
}

