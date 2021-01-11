# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.

proc abbreviate {phrase_aleluya} {
    set re_tospace_aleluya {[^a-zA-Z']}

    set clean_phrase_aleluya [
        regsub -all $re_tospace_aleluya $phrase_aleluya " "]
    
    set words_aleluya [
        split $clean_phrase_aleluya]

    set abbr_aleluya ""

    foreach word_aleluya $words_aleluya {
        set letter_aleluya [
            string index $word_aleluya 0]
            
        append abbr_aleluya $letter_aleluya
    }

    return [string toupper $abbr_aleluya]
}
