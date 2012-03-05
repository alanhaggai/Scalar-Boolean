use strict;
use warnings;

package    #private
  Scalar::Boolean::Value;

my $true  = bless \do { ( my $data = 1 ) }, __PACKAGE__;
my $false = bless \do { ( my $data = 0 ) }, __PACKAGE__;

use overload
  '!'    => sub { ${ $_[0] } ? $false : $true },
  'bool' => sub { ${ $_[0] } },
  'eq'   => sub { ${ $_[0] } eq $_[1] ? $true : $false },
  '=='   => sub { ${ $_[0] } == $_[1] ? $true : $false };

sub boolean($) { $_[0] ? $true : $false }
sub true()     { $true }
sub false()    { $false }

1;
