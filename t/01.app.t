#!perl

use strict;
use warnings;

use Test::More 'tests' => 13;
use Scalar::Boolean;

booleanise my $foo;

$foo = 'true';
is( $foo, 1, q/'true' is 1/ );

$foo = 'false';
is( $foo, 1, q/'false' is 1/ );

$foo = 0;
is( $foo, 0, q/0 is 0/ );

$foo = '0';
is( $foo, 0, q/'0' is 0/ );

$foo = undef;
is( $foo, 0, q/undef is 0/ );

$foo = '';
is( $foo, 0, q/'' is 0/ );

$foo = ();
is( $foo, 0, q/() is 0/ );

$foo = ('');
is( $foo, 0, q/('') is 0/ );

$foo = \0;
is( $foo, 1, q/\0 is 1/ );

$foo = \1;
is( $foo, 1, q/\1 is 1/ );

$foo = [];
is( $foo, 1, q/[] is 1/ );

$foo = {};
is( $foo, 1, q/{} is 1/ );

unbooleanise $foo;

$foo = 'unbooleanised foo';
is( $foo, 'unbooleanised foo', q/'unbooleanised foo' is 'unbooleanised foo'/ );
