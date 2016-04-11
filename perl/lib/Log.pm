
package Log;
use Time::Piece;

sub new{
    my $class = shift;
    my $self = {
        host    => 'none',
        user    => '',
        epoch   => '',
        req     => '',
        status  => '',
        size    => '',
        referer => '',
        @_,
    };
    return bless $self, $class;
};

sub method{
    my $self = shift;
    if(@_){$self->{req} = shift;}
    my @list = split(/ /, $self->{req});
    return @list[0]; 
};

sub path{
    my $self = shift;
    if(@_){$self->{req} = shift;}
    my @list = split(/ /, $self->{req});
    return @list[1]; 
};
sub protocol{
    my $self = shift;
    if(@_){$self->{req} = shift;}
    my @list = split(/ /, $self->{req});
    return @list[2]; 
};
sub uri{
    my $self = shift;
    if(@_){$self->{referer} = shift;}
    my $head = substr($self->{referer},0,7);
    my $uri = $head . $self->{host} . $self->path;
    return $uri; 
};
sub time{
    my $self = shift;
    my $date = &timestamp2date($self->{epoch});
    return $date;
};

sub timestamp2date{
    my $timestamp = shift;
    my ($sec, $min, $hour, $day, $mon, $year) = gmtime($timestamp);
    return sprintf('%04d-%02d-%02dT%02d:%02d:%02d' , $year+1900,$mon+1,$day,$hour,$min,$sec);
};

1;

