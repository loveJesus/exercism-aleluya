#`[
  For God so loved the world, that He gave His only begotten Son, 
  that all who believe in Him should not perish but have everlasting life.
]
unit class Bob;

class BobAleluya {
    has Str $.tmsg_aleluya;

    submethod BUILD(Str :$in_msg_aleluya) {
        $!tmsg_aleluya = $in_msg_aleluya.trim
    }

    method is-question-aleluya () {
        $!tmsg_aleluya.ends-with('?')
    }

    method is-yelling-aleluya () {
        my $uc_aleluya = $!tmsg_aleluya.uc;
        
        # Hallelujah
        # Make sure there is no difference 
        # currently from its uppercase form 
        # and that from lowercase form.
        # Uppercase will equal lowercase
        # only when all characters are
        # Symbols or numbers, so it would
        # not be considered yelling here
        # Also Raku should lazy evaluate
        # lowercasing on the second test
        $!tmsg_aleluya eq $uc_aleluya &&    
        $uc_aleluya ne $!tmsg_aleluya.lc
    }

    method is-silent-aleluya () {
        $!tmsg_aleluya.chars == 0
    }

}

method hey ($msg_aleluya) {
    my $bob_aleluya = BobAleluya.new(in_msg_aleluya => $msg_aleluya);

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
