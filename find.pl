#!/usr/bin/perl -w
#searches for files in dir list based on reg ex pattern
#if file name matches, print the file name
#else search for same reg ex within the files

die "Usage: ["perlRegexpPattern"] ["listOfFiles"]\n" if ($#ARGV < 1 || $#ARGV > 2);


if ($#ARGV == 1){
    my @files = glob("$ARGV[1]");
    my @fileResults = grep(/$ARGV[0]/, @files);
    my @textResults = `grep $ARGV[0] $ARGV[1]`;
    print @textResults;
    print join("\n", @fileResults), "\n";
}    
if ($ARGV[0] eq "-i"){
    my @files = glob("$ARGV[2]");
    @textResults  = `grep -l $ARGV[1] $ARGV[2]`;
    chomp @textResults;
    
    foreach my $file (@files) {
        if ($file !~ /$ARGV[1]/ && $file !~ /@textResults/){
            push (@fileMatch, $file);
        }
    }
    print join("\n", @fileMatch), "\n";
}


        
