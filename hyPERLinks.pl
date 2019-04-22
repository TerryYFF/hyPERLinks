use strict;
use warnings;
use LWP::Simple;

$|=1;
my $word;


# my $URL = get("https://en.wikipedia.org/wiki/Formatting,");
my $pdf = shift;
# print ($pdf, "\n");
my $output = `perl pdftotxt.pl $pdf`;

sub main {

# Input file called random.txt. It will read this file.
  my $input = 'Input.txt';
  open(INPUT, $input) or die ("Input file $input not found.\n");

# Output file called Output.txt. This is where it will be written.
  my $output = 'Output.html';
  open(OUTPUT, '>', $output) or die ("Cannot create $output.\n");

  # my $check = 'Check.txt';
  # open(CHECK, '>', $check) or die ("Cannot create $check.\n");
#
# while (<INPUT>) {
#   my @entire_file = split(/(\b\s*\w*\s*\b)/, <INPUT>);
#   if () {
#     print OUTPUT "<a href=\"https://en.wikipedia.org/wiki/$1\"> $1 </a> \n";
#   }
#   print "size fo array:".@entire_file.".\n";
# }



  # while (my $line = <INPUT>) { # While the INPUT has a line.
  # # if($line =~ /(\b\w*\s\b)/) { # if there is the word "is" then run it.
  #   if($line =~ /(\b\s*\w*\s*\b)/) { # if there is the word "is" then run it.
  #   # $line =~ s/Barton/Mike/ig; #changes the name Barton to Mike.
  #   # print "Matched: '$1 \n'";
  #     print OUTPUT "<a href=\"https://en.wikipedia.org/wiki/$1\"> $1 </a> \n";
  #   }
  # }



    while (<INPUT>)
    {
      # split each input line; words are separated by whitespace
      for $word (split) {
        # i'm just printing each "word" on a new line.
        print OUTPUT "<a href=\"https://en.wikipedia.org/wiki/$word\"> $word </a> \n";
        # print $word . "\n";
    }
  }


  close(INPUT);
  close(OUTPUT);
}

main();




# https://stackoverflow.com/questions/254345/how-can-i-extract-url-and-link-text-from-html-in-perl
