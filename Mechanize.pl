use strict;
use warnings;
use WWW::Mechanize();

my $mech = WWW::Mechanize->new()

my $mech = WWW::Mechanize->new( agent => 'wonderbot 1.01' );

$mech->agent_alias( 'Windows IE 6' );
