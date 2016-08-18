use strict;
use 5.22.2;

use Test::More tests => 3;
use Plack::Test;
use HelloPSGI qw(helloWorldApp);

test_psgi
		app => helloWorldApp,
		client => sub {
				my $cb = shift;
				my $req_resp = sub {
					my ($get_str, $expected) = @_;
					my $req = HTTP::Request->new(GET => "http://localhost".$get_str);
					my $res = $cb->($req);
					like $res->content, qr/$expected/;
				};
				$req_resp->("/hello_world/", "Привет, мир!");
				$req_resp->("/hello/world/", "Привет, world!");
				$req_resp->("/hello/ютф-8/", "Привет, ютф-8!");
		};
