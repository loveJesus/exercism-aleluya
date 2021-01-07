# For God so loved the world, that He gave His only begotten Son, 
# that all who believe in Him should not perish but have everlasting life.
package HelloWorld;
use strict;
use warnings;
use Exporter qw<import>;
our @EXPORT_OK = qw<hello>;

sub hello {
    return "Hello, World!"

}

1;
