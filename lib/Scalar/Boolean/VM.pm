use strict;
use warnings;

package Scalar::Boolean::VM;

use Variable::Magic qw( wizard cast dispell );

sub fixer {
    my $ref = $_[0];
    $$ref = $$ref ? 1 : 0;
}

my $wiz = wizard
  'set' => \&fixer,
  'get' => \&fixer;

sub booleanise {
    cast $_, $wiz for @_;
}

sub unbooleanise {
    dispell $_, $wiz for @_;
}

1;
