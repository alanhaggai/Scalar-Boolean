use strict;
use warnings;

package Scalar::Boolean::Tie;

use Tie::Scalar;

use base qw( Tie::StdScalar );

sub STORE {
    my ( $ref, $value ) = @_;
    $$ref = $value ? 1 : 0;
    return;
}

sub TIESCALAR {
    my ( $class, $value ) = @_;
    $value = $value ? 1 : 0;
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
