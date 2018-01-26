#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO;
use Bio::Tools::GFF;

my $in = Bio::SeqIO->new(-file => "f1.gb", -format => 'genbank');
my $out = new Bio::Tools::GFF(-file => "> f1_gene.gff",	-gff_version => 3);
while (my $seq = $in->next_seq()) {
    for my $feature ($seq->get_SeqFeatures) {
	if ($feature->primary_tag eq "CDS") {
	    if ($feature->has_tag('gene')) {
		$out->write_feature($feature);
	    }
	}
    }
}
