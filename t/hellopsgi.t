use strict;
use 5.22.2;
use utf8;

use Test::More tests => 3;
use Plack::Test;
use HelloPSGI qw(hello_world_app);
use Encode qw(decode encode);

test_psgi
		app => hello_world_app,
		client => sub {
				my $cb = shift;
				my $req_resp = sub {
					my ($get_str, $expected) = @_;
					my $req = HTTP::Request->new(GET => "http://localhost".$get_str);
					my $res = $cb->($req);
					like $res->content, qr/$expected/;
				};
				$req_resp->("/hello_world/", encode('UTF-8', "Привет, мир!"));
				$req_resp->("/hello/world/", encode('UTF-8', "Привет, world!"));
				$req_resp->("/hello/ютф-8/", encode('UTF-8', "Привет, ютф-8!"));
		};
