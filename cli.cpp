#include <capnp/serialize.h>
#include "schema.capnp.h"
#include <iostream>
#include <chrono>
#include <thread>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <ctype.h>
#include <zmq.hpp>
#include "ketopt.h"

// --- Command Structure ---
typedef struct {
    const char *name;
    const char *desc;
    void (*func)(int argc, char **argv);
} command_t;

// --- Command Handlers ---
void cmd_status(int argc, char **argv) {
    printf("[INTERNAL] System Status: Online\n");
    printf("[INTERNAL] Logic processing active...\n");
}

void cmd_config(int argc, char **argv) {
    ketopt_t opt = KETOPT_INIT;
    int c;
    char *key = NULL, *val = NULL;

    // ketopt works inside the handler for sub-arguments
    while ((c = ketopt(&opt, argc, argv, 1, "k:v:", NULL)) >= 0) {
        if (c == 'k') key = opt.arg;
        else if (c == 'v') val = opt.arg;
    }

    if (key && val) {
        printf("Setting changed: %s = %s\n", key, val);
    } else {
        printf("Usage: config -k <key> -v <value>\n");
    }
}

int id=0;
void cmd_pub(int argc, char **argv) {
    zmq::context_t context(1);
    zmq::socket_t publisher(context, zmq::socket_type::pub);
    publisher.bind("tcp://*:5555");
    ketopt_t opt = KETOPT_INIT;
    int c;
    char *key = NULL, *val = NULL;

    // ketopt works inside the handler for sub-arguments
    while ((c = ketopt(&opt, argc, argv, 1, "k:v:", NULL)) >= 0) {
        if (c == 'k') key = opt.arg;
        else if (c == 'v') val = opt.arg;
    }

    if (key && val) {
//	while(1){
        printf("Setting changed: %s = %s\n", key, val);
	printf("Cap'n publisher %s = %s\n", key, val);
	capnp::MallocMessageBuilder message;
	HelloWorld::Builder hello = message.initRoot<HelloWorld>();
	hello.setId(id++);
	hello.setMessage(val);
	auto words = capnp::messageToFlatArray(message);
	auto bytes = words.asBytes();
	zmq::message_t zmq_msg(bytes.begin(), bytes.size());
	sleep(1);
	publisher.send(zmq_msg, zmq::send_flags::none);
	printf("send ID: %i \n", id-1);
  //  }
    } else {
        printf("Usage: config -k <key> -v <value>\n");
    }
}
void cmd_help(int argc, char **argv);

command_t cmd_table[] = {
    {"helloworld", "Captain pusblisher for hellowworld", cmd_pub},
    {"status", "Show current system status", cmd_status},
    {"config", "Update settings (config -k key -v val)", cmd_config},
    {"help",   "Show this help menu", cmd_help},
    {"exit",   "Close the interactive console", NULL} // Handled in loop
};
#define CMD_COUNT (sizeof(cmd_table) / sizeof(command_t))

void cmd_help(int argc, char **argv) {
    printf("Interactive Console Commands:\n");
    for (int i = 0; i < CMD_COUNT; i++) {
        printf("  %-10s %s\n", cmd_table[i].name, cmd_table[i].desc);
    }
}

// --- Tokenizer ---
int tokenize(char *line, char **argv) {
    int argc = 0;
    char *p = line;
    while (*p && argc < 32) {
        while (isspace(*p)) p++;
        if (!*p) break;
        argv[argc++] = p;
        while (*p && !isspace(*p)) p++;
        if (*p) { *p = '\0'; p++; }
    }
    return argc;
}

// --- Main Interactive Loop ---
void run_console() {
    char line[1024];
    char *argv[32];

    printf("Welcome to Interactive Mode. Type 'help' for options.\n");

    while (1) {
        printf("console> ");
        fflush(stdout);

        if (!fgets(line, sizeof(line), stdin)) break;
        
        int argc = tokenize(line, argv);
        if (argc == 0) continue;

        if (strcmp(argv[0], "exit") == 0) break;

        int found = 0;
        for (int i = 0; i < CMD_COUNT; i++) {
            if (strcmp(argv[0], cmd_table[i].name) == 0) {
                if (cmd_table[i].func) cmd_table[i].func(argc, argv);
                found = 1;
                break;
            }
        }

        if (!found) {
            printf("Unknown command: %s\n", argv[0]);
        }
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

int main(int argc, char *argv[]) {
    // Note: ketopt could still be used here for initial app-wide startup flags
    // e.g., ./myprog -v (verbose mode)
    zmq::context_t context(1); // One context for the entire manager
    std::vector<std::thread> daemons;
    // Start multiple daemons as threads
    daemons.emplace_back(subscriber_daemon, &context, "tcp://localhost:5555");
    //for (auto& t : daemons) t.create();
    run_console();
    return 0;
}

