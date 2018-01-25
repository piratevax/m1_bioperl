#!/usr/bin/perl

use strict;
use warnings;

use Bio::DB::GenBank;
use Bio::DB::Query::GenBank;
use Bio::SeqIO;

#my $gb = new Bio::DB::GenBank();
#my $seq = $gb->get_Seq_by_acc("NC_001284");
my $out = Bio::SeqIO->new(-file=>">all_from_gb.gb", -format=>"genbank");
#$out->write_seq($seq);

my $query = "Brassicaceae [Orgn] AND mitochondrion[TITL] AND complete genome[TITL]";
my $query_obj = Bio::DB::Query::GenBank->new(-db=>"nucleotide", -query=>$query);
my $gb_obj = Bio::DB::GenBank->new;
my $stream_obj = $gb_obj->get_Stream_by_query($query_obj);

while (my $seq_obj = $stream_obj->next_seq) {
    print $seq_obj->display_id."\t".$seq_obj->length."\n";
    $out->write_seq($seq_obj);
}
