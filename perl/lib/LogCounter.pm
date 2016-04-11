package LogCounter;
use strict;
use warnings;
use Data::Dumper;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub group_by_user {
}

sub count_error {
    my $logs = shift;
    print Dumper $logs;
    return 2;
}

1;
