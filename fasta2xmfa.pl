#!/usr/bin/env perl                                                                 
use strict;
use warnings;
use Bio::Seq;
use Data::Dumper;
use Bio::AlignIO;


my $fasta_file = shift @ARGV;
#open FASTA, "<".$fasta_file;
my $in  = Bio::AlignIO->new(-file  => $fasta_file, -format => 'fasta');
my $aln= $in->next_aln();

foreach my $seq ($aln->each_seq) {
    my $id = $seq->id();
    next if $id =~ /156a|64b/;
    $id =~ s/^([^:]+):.+$/$1/;
    $fasta_file =~ s/^.+(fam_\d+)\..+$/$1/;
    $id = $fasta_file . "|". $id;
    print ">$id\n";
    my $newseq= uc($seq->seq());
    # print $seq->seq(), "\n";
    print $newseq, "\n";
}

exit;

