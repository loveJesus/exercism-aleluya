# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
package TwoFer;
use strict;
use warnings;
use Exporter 'import';
use experimental qw(signatures);
our @EXPORT_OK = qw(two_fer);

sub two_fer ($name_aleluya = "you") { 
    return "One for $name_aleluya, one for me."
}
1;

