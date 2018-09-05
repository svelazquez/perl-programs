#!/usr/bin/perl -w

die "Usage: projectSorter [Directory]" unless ($#ARGV == 0);

my @files = glob("$ARGV[0]");

foreach $file (@files){
    if ($file !~ /.*proj.*/){
        `mkdir -p misc`;
        `cp  $file ./misc`;
    }
    if ($file =~ /.*(proj)([0-9a-zA-z]*)\..*/) {
        `mkdir -p assignment$2`;
        `cp $file ./assignment$2`;
    }
}
