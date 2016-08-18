package CamelCase;

use strict;
use 5.22.2;

use base 'Exporter';
our @EXPORT_OK = qw(fromCamelCase);

sub fromCamelCase {
	my $in = shift;
	return $in;
}

1;
