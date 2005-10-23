package Catalyst::Helper::Model::EVDB;

use strict;

=head1 NAME

Catalyst::Helper::Model::EVDB - Helper for EVDB models

=head1 SYNOPSIS

  script/myapp_create.pl model EVDB EVDB xxxxxxxxxxxxxxxx

=head1 DESCRIPTION

Helper for the C<Catalyst> EVDB model.

=head1 METHODS

=head2 mk_compclass

Makes the EVDB model class.

=cut

sub mk_compclass {
    my ($self, $helper, $app_key) = @_;

    $helper->{app_key} = $app_key || '';

    $helper->render_file('modelclass', $helper->{file});

    return 1;
}

=head2 mk_comptest

Makes tests for the EVDB model.

=cut

sub mk_comptest {
    my ($self, $helper) = @_;

    $helper->render_file('modeltest', $helper->{test});
}

=head1 SEE ALSO

L<Catalyst::Manual>, L<Catalyst::Test>, L<Catalyst::Helper>

=head1 AUTHOR

Daniel Westermann-Clark E<lt>danieltwc@cpan.orgE<gt>

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;


__DATA__

__modelclass__
package [% class %];

use strict;
use base 'Catalyst::Model::EVDB';

__PACKAGE__->config(
    app_key => '[% app_key %]',
);

=head1 NAME

[% class %] - EVDB Catalyst model component

=head1 SYNOPSIS

See L<[% app %]>.

=head1 DESCRIPTION

EVDB Catalyst model component.

=head1 AUTHOR

[% author %]

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
__modeltest__
use Test::More tests => 2;
use_ok(Catalyst::Test, '[% app %]');
use_ok('[% class %]');
