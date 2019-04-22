#!/usr/local/bin/perl
# pdftotxt.pl takes a pdf file as a command line argument

use strict;
use warnings;

my $pdf = shift;
# print ($pdf, "\n");
my $output = `perl getpdftext.pl $pdf`;
my $txt = 'Input.txt';
# my $txt = $1. ''. '.txt' if($pdf =~ /([^.]+)/);
# print ($txt, "\n");

open (my $file, '>', $txt) or die ("Cannot create $txt.\n");
print $file $output;
close $file;
print ("done\n");
