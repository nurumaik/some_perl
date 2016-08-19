package CamelCase;

use strict;
use 5.22.2;

use base 'Exporter';
our @EXPORT_OK = qw(from_camel_case);

use String::CamelCase qw(decamelize);

sub from_camel_case {
	my $in = shift;
	return decamelize($in);
}

1;
