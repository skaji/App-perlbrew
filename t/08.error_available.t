#!/usr/bin/env perl
use strict;
use warnings;
use lib qw(lib);
use App::perlbrew;
use Test::More;
use Test::Exception;

no warnings 'redefine';
sub HTTP::Tinyish::get { +{ success => 0 } }

throws_ok(
    sub {
        my $app = App::perlbrew->new("available");
        $app->run;
    },
    qr[ERROR: Unable to retrieve the list of perls.]
);

done_testing;
