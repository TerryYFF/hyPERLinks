#! /usr/bin/perl

use strict;
use warnings;
# CPAN module.
use LWP::Simple qw($ua head);

# Wait for 3 seconds.
$ua->timeout(3);
$|=1;

my $pdf = shift;
my $pdfText;
my $txt;
my $html;


# Check input file whether it is a .pdf or not.
if($pdf =~ /\b.*[.]pdf\b/i) {
  # Call getpdftext.pl if the file is a valid .pdf file.
  $pdfText = `perl getpdftext.pl $pdf` or die ("Input file $pdf not found.\n");
  # Make a .txt and .html file called the same as the pdf file.
  $txt = $1.'.txt' if($pdf =~ /([^.]+)/);
  $html = $1.'.html' if($txt =~ /([^.]+)/);
  print ("Now converting the $pdf file to $txt.\n");
  open (my $file, '>', $txt) or die ("Cannot create $txt.\n");
  print $file $pdfText;
  close $file;
  # print out what is currently happening in the code.
  print ("Completed converting $pdf to a $txt file.\n");
  sleep (1);
  print ("Now converting the $txt file to $html.\n");
  # Check if the input is a .txt
} elsif ($pdf =~ /\b.*[.]txt\b/i) {
  # Make a .html fild called the same as the .txt file
  $txt = $pdf;
  $html = $1.'.html' if($txt =~ /([^.]+)/);
  print ("Starting to convert $pdf to HTML.\n");
} else {
  # Tell the user that the input file is not valid.
  print ("$pdf is not valid. \n");
  print ("Please enter a valid .pdf or .txt file.");
  exit;
}

# Main Subroutine.
sub main {

  # Input file called random.txt. It will read this file.
  open(INPUT, $txt) or die ("Input file $txt not found.\n");

  # Output file called Output.txt. This is where it will be written.
  open(OUTPUT, '>:encoding(UTF-8)', $html) or die ("Cannot create $html.\n");

  # An array called my @Check.
  my @Check;

  # While there is a line from <INPUT>
  while (my $line = <INPUT>) {
    # split the line when there is a space
    my @values = split /\s+/, $line;
    foreach my $line(@values) {
      #put the word $line into $temp.
      my $temp = $line;
      #make sure $temp does not have any punctuation. If it does remove it.
      $temp =~ s/[[:punct:]]//g;
      #Make sure only the word get the hyperlink.
      my $temp2 = $line;
      $temp2 =~ s/\w*//g;
      #URL of the word
      my $URL = "https://en.wikipedia.org/wiki/$temp";
      #put $temp into $a
      $a = $temp;
      # convert the string to uppercase
      $b = uc $a;
      # If Filter out words using UNIX grep.
      if (grep {$b eq $_ } @Check) {
        # If $b eq the array @Check, then print out the $line.
        print OUTPUT "$line \n";
      } else {
        # If $b does not eq the array @Check push $b in the array.
        push @Check, $b;
        # Check if the $URL is a valid url.
        if (head($URL)) {
          # If it is a valid url print a hypterlink
          print OUTPUT "<a href=\"https://en.wikipedia.org/wiki/$temp\"> $temp</a>$temp2 \n";
        } else {
          # If it is not a valid url print a normal word.
          print OUTPUT "$line \n";
        }
      }
    }
    print OUTPUT "<br>" . "\n";
  }


  print ("Completed converting the $txt file to $html.\n");
  print ("Enjoy!\n");

  # Close the INPUT and OUTPUT files. 
  close(INPUT);
  close(OUTPUT);
}

main();
