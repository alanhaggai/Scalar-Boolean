use strict;
use warnings;

BEGIN {
    *Scalar::Boolean::booleanize   = \&Scalar::Boolean::booleanise;
    *Scalar::Boolean::unbooleanize = \&Scalar::Boolean::unbooleanise;
}

package Scalar::Boolean;

# ABSTRACT: Makes scalar variables store Boolean values only

use base 'Exporter';
our @EXPORT = qw( booleanise booleanize unbooleanise unbooleanize );

use Tie::Scalar;
use base 'Tie::StdScalar';

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

__END__

=encoding utf-8

=head1 SYNOPSIS

    booleanize my $value;  # you can even use `booleanise`
    $value = [];       # $value gets set to 1
    $value = 'Perl';   # $value gets set to 1
    $value = '';       # $value gets set to 0
    $value = '0';      # $value gets set to 0
    $value = undef;    # $value gets set to 0
    $value = ();       # $value gets set to 0

    unbooleanise $value;  # same as unbooleanize
    $value = [];  # $value gets set to []
    …

=method C<booleanise> or C<booleanize>

Accepts scalar variables which will be booleani{s|z}ed. Once booleani{s|z}ed,
the variable will convert all values that are assigned to it to their
corresponding Boolean values. No effect on already booleani{s|z}ed variables.

=method C<unbooleanise> or C<unbooleanize>

Accepts scalar variables which will be unbooleani{s|z}ed if already
booleani{s|z}ed. No effect if variables passed are not booleanised already.
