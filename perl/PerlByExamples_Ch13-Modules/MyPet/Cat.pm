package MyPet::Cat;
use strict;
use warnings;
our $VERSION="0.01";		# The version number for the Cat.pm module
use Exporter qw(import);	# Simplified import
#require Exporter;
#our @ISA=qw(Exporter);
our @EXPORT=qw(eat);	# Default is to eat
our @EXPORT_OK=qw(speak nap play);	# Exported on demand
our %EXPORT_TAGS = ('all'=>[ qw(speak nap play eat)]);
				# Export a collection

sub name {	# Not on the export lists
	my $name = shift;
	return $name;
}

sub speak {
	return "Meowwww\n";
}

sub eat {
	return "likes fish\n";
}

sub nap {
	return "ZZZzzzzz\n";
}

sub play {
	return "catch a mouse!\n";
}

1;
