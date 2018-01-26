#!/usr/bin/perl

use strict;
use warnings;

use Bio::SearchIO;

my ($in, $result, $hit, $hsp, $countHit, $countSelectedHit);
my @q_name=();my @q_start=();my @q_end=();my @h_name=();my @h_desc=();my @h_start=();my @h_end=();my @score=();my @e_value=();my @length=();my @id=();my @id_pct=();

$in = new Bio::SearchIO(-format => 'blast', -file => "out_blast.txt");
open (OUT, ">blast1_ok.txt") || die("blast1_ok.txt: $&\n");
$countHit = 0;
$countSelectedHit=0;

while ($result = $in->next_result) {
    while ($hit = $result->next_hit) {
	$countHit++;
	while ($hsp = $hit->next_hsp) {
	    next if ($hsp->length('total') <= 100);
	    next if ($hsp->percent_identity <= 80);
	    next if ($hs->evalue <= 0.05);
	    $countSelectedHit++;
	    print $result->query_name . "\t" . $hit->name . "\t" . $
	}
    }
}
