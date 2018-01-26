#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO;

my $file = "f1.gb";
my $in = Bio::SeqIO->new(-file => $file, -format => 'genbank');
my %count;
my @genes;

while (my $seq = $in->next_seq()) {
    for my $feature ($seq->get_SeqFeatures) {
	$count{$feature->primary_tag}++;
	if ($feature->primary_tag eq 'gene' && $feature->has_tag('gene')) {
	    push(@genes, $feature->get_tag_values('gene'));
	}
    }
}
foreach my $feature (keys(%count)) {
    print $count{$feature}." ".$feature;
    if ($feature eq "gene") {
	print " : ";
	foreach (@genes) {
	    print $_." ";
	}
    }
    print "\n";
}
