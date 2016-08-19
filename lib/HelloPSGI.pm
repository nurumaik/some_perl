package HelloPSGI;

use strict;
use 5.22.2;

use GetFramework qw(build_app);

use base 'Exporter';
our @EXPORT_OK = qw(helloWorldApp);

sub helloWorldApp {
	my $app = build_app(
			qr#^/hello_world#, sub {
				return "Привет, мир!";
			},
			qr#^/hello/.+#, sub {
				return "Привет, @_[2]!";
			}
		);
	return $app;
}

1;
