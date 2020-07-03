#!/usr/bin/tclsh

source lib/tap.tcl
source lib/shell.tcl

tap::plan 8

shell::open

send "date\r"
expect {
    "AM" { tap::pass "It is morning" }
    "PM" { tap::pass "It is evening" }
    $shell::prompt { tap::fail "Did not get either AM or PM" }
    timeout { tap::fail "Timeout waiting for date" }
}

tap::fail "Just testing"
tap::pass "Just testing"
tap::pass "Just testing"
tap::pass "Just testing"
tap::pass "Just testing"
tap::pass "Just testing"
tap::pass "Just testing"

shell::close
