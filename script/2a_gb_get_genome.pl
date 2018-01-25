#!/usr/bin/perl

use strict;
use warnings;
use Bio::DB::GenBank;
use Bio::SeqIO;

my $gb = new Bio::DB::GenBank();
my $seq = $gb->get_Seq_by_acc("NC_001284");
my $out = Bio::SeqIO->new(-file=>">f1.gb", -format=>"genbank");
$out->write_seq($seq);

