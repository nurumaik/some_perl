package GetFramework;

use strict;
use 5.22.2;
use utf8;

use Encode qw(decode encode);

use base 'Exporter';
our @EXPORT_OK = qw(build_app);

sub build_app {
	my @params = @_;
	return sub {
		my $env = shift;
		my $i = 0;
		while ($i < @params) {
			if ($env->{PATH_INFO} =~ $params[$i]) {
				my $resp_text = encode('UTF-8',
				 $params[$i+1]->(split(qr#/#, $env->{PATH_INFO})));
				return [
					'200',
					[ 'Content-Type' => 'text/plain; charset=UTF-8' ],
					[$resp_text]
				];
			}
			$i += 2;
		}
		return [
			'404',
			['Content-Type' => 'text/plain; charset=UTF-8'],
			['404']
		];
	}
}
