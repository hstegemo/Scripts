use v5.10;

$_="aa11bb";
if(/(.)\111/){ 	# Perl reads it as, does it mean match \111
	print "1: It matched!\n";
}

$_="aa11bb";
if(/(.)\g{1}11/){
	print "2: It matched!\n";
}

$_="aa11bb";
if(/(.)\g{-1}11/){	# -1 = last match
	print "3: It matched!\n";
}
