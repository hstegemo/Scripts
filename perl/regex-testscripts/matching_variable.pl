#!/usr/bin/perl -w

foreach(qw(fred betty barney dino)){
	if(/fred|barney|betty/){
		print "$_ matched\n";
	}
}
