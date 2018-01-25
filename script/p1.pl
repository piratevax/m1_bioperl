#!/usr/bin/perl

use strict;
use warnings;
use Bio::Seq;

my $adn = "ATTCGTTACCGGAGTCTA";

my $seq = Bio::Seq->new(-id=>'seq', -seq=>$adn);
print "Nom de la sequence : ".$seq->id()."\n";
print "Longueur de la sequence : ".$seq->length()."\n";

