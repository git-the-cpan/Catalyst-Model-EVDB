package Catalyst::Model::EVDB;

use strict;
use warnings;
use base qw/Catalyst::Model EVDB::API/;
use NEXT;

our $VERSION = '0.04';

=head1 NAME

Catalyst::Model::EVDB - EVDB model class for Catalyst

=head1 SYNOPSIS

    # Use the Catalyst helper
    script/myapp_create.pl model EVDB EVDB xxxxxxxxxxxxxxxx

    # lib/MyApp/Model/EVDB.pm
    package MyApp::Model::EVDB;

    use base qw/Catalyst::Model::EVDB/;

    __PACKAGE__->config(
        app_key => 'xxxxxxxxxxxxxxxx',
    );

    1;

    # In your controller
    my $args = {
        location => 'Gainesville, FL',
        keywords => 'tag:music',
    };

    my $evdb    = $c->model('EVDB');
    my $results = $evdb->call('events/search', $args)
        or die "Error searching for events: " . $evdb->errstr;

=head1 DESCRIPTION

This is the L<EVDB::API> model class for L<Catalyst>.  L<EVDB::API> is
a Perl interface to EVDB, the Events and Venues Database.

Please note that EVDB API methods require an application key.

For more information on EVDB, or to obtain an application key, see
L<http://api.evdb.com/>.

=head1 METHODS

=head2 new

Create a new EVDB model component, using C<app_key> as specified in
your configuration.

=cut

sub new {
    my ($class, $c, $config) = @_;

    # From Catalyst::Model::Gedcom
    my $self = $class->EVDB::API::new(%{ $class->NEXT::new($c, $config) });
    $self->config($config);

    return $self;
}

=head2 errstr

Return the EVDB API error message.

=cut

sub errstr {
    my ($self) = @_;

    return $EVDB::API::errstr;
}

=head1 AUTHOR

Daniel Westermann-Clark E<lt>danieltwc@cpan.orgE<gt>

=head1 ACKNOWLEDGEMENTS

=over 4

=item * Brian Cassidy, for clever C<new> code

=back

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
