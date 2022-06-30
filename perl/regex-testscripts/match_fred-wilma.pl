#!/usr/bin/perl -w
use v5.10;

my $names = 'Fred Flintstone and Wilma Flintstone';

if($names =~ m/(?<last_name>\w+) and \w+ \g{last_name}/ ){
	say "I saw $+{last_name}";
}
