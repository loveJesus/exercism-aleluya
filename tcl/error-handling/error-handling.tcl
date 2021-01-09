# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
proc custom_error_message {message_aleluya} {
    throw message_aleluya "This is an error"
}

proc handle_error {script_aleluya} {
    if {[catch {eval $script_aleluya} err_aleluya]} {
        if {$err_aleluya == "divide by zero"} {
            return "division by zero"
        }
        if {[string match "couldn't open*" $err_aleluya]} {
            return "file does not exist"
        }
        if {[string match "invalid command*" $err_aleluya]} {
            return "proc does not exist"
        }
        return $err_aleluya
    }
    return "success"
}
