#!/usr/bin/env perl
use strict;
use warnings;

use FindBin;
use lib $FindBin::Bin;
use App::perlbrew;
require 'test_helpers.pl';

use Test::More;
use Test::Exception;
use Path::Class;

use App::perlbrew;
{
    no warnings 'redefine';
    sub HTTP::Tinyish::mirror { +{ success => 0 } }
}

throws_ok(
    sub {
        my $app = App::perlbrew->new("install", "perl-blead");
        $app->run;
    },
    qr[ERROR: Failed to download perl-blead tarball.]
);

throws_ok(
    sub {
        my $app = App::perlbrew->new("install", "blead");
        $app->run;
    },
    qr[ERROR: Failed to download perl-blead tarball.]
);

done_testing;
