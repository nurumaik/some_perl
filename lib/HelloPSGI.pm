package HelloPSGI;

use strict;
use 5.22.2;
use utf8;

use GetFramework qw(build_app);
use Encode qw(decode encode);

use base 'Exporter';
our @EXPORT_OK = qw(hello_world_app);

sub hello_world_app {
	my $app = build_app(
			qr#^/hello_world#, sub {
				return "Привет, мир!";
			},
			qr#^/hello/.+#, sub {
				my $name = decode('UTF-8', @_[2]);
				return "Привет, $name!";
			}
		);
	return $app;
}

1;
