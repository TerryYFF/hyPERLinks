use strict;
use warnings;
use LWP::Simple;
use HTML::TreeBuilder;
use HTML::FormatText;

$|=1;
my $word;

my $pdf = shift;
my $output = `perl pdftotxt.pl $pdf`;

sub main {

# Input file called random.txt. It will read this file.
  my $input = 'Input.txt';
  open(INPUT, $input) or die ("Input file $input not found.\n");

  # my $check = 'Check.txt';
  # open(CHECK, '>:encoding(UTF-8)', $check) or die ("Cannot create $check.\n");

# Output file called Output.txt. This is where it will be written.
  my $output = 'Output.html';
  open(OUTPUT, '>:encoding(UTF-8)', $output) or die ("Cannot create $output.\n");




# while (my $line = <INPUT>) {
#     my $entire_file = split('\s', $line);
#     print OUTPUT "<a href=\"https://en.wikipedia.org/wiki/$entire_file\"> $entire_file </a> \n";
#     # print "size of array:".@entire_file.".\n";
#     print OUTPUT "<a href=\"https://en.wikipedia.org/wiki/$entire_file\"> $entire_file </a> \n";
#     # print $entire_file[0] . "\n";
# }







# my @lines;
#
# my $count = 0;
#
# while (my $line = <INPUT>) {
#   chomp $line;
#
#   my @values = split /\s* \s*/, $line;
#
#   push @lines, \@values;
#
# }
#
# print $lines[0][1] . "\n";
#
# foreach my $line(@lines) {
#   # print $line . "\n";
# }







  # while (my $line = <INPUT>) { # While the INPUT has a line.
  # # if($line =~ /(\b\w*\s\b)/) { # if there is the word "is" then run it.
  #   if($line =~ /(\b\s*\w*\s*\b)/) { # if there is the word "is" then run it.
  #   # $line =~ s/Barton/Mike/ig; #changes the name Barton to Mike.
  #   # print "Matched: '$1 \n'";
  #     print OUTPUT "<a href=\"https://en.wikipedia.org/wiki/$1\"> $1 </a> \n";
  #   }
  # }



# my @lines;
#
#     while (my $line = <INPUT>) {
#       # chomp $line;
#       # split each input line; words are separated by whitespace
#       # for $word (split) {
#       my @values = split (/\b/, $line);
#       push @lines, \@values;
#       # print OUTPUT "$_\n";
#         # i'm just printing each "word" on a new line.
#         print OUTPUT "<a href=\"https://en.wikipedia.org/wiki/$line\"> $line </a> \n";
#     # }
#   }

  # my $URL = get("https://en.wikipedia.org/wiki/Virginia");
  # my $Format = HTML::FormatText->new;
  # my $TreeBuilder = HTML::TreeBuilder->new;
  # $TreeBuilder->parse($URL);
  # # if ($TreeBuilder->parse($URL)) {
  # #   print "Rip";
  # # } else {
  # #   print "Yes";
  # # }
  # my $Parsed = $Format->format($TreeBuilder);
  # print CHECK $Parsed;



  close(INPUT);
  close(OUTPUT);
}

main();




# https://stackoverflow.com/questions/254345/how-can-i-extract-url-and-link-text-from-html-in-perl
