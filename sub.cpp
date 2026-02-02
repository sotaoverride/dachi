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
        zmq::message_t zmq_msg;
        auto res = subscriber.recv(zmq_msg, zmq::recv_flags::none);

        // Map ZMQ buffer to Cap'n Proto reader
        kj::ArrayPtr<const capnp::word> segments(
            reinterpret_cast<const capnp::word*>(zmq_msg.data()),
            zmq_msg.size() / sizeof(capnp::word)
        );

        capnp::FlatArrayMessageReader reader(segments);
        auto hello = reader.getRoot<HelloWorld>();

        std::cout << "Received ID: " << hello.getId() 
                  << " Message: " << hello.getMessage().cStr() << std::endl;
    }
    return 0;
}

