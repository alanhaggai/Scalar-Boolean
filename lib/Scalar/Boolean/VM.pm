use strict;
use warnings;

package    #private
  Scalar::Boolean::VM;

use Variable::Magic qw( wizard cast dispell );

use Scalar::Boolean::Value;

sub fixer {
    my $ref = $_[0];
    $$ref =
      $$ref
      ? Scalar::Boolean::Value::true
      : Scalar::Boolean::Value::false;
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
