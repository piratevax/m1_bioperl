#!/usr/bin/perl -w

use strict;
use warnings;
use Bio::SeqIO;

my @files = ("random_1.fasta", "random_2.fasta", "random_3.fasta");
my $count = 0;
my $size = 0;

die("SAISISSEZ UN ARGUMENT !!!") if (!exists($ARGV[0]));
for my $file (@ARGV) {
    my $in = Bio::SeqIO->new(-file=>$file, -format=>"Fasta");
    while ( my $seq = $in->next_seq()) {
        #print "id : ".$seq->id()."\n";
        #print "length : ".$seq->length()."\n";
	next if ($seq->length() < 500 || $seq->length() > 1500);
        $size += $seq->length();
	$count++;
    }
    $in->close();
    print "c:s = ".$count.":".$size."\n";
    $count = 0;
    $size = 0;
}
