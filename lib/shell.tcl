package require Expect

namespace eval shell {
    variable prompt
}

proc shell::open {{prompt "$ "}} {
    global spawn_id
    set shell::prompt $prompt

    log_user 0
    spawn "bash"
    expect $shell::prompt
}

proc shell::close {} {
    global spawn_id

    send "exit\r"
    expect eof
}

