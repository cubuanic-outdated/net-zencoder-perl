package Net::Zencoder::Account;

use Moose;
use namespace::autoclean;
extends 'Net::Zencoder::Resource';

sub create {
	my ( $self, $params, $opts ) = @_;

	$params = +{} unless $params;
	$opts   = +{} unless $opts;
	$self->post( '/account', $params, $opts );
}

sub details {
	my ( $self, $opts ) = @_;

	$opts = +{} unless $opts;
	$self->get( '/account', $opts );
}

sub integration {
	my ( $self, $opts ) = @_;

	$opts = +{} unless $opts;
	$self->put( '/account/integration', undef, $opts );
}

sub live {
	my ( $self, $opts ) = @_;

	$opts = +{} unless $opts;
	$self->put( '/account/live', undef, $opts );
}

__PACKAGE__->meta->make_immutable;
1;

