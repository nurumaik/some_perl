use strict;
use 5.22.2;

use Test::More tests => 9;

use CamelCase qw/fromCamelCase/;

sub checkCC {
	my ($input, $output) = @_;
	is(CamelCase::fromCamelCase($input), $output);
}

checkCC("camelCase", "camel_case");
checkCC("CamelCase", "camel_case");
checkCC("CamelCASE", "camel_case");
SKIP: {
	skip "Not really specified in task", 2;
	checkCC("CAMELfuckingCASE", "ca_m_e_lfucking_case");
	checkCC("CAMELkappaFUCKINGkappaCASE", "ca_m_e_lkappa_f_u_c_k_i_n_gkappa_case");
}
checkCC("ALLCAPS", "allcaps");
checkCC("", "");
checkCC("word", "word");
checkCC("someQuiteLongVariant", "some_quite_long_variant");
