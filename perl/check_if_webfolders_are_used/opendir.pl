#!/usr/bin/perl -w

my $dir = '/home/user/wwwroot';	# This script was created and tested in Linux
opendir my $dh, $dir or die "Cannot open $dir: $!";

my $outfile = 'wwwrootFoldersNotInHostsfile';
open (OUT, ">$outfile") || die "Cannot open $outfile for writing: $!";

foreach $file (readdir $dh) {
	next if ($file eq "." or $file eq "..");
	$foundfile = 0;
	
	my $infile = 'applicationHost.config';
	open (IN, $infile) || die "Cannot open $infile for reading: $!";

	while(<IN>){
		$line = $_;
		if($line =~ /<virtual/ and $line =~ /.*wwwroot/){ 	# 
			$line =~ s/.*wwwroot\\//; # remove the path to the IIS wwwroot
			$line =~ s/\\.*$//;		# removes the "tail"
			chomp($line);
			if($line eq $file){
				$foundfile = 1;
				print "found $file\n";
			}
		}
	}
	if($foundfile == 0){
		print OUT "$file\n";
		print "did not find $file\n";
	}
}
closedir($dh);
close(IN);
close(OUT);
