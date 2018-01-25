#!/usr/bin/perl

use strict;
use warnings;

use Bio::DB::EUtilities;
use Bio::SeqIO;

my $query = "Brassicaceae[Orgn] AND mitochondrion[TITL] AND complete genome[TITL]";
my $factory = Bio::DB::EUtilities->new(-eutil=>"esearch", -term=>$query, -db=>"nucleotide");

print "Count = ".$factory->get_count."\n";

my @ids = $factory->get_ids;
$factory = Bio::DB::EUtilities->new(-eutils=>"efetch", -db=>"nucleotide", -id=>\@ids, -rettype=>"gb");
$factory->get_Response(-file=>'all_from_gb.gb');
