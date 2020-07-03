package require Expect

namespace eval telnet {
}

proc telnet::connect {addr port} {
    send "telnet $addr $port\r"
    expect {
        "Escape character is '^]'." {
        }
        timeout { puts "Error timeout" }
    }
}

proc telnet::disconnect {} {
    send "\x1d"
    expect {
        "telnet> " {
            send "quit\r"
        }
    }
    expect $shell::prompt
}

