use strict;
use warnings;

$|=1;
my $word;

my $pdf = shift;
my $pdfText = `perl getpdftext.pl $pdf`;
my $txt = $1.'.txt' if($pdf =~ /([^.]+)/);
my $html = $1.'.html' if($txt =~ /([^.]+)/);
open (my $file, '>', $txt) or die ("Cannot create $txt.\n");
print $file $pdfText;
close $file;
print ("done\n");

sub main {

# Input file called random.txt. It will read this file.
  open(INPUT, $txt) or die ("Input file $txt not found.\n");

# Output file called Output.txt. This is where it will be written.
  open(OUTPUT, '>:encoding(UTF-8)', $html) or die ("Cannot create $html.\n");


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
