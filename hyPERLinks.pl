use strict;
use warnings;
use PDF::API2;

$|=1;

sub main {

# Input file called random.txt. It will read this file.
  my $input = 'Random.txt';
  open(INPUT, $input) or die ("Input file $input not found.\n");

# Output file called Output.txt. This is where it will be written.
  my $output = 'Output.html';
  open(OUTPUT, '>', $output) or die ("Cannot create $output.\n");


my @entire_file = split( /(\w*\s)/, <INPUT> );;

print "size fo array:".@entire_file.".\n";

print "$entire_file[1]";


  while (my $line = <INPUT>) { # While the INPUT has a line.
    if($line =~ /(\b\w*\s\b)/) { # if there is the word "is" then run it.
      # $line =~ s/Barton/Mike/ig; #changes the name Barton to Mike.
      # print "Matched: '$1 \n'";
      print OUTPUT "<a href=\"https://en.wikipedia.org/wiki/$1\"> $1 </a> \n";
    }
  }

#   my  $pdf = PDF::API2->new();
# # Add a blank page
#   my  $page = $pdf->page();
#
# # Set the page size
#   $page->mediabox('Letter');
#
# # Add a built-in font to the PDF
#   my  $font = $pdf->corefont('Helvetica-Bold');

# # Add some text to the page
#   my $text = $page->text();
#   $text->font($font, 20);
#   $text->translate(200, 700);
#   $text->text('Hello World!');
# # Save the PDF
#   $pdf->saveas('new.pdf');
#

  close(INPUT);
  close(OUTPUT);
}

main();




# https://stackoverflow.com/questions/254345/how-can-i-extract-url-and-link-text-from-html-in-perl
