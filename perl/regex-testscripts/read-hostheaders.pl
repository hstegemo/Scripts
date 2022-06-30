#!/usr/bin/perl

$input = "applicationHost.config";
open(IN, $input) || die "Cannot open $input for reading: $!";
$output = "check_hostheaders.pl";
open(OUT, ">$output") || die "Cannot open $output for writing: $!";

while(<IN>){
	if($_=~/<site name/){
        $name =  $_;
        chomp($name);
        # removes everything except the site name:
        $name =~ s/.*<site name=\"/Site /;
        $name =~ s/\" id=.*/:/;
        # create print output that can be added to a .pl file
        print OUT "\nprint" .' "\n' . $name .'\n";' . "\n";
        
    } elsif($_=~/bindingInformation/ && $_ =~ /:\d+:/){
        $binding = $_;
        $binding =~ s/.* \d{1,5} ://x;  # removes from start to :<port-number>:
        $binding =~ s/\".*//;           # removes end
        if(length($binding)>2){
         	$hostheader = $binding;
        	$binding =~ s/^/system(\"dig +short answer /;   # adds system command to output
        	$binding =~ s/$/");/;  # ends the system command
        	chomp($hostheader);
        	print OUT ("print \"Host $hostheader:\t\";");
        	print OUT ("$binding\t");
		print OUT "sleep(5);";

        } 
    }
}

close(IN);
close(OUT);
