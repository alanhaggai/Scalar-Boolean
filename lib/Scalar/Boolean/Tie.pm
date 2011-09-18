use strict;
use warnings;

package    #private
  Scalar::Boolean::Tie;

use Tie::Scalar;
use base qw( Tie::StdScalar );

use Scalar::Boolean::Value;

sub STORE {
    my ( $ref, $value ) = @_;
    $$ref =
      $value
      ? Scalar::Boolean::Value::true
      : Scalar::Boolean::Value::false;
    return;
}

sub TIESCALAR {
    my ( $class, $value ) = @_;
    $value =
      $value
      ? Scalar::Boolean::Value::true
      : Scalar::Boolean::Value::false;
    return bless \$value, $class;
}

sub booleanise(\$;\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$) {
    tie $$_, __PACKAGE__, $$_ for @_;
    return;
}

sub unbooleanise(\$;\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$\$) {
    untie $$_ for @_;
    return;
}

1;
