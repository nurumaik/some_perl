package CamelCase;

use strict;
use 5.22.2;

use base 'Exporter';
our @EXPORT_OK = qw(fromCamelCase);

use String::CamelCase qw(decamelize);

sub fromCamelCase {
	my $in = shift;
	return decamelize($in);
}

1;
