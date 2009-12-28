package BackPAN::Index::Dist;

use strict;
use warnings;

use parent qw(DBIx::Class::Core);

use CLASS;

CLASS->table("distributions");
CLASS->add_columns("name");
CLASS->set_primary_key("name");
CLASS->has_many( releases => "BackPAN::Index::Release", "dist" );

1;

__END__

=head1 NAME

BackPAN::Index::Dist - Representing a distribution on BackPAN

=head1 DESCRIPTION

=head2 releases

A ResultSet of this distribution's releases.

=head2 name

Name of the distribution.

=cut

1;