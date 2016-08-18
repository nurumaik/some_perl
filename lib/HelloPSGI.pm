package HelloPSGI;

use strict;
use 5.22.2;

use base 'Exporter';
our @EXPORT_OK = qw(helloWorldApp);

sub helloWorldApp {
	# "Copying and pasting from stackoverflow: the definitive guide"
	my $app = sub {
		my $env = shift;
		return [
			'200',
			[ 'Content-Type' => 'text/plain' ],
			[ "Hello World" ], # or IO::Handle-like object
		];
	};
	return $app;
}

1;
