#!/usr/bin/perl

use strict;
use warnings;
use Bio::SeqIO;

my $file = "random.fasta";
my $count = 0;
my $size = 0;

my $in = Bio::SeqIO->new(-file=>$file, -format=>"Fasta");
while ( my $seq = $in->next_seq()) {
	print "id : ".$seq->id()."\n";
	print "length : ".$seq->length()."\n";
	$size += $seq->length();
	$count++;
}
$in->close();

print "c:s = ".$count.":".$size."\n";
