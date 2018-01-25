#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO;
use Bio::Seq::RichSeq;

my $file_gb = "all_from_gb.gb";
my $file_fa = ">all_from_gb.fa";
my $in = Bio::SeqIO->new(-file=>$file_gb, -format=>"genbank");
my $out = Bio::SeqIO->new(-file=>$file_fa, -format=>"fasta");
my $n = 0;

while (my $seq = $in->next_seq) {
    $out->write_seq($seq);
    $n++;
}
$in->close();
$out->close();
print $n." seq\n";
