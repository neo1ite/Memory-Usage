use strict;
use warnings;

use Test::More tests => 3;                      # last test to print

use Memory::Usage;

my $mu = Memory::Usage->new;

isa_ok $mu => 'Memory::Usage', 'new()';

$mu->record( 'first milestone' );

my $report = $mu->report;

ok $report, 'report()';

my $dump;
{
    local *STDERR;
    open STDERR, '>', \$dump;;

    $mu->dump;
}

is $dump => $report, 'dump()';



