#!/usr/bin/perl

use strict;
use warnings;

use Bio::SeqIO;

my ($in, $seq, $feature, $wholeSeq, $panel);
my (@cds);

$in = Bio::SeqIO->new(-file => "f1.gb", -format => 'genbank');
$seq = $in->next_seq();
for $feature ($seq->get_SeqFeatures) {
    next unless ($feature->primary_tag eq "CDS");
    push (@cds, $feature);
}
$in->close();

# Créer 1 feature pour la séquence entière
use Bio::SeqFeature::Generic;

$wholeSeq = Bio::SeqFeature::Generic->new(-start => 1, -end => $seq->length, -display_name => $seq->display_name);

# Créer un cadre graphique
use Bio::Graphics;
$panel = Bio::Graphics::Panel->new(-length => $seq->length, -key_style => 'between', -width => 800);

# Création des pistes
$panel->add_track($wholeSeq, -glyph => 'arrow', -bump => 0, -double => 1, -tick => 2);
$panel->add_track($wholeSeq, -glyph => 'generic', -bgcolor => 'blue', -label => 1);
$panel->add_track(\@cds, -glyph => 'transcript2', -bgcolor => 'orange', -fgcolor => 'black', -font2color => 'red', -key => 'CDS', -bump => +1, -height => 12);

# Enregistrer le graphique en format png
open(FHO, ">f1.png") or die("f1.png");
print FHO $panel->png;
close(FHO);
