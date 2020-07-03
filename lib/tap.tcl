namespace eval tap {
    variable total
    variable executed
    variable passed
    variable failed
}

proc tap::plan {total} {
    set tap::total $total
    set tap::executed 0
    set tap::passed 0
    set tap::failed 0

    puts "1..$tap::total"
}

proc tap::pass {{msg ""}} {
    incr tap::executed
    incr tap::passed
    set result "ok $tap::executed"

    if {$msg != ""} {
        append result " - $msg"
    }

    puts "\033\[32m$result\033\[0m"
}

proc tap::fail {{msg ""}} {
    incr tap::executed
    incr tap::failed
    set result "not ok $tap::executed"

    if {$msg != ""} {
        append result " - $msg"
    }

    puts "\033\[31m$result\033\[0m"
}

