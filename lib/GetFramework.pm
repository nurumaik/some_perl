package GetFramework;

use strict;
use 5.22.2;

use base 'Exporter';
our @EXPORT_OK = qw(build_app);

sub build_app {
	my @params = @_;
	return sub {
		my $env = shift;
		my $i = 0;
		while ($i < @params) {
			if ($env->{PATH_INFO} =~ $params[$i]) {
				return [
					'200',
					[ 'Content-Type' => 'text/plain' ],
					[ $params[$i+1]->(split(qr#/#, $env->{PATH_INFO})) ]
				];
			}
			$i += 2;
		}
		return [
			'404',
			['Content-Type' => 'text/plain'],
			['404']
		];
	}
}
