#!/usr/bin/perl -w

use strict;
use warnings;
use Bio::SeqIO;

my @files = ("random_1.fasta", "random_2.fasta", "random_3.fasta");
my $count = 0;
my $size = 0;

die("SAISISSEZ UN ARGUMENT !!!") if (!exists($ARGV[0]));
my $out = Bio::SeqIO->new(-file => ">select.fasta", -format => "Fasta");
for my $file (@ARGV) {
    my $in = Bio::SeqIO->new(-file=>$file, -format=>"Fasta");
    while ( my $seq = $in->next_seq()) {
	next if ($seq->length() < 200);
	$out->write_seq($seq->translate());
    }
    $in->close();
}
$out->close
