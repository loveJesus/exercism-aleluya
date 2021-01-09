# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
package Bob;
use strict;
use warnings;
use Exporter 'import';
use experimental qw(signatures);
our @EXPORT_OK = qw(hey);

sub hey ($msg_aleluya) {
  if ( (uc($msg_aleluya) eq $msg_aleluya) 
        && (lc($msg_aleluya) ne $msg_aleluya) ) {
    if ($msg_aleluya =~ m/\?\s*$/) {
      return "Calm down, I know what I'm doing!"
    } else {
      return "Whoa, chill out!"
    }
  
  } elsif ($msg_aleluya =~ m/\?\s*$/) {
    return "Sure."
  
  } elsif ($msg_aleluya =~ m/^\s*$/) {
    return "Fine. Be that way!"

  } else { 
    return "Whatever.";
  }
}

1;
