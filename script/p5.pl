#!/usr/bin/perl

use strict;
use warnings;
use Bio::SeqIO;

my @files = ("f1.fasta", "f2.fasta", "f3.fasta");
my $count = 0;
my $size = 0;

for my $file (@files) {
	my $in = Bio::SeqIO->new(-file=>$file, -format=>"Fasta");
	while ( my $seq = $in->next_seq()) {
	        print "id : ".$seq->id()."\n";
        	print "length : ".$seq->length()."\n";
	        $size += $seq->length();
        	$count++;
	}
	$in->close();
	print "c:s = ".$count.":".$size."\n";
	$count = 0;
	$size = 0;
}
