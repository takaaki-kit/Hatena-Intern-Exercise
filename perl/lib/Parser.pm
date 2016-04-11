
package Parser;
use utf8;

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
    my %obj1,%obj2,%obj3,%obj4,%obj5;
    
    my @array=();
    for(my $i = 0 ; $i < $#lines+1 ; $i++){
        @rowEach = split(/\t/,$lines[$i]);
        for(my $j =0 ; $j < $#rowEach+1 ; $j++){
            @keyValue = split(":",$rowEach[$j]);
            if($keyValue[2]){
                $keyValue[1] = $keyValue[1] . $keyValue[2];
            }
            if($i==0){$obj1{$keyValue[0]} = $keyValue[1]}
            elsif($i==1){$obj2{$keyValue[0]} = $keyValue[1]}
            elsif($i==2){$obj3{$keyValue[0]} = $keyValue[1]}
            elsif($i==3){$obj4{$keyValue[0]} = $keyValue[1]}
            elsif($i==4){$obj5{$keyValue[0]} = $keyValue[1]}
        }
        $array[$i] = \%obj;
        if($i==0){$array[$i] = \%obj1}
        elsif($i==1){$array[$i] = \%obj2}
        elsif($i==2){$array[$i] = \%obj3}
        elsif($i==3){$array[$i] = \%obj4}
        elsif($i==4){$array[$i] = \%obj5}
    }
    return @array;
};

1;

