
package Parser;
use utf8;
use strict;

sub new{
    my $class = shift;
    my $self = {
        filename    => '',
        @_,
    };
    return bless $self, $class;
};

sub parse{
    my $self = shift;
    open my $fh, '<', $self->{filename} or die $!;
    my @lines = <$fh>;
    my @rowEach;
    my @keyValue;
    my $array=[];

    for(my $i = 0 ; $i < $#lines+1 ; $i++){
        @rowEach = split(/\t/,$lines[$i]);
        for(my $j =0 ; $j < $#rowEach+1 ; $j++){
            @keyValue = split(":",$rowEach[$j],2);
            $keyValue[1]=~ s/\n//;
            if($keyValue[1] ne '-'){
                $array->[$i]->{$keyValue[0]} = $keyValue[1];
            }
        }
        bless $array->[$i],'Log'
    }

    return $array;
};

1;

