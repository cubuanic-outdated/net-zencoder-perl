package Net::Zencoder::Resource;

use Moose;
use namespace::autoclean;
extends 'Net::Zencoder';

use Net::Zencoder::HTTP;
use Hash::Merge qw//;

sub post {
	my ( $self, $path, $params, $opts ) = @_;

	my $options = +{%$opts};
	my $url     = $self->url_for( $path, $options );
	my $body    = $self->encode($params);

	$options = $self->add_api_key_header($options);
	return Net::Zencoder::HTTP::post( $url, $body, $options );
}

sub put {
	my ( $self, $path, $params, $opts ) = @_;

	my $options = +{%$opts};
	my $url     = $self->url_for( $path, $options );
	my $body    = $self->encode($params);

	$options = $self->add_api_key_header($options);
	return Net::Zencoder::HTTP::put( $url, $body, $options );
}

sub get {
	my ( $self, $path, $opts ) = @_;

	my $options = +{%$opts};
	my $url = $self->url_for( $path, $options );

	$options = $self->add_api_key_header($options);
	return Net::Zencoder::HTTP::get( $url, $options );
}

sub delete {
	my ( $self, $path, $opts ) = @_;

	my $options = +{%$opts};
	my $url = $self->url_for( $path, $options );

	$options = $self->add_api_key_header($options);
	return Net::Zencoder::HTTP::delete( $url, $options );
}

sub url_for {
	my ( $self, $path, $opts ) = @_;
	return ( exists $opts->{base_url} ? $opts->{base_url} : $self->base_url ) . $path;
}

sub add_api_key_header {
	my ( $self, $opts ) = @_;

	my $options = +{%$opts};
	my $effective_api_key = ( exists $opts->{api_key} ? $opts->{api_key} : $self->api_key );

	if ($effective_api_key) {
		if ( exists $options->{headers} ) {
			$options->{headers} = +{ %{ $options->{headers} } };
		}
		else {
			$options->{headers} = +{};
		}
		$options->{headers}->{ Zencoder-Api-Key } = $effective_api_key;
	}

	return $options;
}

sub merge_params {
	my ( $self, $opts, $params ) = @_;

	if ( exists $opts->{params} ) {
		$opts->{params} = Hash::Merge::merge( $opts->{params}, $params );
	}
	else {
		$opts->{params} = $params;
	}

	return $opts,;
}

__PACKAGE__->meta->make_immutable;
1;

