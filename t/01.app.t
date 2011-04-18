#!perl

use strict;
use warnings;

use Test::More 'tests' => 13;
use Scalar::Boolean;

booleanise my $value;

$value = 'true';
is( $value, 1, q/'true' is 1/ );

$value = 'false';
is( $value, 1, q/'false' is 1/ );

$value = 0;
is( $value, 0, q/0 is 0/ );

$value = '0';
is( $value, 0, q/'0' is 0/ );

$value = undef;
is( $value, 0, q/undef is 0/ );

$value = '';
is( $value, 0, q/'' is 0/ );

$value = ();
is( $value, 0, q/() is 0/ );

$value = ('');
is( $value, 0, q/('') is 0/ );

$value = \0;
is( $value, 1, q/\0 is 1/ );

$value = \1;
is( $value, 1, q/\1 is 1/ );

$value = [];
is( $value, 1, q/[] is 1/ );

$value = {};
is( $value, 1, q/{} is 1/ );

unbooleanise $value;

$value = 'unbooleanised value';
is( $value, 'unbooleanised value', q/'unbooleanised value' is 'unbooleanised value'/ );
