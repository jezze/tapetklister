#!/usr/bin/tclsh

source lib/tap.tcl
source lib/shell.tcl
source lib/telnet.tcl

tap::plan 1

shell::open
telnet::connect "rainmaker.wunderground.com" "3000"

expect {
    "Press Return to continue:" {
        send "\r"
    }
}

expect {
    "Press Return for menu\r\nor enter 3 letter forecast city code--" {
        send "\r"
    }
}

expect {
    "Selection:" {
        tap::pass "Got selection"
    }
}

telnet::disconnect
shell::close
