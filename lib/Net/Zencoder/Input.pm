package Net::Zencoder::Input;

use Moose;
use namespace::autoclean;
extends 'Net::Zencoder::Resource';

sub details {
	my ( $self, $input_id, $opts ) = @_;

	$opts = +{} unless $opts;
	$self->get( "/inputs/$input_id", $opts );
}

sub progress {
	my ( $self, $input_id, $opts ) = @_;

	$opts = +{} unless $opts;
	$self->get( "/inputs/$input_id/progress", $opts );
}

__PACKAGE__->meta->make_immutable;
1;

