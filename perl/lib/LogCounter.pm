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
    my $self = shift;
    my $errorCounter=0;
    for(my $i=0 ; $i <scalar(@{$self->{logs}}) ; $i++){
        my $status = $self->{logs}->[$i]->{status};
        if($status>= 500){
            $errorCounter++;
        }
    }
    return $errorCounter;
}

1;
