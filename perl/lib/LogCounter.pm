package LogCounter;
use strict;
use warnings;
use Data::Dumper;

sub new {
    my ($class, $logs) = @_;
    return bless { logs => $logs }, $class;
};

sub group_by_user {
    my $self = shift;
    my $obj={};
    my $user;
    my $value;
    for(my $i=0 ; $i < scalar(@{$self->{logs}}) ; $i++){
        $user = $self->{logs}->[$i]->{user};
        if(defined$user){
            $value = $self->{logs}->[$i];
            push(@{$obj->{$user}} , $value);
            delete($self->{logs}->[$i]->{user});
        }
    }
    return $obj;
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
