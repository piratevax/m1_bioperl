#!/usr/bin/perl

use strict;
use warnings;
use Bio::SeqIO;

my $file = "random.fasta";

my $in = Bio::SeqIO->new(-file=>$file, -format=>"Fasta");
my $seq = $in->next_seq();

print "id : ".$seq->id()."\n";
print "length : ".$seq->length()."\n";

$in->close();
