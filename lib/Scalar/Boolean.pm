use strict;
use warnings;

# ABSTRACT: Makes scalar variables store Boolean values only
package Scalar::Boolean;

use base qw( Exporter );
our @EXPORT = qw( booleanise booleanize unbooleanise unbooleanize boolean );

my $use_variable_magic = 1;

eval {
    require Variable::Magic;
};
if ($@) {
    $use_variable_magic = 0;
}

if ($use_variable_magic) {
    require Scalar::Boolean::VM;

    *booleanise   = *Scalar::Boolean::VM::booleanise;
    *unbooleanise = *Scalar::Boolean::VM::unbooleanise;
}
else {
    require Scalar::Boolean::Tie;

    *booleanise   = *Scalar::Boolean::Tie::booleanise;
    *unbooleanise = *Scalar::Boolean::Tie::unbooleanise;
}

*booleanize   = *booleanise;
*unbooleanize = *unbooleanise;
*boolean      = *Scalar::Boolean::Value::boolean;

1;

__END__

=head1 SYNOPSIS

    use Scalar::Boolean;

    booleanize my $value;  # you can even use `booleanise`
    $value = [];       # $value gets set to 1
    $value = 'Perl';   # $value gets set to 1
    $value = '';       # $value gets set to 0
    $value = '0';      # $value gets set to 0
    $value = undef;    # $value gets set to 0
    $value = ();       # $value gets set to 0

    unbooleanise $value;  # same as `unbooleanize`
    $value = 'foo';  # $value gets set to 'foo'

=method C<booleanise> or C<booleanize>

Accepts scalar variables which will be C<booleanise>d. Once C<booleanise>d,
the variable will convert all values that are assigned to it to their
corresponding Boolean values. No effect on already C<booleanise>d variables.

=method C<unbooleanise> or C<unbooleanize>

Accepts scalar variables which will be C<unbooleanise>d if already
C<booleanise>d. No effect on not already C<booleanise>d variables.

=method C<boolean>

Accepts a single value and returns its boolean value without affecting its
original value.

=head1 ACKNOWLEDGEMENT

Many thanks to B<Eric Brine> (B<ikegami>) for suggesting several improvements, for
valuable suggestions and also for sending sample code. Thank you Eric! :-)
