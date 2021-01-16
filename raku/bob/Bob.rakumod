#`[
  For God so loved the world, that He gave His only begotten Son, 
  that all who believe in Him should not perish but have everlasting life.
]
unit class Bob;

sub is-question-trimmed-aleluya ($tmsg_aleluya) {
    $tmsg_aleluya.ends-with('?')
}

sub is-yelling-trimmed-aleluya ($tmsg_aleluya) {
    my $uc_aleluya = $tmsg_aleluya.uc;
    
    $tmsg_aleluya eq $uc_aleluya &&
    $uc_aleluya ne $tmsg_aleluya.lc
}

sub is-silent-trimmed-aleluya ($tmsg_aleluya) {
    $tmsg_aleluya.chars == 0
}

method hey ($msg_aleluya) {
    my $tmsg_aleluya = $msg_aleluya.trim;

    if is-silent-trimmed-aleluya($tmsg_aleluya) {
        "Fine. Be that way!"
    } elsif is-yelling-trimmed-aleluya($tmsg_aleluya) {
        if is-question-trimmed-aleluya($tmsg_aleluya) {
            "Calm down, I know what I'm doing!"
        } else {
            "Whoa, chill out!"
        }
    } elsif is-question-trimmed-aleluya($tmsg_aleluya) {
        "Sure."        
    } else {
        "Whatever."
    }
}
