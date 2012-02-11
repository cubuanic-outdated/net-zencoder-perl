# IMPORTANT: if you delete this file your app will not work as
# expected.  you have been warned
use inc::Module::Install 1.02;

my $main_module = 'lib/Net/Zencoder.pm';

name 'Net-Zencoder';
author q{Oleg Kostyuk <cub.uanic@gmail.com>};
license 'perl';
resources repository => 'git@github.com:cub-uanic/net-zencoder-perl.git';
all_from $main_module;

requires(
    'Hash::Merge'          => 0,
    'Moose'                => 0,
    'JSON'                 => 0,
    'namespace::autoclean' => 0,
);

recommends(
    ## for better speed
    'JSON::XS' => 0,
);

auto_install;
WriteAll;

if ($Module::Install::AUTHOR) {
    system("pod2text $main_module > README") and die $!;
    system("make manifest")                  and die $!;
}

