#!/usr/bin/perl
$conf = "applicationHost.config";

open(IN, $conf) || die "Cannot open $conf for reading: $!\n";

while(<IN>){
	$line = $_;
	if($line =~ /<virtualDirectory/){
		$line =~ s/.* physicalPath=\"[cC]: \\ (?:wwwroot|aspnet) \\ //x;	# path to our webroots 
		next if ($line =~ /physicalPath/);	# skip the directories not in our webroots
		next if ($line =~ /virtualDirectoryDefault/);
		$line =~ s/\" \/>.*$//;	# remove " />" from the end of the line
		$line =~ s/\\www$//;	# remove tailing www-folder (not needed)
		chomp($line);
		print("$line\n");
	} 
}
