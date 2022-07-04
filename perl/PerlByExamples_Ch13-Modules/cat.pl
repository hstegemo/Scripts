#!/usr/bin/perl
use MyPet::Cat qw(:all);
use MyPet::Cat;
my $petname = MyPet::Cat::name("Sneaky");
print "$petname ", eat();
print "$petname likes to ", play();
print nap();
print speak;
