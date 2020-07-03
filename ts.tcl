#!/usr/bin/tclsh

proc run {testcase} {
    puts "\033\[1;33m# TESTCASE $testcase\033\[0m"
    source $testcase

    if {$tap::executed == $tap::passed} {
        puts "\033\[32mPASSED\033\[0m"
    } else {
        puts "\033\[31mFAILED\033\[0m"
    }

    puts "# exec $tap::executed"
    puts "# pass $tap::passed"
    puts "# fail $tap::failed"
}

run "tc-01.tcl"
puts ""
run "tc-01.tcl"
puts ""
run "tc-02.tcl"
