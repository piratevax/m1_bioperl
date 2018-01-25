#!/usr/bin/perl

use strict;

die("Aucun argument !!!\n*** Arret de l'execution ***\nExecution:",$0," nombre_de_sequence longueur_des_sequences nombre_de_ficher nom_de_fichier\n") if (!exists($ARGV[0]));

my @nt = ('a','c','t','g');
my $i = 0; my $j = 0;

#open (FD, ">random.fasta");

if ($#ARGV != 3) {
    generator(1, 500, 1, "random");
} else {
    generator($ARGV[0], $ARGV[1], $ARGV[2], $ARGV[3]);
}

#close (FD);

sub generator {
    my ($nbSeq, $lengthSeq, $nbFile, $file) = @_;	
    for (my $nb = 1; $nb <= $nbFile; $nb++) {
	open (FD, ">$file$nb.fasta");
	for (my $it = 1; $it <= $nbSeq; $it++) {
	    print FD "> Random_Sequence_".$it."\n";
	    for (my $i = 0; $i < $lengthSeq; $i++) {
		print FD $nt[int(rand($#nt+1))];
		print FD "\n" if(($i%59) == 0);
            }
	}
	close (FD);
    }
}
