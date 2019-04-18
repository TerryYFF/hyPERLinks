use strict;
use warnings;

$|=1;

sub main {

# Input file called random.txt. It will read this file.
  my $input = 'Random.txt';
  open(INPUT, $input) or die ("Input file $input not found.\n");

# Output file called Output.txt. This is where it will be written.
  my $output = 'Output.txt';
  open(OUTPUT, '>', $output) or die "Cannot create $output.";

  while (my $line = <INPUT>) { # While the INPUT has a line. 
    if($line =~ /\bis\b/) { # if there is the word "is" then run it.
      $line =~ s/Barton/Mike/ig; #changes the name Barton to Mike.
      print OUTPUT $line;
    }
  }

  close(INPUT);
  close(OUTPUT);
}

main();
