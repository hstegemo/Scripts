#!/usr/bin/perl -w

$_ = 'abcba';
if(/(.)c\1/) { #matches bb
	print "It matched some character next to itself!\n";
}
