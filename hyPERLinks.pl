use strict;
use warnings;

$|=1;
my $word;

my $pdf = shift;
my $output = `perl pdftotxt.pl $pdf`;

sub main {

# Input file called random.txt. It will read this file.
  my $input = 'Input.txt';
  open(INPUT, $input) or die ("Input file $input not found.\n");

# Output file called Output.txt. This is where it will be written.
  my $output = 'Output.html';
  open(OUTPUT, '>:encoding(UTF-8)', $output) or die ("Cannot create $output.\n");


my @lines;

my $count = 0;

while (my $line = <INPUT>) {
  my @values = split /\s+/, $line;
  foreach my $line(@values) {
      print OUTPUT "<a href=\"https://en.wikipedia.org/wiki/$line\"> $line </a>";
      # print OUTPUT $line . "\n";
    }
    print OUTPUT "<br>" . "\n";
}



  close(INPUT);
  close(OUTPUT);
}

main();


# https://stackoverflow.com/questions/254345/how-can-i-extract-url-and-link-text-from-html-in-perl
