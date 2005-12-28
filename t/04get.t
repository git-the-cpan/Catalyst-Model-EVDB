use strict;
use warnings;
use Test::More;

use FindBin;
use lib "$FindBin::Bin/lib";
use TestApp::Model::EVDB;

plan skip_all => 'set EVDB_APP_KEY to enable this test' unless $ENV{EVDB_APP_KEY};
plan tests => 4;

TestApp::Model::EVDB->config(
    app_key => $ENV{EVDB_APP_KEY},
);

ok(my $evdb = TestApp::Model::EVDB->new, 'created model class');

my $ID    = 'E0-001-000278174-6';
my $TITLE = 'Martini Tasting';

my $results = $evdb->call('events/get', { id => $ID });
ok($results, 'got results');
is($results->{id}, $ID, 'event ID matches');
is($results->{title}, $TITLE, 'event title matches');
