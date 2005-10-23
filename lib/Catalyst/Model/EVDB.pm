package Catalyst::Model::EVDB;

use base qw/Catalyst::Base EVDB::API/;
use strict;
use warnings;
use NEXT;

our $VERSION = '0.01';

=head1 NAME

Catalyst::Model::EVDB - EVDB Catalyst model component

=head1 SYNOPSIS

  # Use the Catalyst helper
  script/myapp_create.pl model EVDB EVDB xxxxxxxxxxxxxxxx

  # lib/MyApp/Model/People.pm
  package MyApp::Model::EVDB;

  use base qw/Catalyst::Model::EVDB/;

  __PACKAGE__->config(
      app_key => 'xxxxxxxxxxxxxxxx',
  );

  1;

  my $args = {
      location => 'Gainesville, FL',
      keywords => 'tag:music',
  };

  # As object method
  my $events = $c->comp('M::EVDB')->call('events/search', $args)
      or die "Error searching for events: " . $evdb->error;

  # As class method
  my $events = MyApp::Model::EVDB->call('events/search', $args)
      or die "Error searching for events: " . $evdb->error;

=head1 DESCRIPTION

This is the L<EVDB::API> model class for L<Catalyst>.  L<EVDB::API> is
a Perl interface to EVDB, the Events and Venues Database.

Please note that EVDB API methods require an application key.

For more information on EVDB, or to obtain an application key, see
L<http://api.evdb.com/>.

=head1 METHODS

=head2 new

Create a new EVDB API object, using C<app_key> as specified in your
configuration.

=cut

sub new {
    my ($class, $c, $options) = @_;

    return $class->EVDB::API::new(%{ $class->NEXT::new($c, $options) });
}

=head2 error

Return the EVDB API error message.

=cut

sub error {
    my ($class) = @_;

    return $EVDB::API::errstr;
}

=head1 AUTHOR

Daniel Westermann-Clark E<lt>danieltwc@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 SEE ALSO

=over 4

=item * L<Catalyst>

=item * L<EVDB::API>

=back

=cut

1;
