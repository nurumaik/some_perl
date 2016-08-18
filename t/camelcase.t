use strict;
use 5.22.2;

use Test::More tests => 8;

use CamelCase qw/fromCamelCase/;

sub checkCC {
	my ($input, $output) = @_;
	is(CamelCase::fromCamelCase($input), $output);
}

checkCC("camelCase", "camel_case");
checkCC("CamelCase", "camel_case");
checkCC("CamelCASE", "camel_case");
checkCC("CAMELfuckingCASE", "ca_m_e_l_fucking_case");
checkCC("ALLCAPS", "allcaps");
checkCC("", "");
checkCC("word", "word");
checkCC("someQuiteLongVariant", "some_quite_long_variant");
