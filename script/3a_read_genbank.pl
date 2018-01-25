#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO;

my $file = "all_from_gb.gb";
my $in = Bio::SeqIO->new(-file=>$file, -format=>"genbank");
while (my $seq = $in->next_seq) {
    print $seq->display_id."\n";
}
