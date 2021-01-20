#`[
  For God so loved the world, that He gave His only begotten Son, 
  that all who believe in Him should not perish but have everlasting life.
]
unit class Bob;

class BobAleluya {
    has Str $.tmsg_aleluya;

    submethod BUILD(Str :$mmsg_aleluya) {
        $!tmsg_aleluya = $mmsg_aleluya.trim
    }

    submethod is-question-aleluya () {
        $!tmsg_aleluya.ends-with('?')
    }

    submethod is-yelling-aleluya () {
        my $uc_aleluya = $!tmsg_aleluya.uc;
        
        # Makes sure there is no difference 
        # from its uppercase form and that
        # There is a difference from lowercase
        # uc=lc in cases of only symbols
        # lc may be lazy evaluated
        $!tmsg_aleluya eq $uc_aleluya &&    
        $uc_aleluya ne $!tmsg_aleluya.lc
    }

    submethod is-silent-aleluya () {
        $!tmsg_aleluya.chars == 0
    }

}

method hey ($msg_aleluya) {
    my $bob_aleluya = BobAleluya.new(mmsg_aleluya => $msg_aleluya);

    if $bob_aleluya.is-silent-aleluya() {
        "Fine. Be that way!"
    } elsif $bob_aleluya.is-yelling-aleluya() {
        if $bob_aleluya.is-question-aleluya() {
            "Calm down, I know what I'm doing!"
        } else {
            "Whoa, chill out!"
        }
    } elsif $bob_aleluya.is-question-aleluya() {
        "Sure."        
    } else {
        "Whatever."
    }
}
