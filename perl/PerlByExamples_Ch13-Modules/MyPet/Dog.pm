package MyPet::Dog;
use strict;
use warnings;
sub import {
	no strict 'refs';	# Allow typeglobs
	my $pkg=caller 0;	# Get the name of the calling package
	foreach my $sym(qw(speak eat nap)){
		*{"${pkg}::$sym"} = \&$sym;	# put a reference to the symbol
						# on the user's symbol table
	}
}

sub name {	# Not exported
	my $name = shift;
	return $name;
}

sub speak {
	return "BowWow\n";
}

sub eat {
	return "likes steak\n";
}

sub nap {
	return "ZZZzzzzz\n";
}

1;
