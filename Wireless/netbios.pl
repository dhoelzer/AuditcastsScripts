#!/usr/bin/perl

@names = <STDIN>;
for $name (@names){
chomp($name);
@chars = split(//,$name);
for($x=0;$x<32;$x+=2)
{
	$a = $chars[$x];
	$b = $chars[$x+1];

	$a = ord($a) - ord('A');
	$b = ord($b) - ord('A');
	$character = ($a << 4) + $b;
	print chr($character);
}
print "\n";
}

