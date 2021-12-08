#!/usr/bin/env perl
# Reads English PUD, remembers English sentences hashed by sentence ids.
# Reads Polish PUD, fixes sentence ids and adds the English translations.
# Copyright © 2021 Dan Zeman <zeman@ufal.mff.cuni.cz>
# License: GNU GPL

use utf8;
use open ':utf8';
binmode(STDIN, ':utf8');
binmode(STDOUT, ':utf8');
binmode(STDERR, ':utf8');

my $enpath = 'UD_English-PUD/en_pud-ud-test.conllu';
my $plpath = 'UD_Polish-PUD/pl_pud-ud-test.conllu';
my $ploutpath = 'UD_Polish-PUD/pl_pud-ud-test-fixed.conllu';
open(EN, $enpath) or die("Cannot read '$enpath': $!");
my $sid;
my $text;
my %entexts;
while(<EN>)
{
    chomp();
    if(m/^\#\s*sent_id\s*=\s*(\S+)$/)
    {
        $sid = $1;
    }
    elsif(m/^\#\s*text\s*=\s*(.+)$/)
    {
        $text = $1;
    }
    elsif(m/^\s*$/)
    {
        if(defined($sid) && defined($text))
        {
            $entexts{$sid} = $text;
        }
        $sid = undef;
        $text = undef;
    }
}
close(EN);
open(PL, $plpath) or die("Cannot read '$plpath': $!");
open(OUT, ">$ploutpath") or die("Cannot write '$ploutpath': $!");
my @comments = ();
$sid = undef;
while(<PL>)
{
    chomp();
    if(m/^\#/)
    {
        if(m/^\#\s*orig_file_sentence\s*=\s*(.+)\#\d+$/)
        {
            $sid = $1;
        }
        elsif(m/^\#\s*conversion_status\s*=\s*(.+)$/)
        {
            if($1 ne 'complete')
            {
                print STDERR ("Unexpected conversion_status = '$1'\n");
            }
        }
        elsif(!m/^\#\s*sent_id/) # discard the old sentence id
        {
            push(@comments, $_);
        }
    }
    elsif(m/^\d/)
    {
        if(scalar(@comments) > 0)
        {
            if(defined($sid))
            {
                print OUT ("\# sent_id = $sid\n");
            }
            else
            {
                die("Unknown sentence id");
            }
            foreach my $c (@comments)
            {
                print OUT ("$c\n");
                if($c =~ m/^\#\s*text\s*=/)
                {
                    if(exists($entexts{$sid}))
                    {
                        print OUT ("\# text_en = $entexts{$sid}\n");
                    }
                    else
                    {
                        print STDERR ("Unknown English translation of sentence '$sid'\n");
                    }
                }
            }
            @comments = ();
        }
        print OUT ("$_\n");
    }
    elsif(m/^\s*$/)
    {
        print OUT ("\n");
        $sid = undef;
        @comments = ();
    }
}
close(PL);
close(OUT);
system("mv $ploutpath $plpath");
