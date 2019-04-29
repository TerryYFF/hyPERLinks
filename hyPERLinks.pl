#! /usr/bin/perl

use strict;
use warnings;
use LWP::Simple qw($ua head);


$ua->timeout(3);
$|=1;

my $pdf = shift;
my $pdfText;
my $txt;
my $html;

if($pdf =~ /\b.*[.]pdf\b/i) {
  $pdfText = `perl getpdftext.pl $pdf` or die ("Input file $pdf not found.\n");
  $txt = $1.'.txt' if($pdf =~ /([^.]+)/);
  $html = $1.'.html' if($txt =~ /([^.]+)/);
  print ("Now converting the $pdf file to $txt.\n");
  open (my $file, '>', $txt) or die ("Cannot create $txt.\n");
  print $file $pdfText;
  close $file;
  print ("Completed converting $pdf to a $txt file.\n");
  sleep (1);
  print ("Now converting the $txt file to $html.\n");
} elsif ($pdf =~ /\b.*[.]txt\b/i) {
  $txt = $pdf;
  $html = $1.'.html' if($txt =~ /([^.]+)/);
  print ("Starting to convert $pdf to HTML.\n");
} else {
  print ("$pdf is not valid. \n");
  print ("Please enter a valid .pdf or .txt file.");
  exit;
}


sub main {

  # Input file called random.txt. It will read this file.
  open(INPUT, $txt) or die ("Input file $txt not found.\n");

  # Output file called Output.txt. This is where it will be written.
  open(OUTPUT, '>:encoding(UTF-8)', $html) or die ("Cannot create $html.\n");

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
      if (grep {$b eq $_ } @Check) {
        print OUTPUT "$line \n";
      } else {
        push @Check, $b;
        if (head($URL)) {
          print OUTPUT "<a href=\"https://en.wikipedia.org/wiki/$temp\"> $temp</a>$temp2 \n";
        } else {
          print OUTPUT "$line \n";
        }
      }
    }
    print OUTPUT "<br>" . "\n";
  }


  print ("Completed converting the $txt file to $html.\n");
  print ("Enjoy!\n");

  close(INPUT);
  close(OUTPUT);
}

main();
