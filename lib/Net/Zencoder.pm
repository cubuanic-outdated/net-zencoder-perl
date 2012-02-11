package Net::Zencoder;

use Moose;
use namespace::autoclean;
use JSON;

our $VERSION = '0.01';

has api_key => (
    is       => 'rw',
    required => 1,
    default  => sub { $ENV{ZENCODER_API_KEY}; },
);

has base_url => (
    is       => 'rw',
    required => 1,
    default  => sub { 'https://app.zencoder.com/api/v2'; },
);

has json => (
    is      => 'ro',
    isa     => 'JSON' | 'JSON::XS',
    default => sub { JSON->new->utf8->relaxed->allow_nonref->allow_unknown; },
    handles => {
        encode_json => 'encode',
        decode_json => 'decode'
    },
);

__PACKAGE__->meta->make_immutable;
1;

