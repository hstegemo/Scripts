#!/usr/bin/perl -w

$_ = "yabba dabba doo";
if(/y(.)(.)\2\1/){	# matches abba
	print "It matched after the y!\n";
}
