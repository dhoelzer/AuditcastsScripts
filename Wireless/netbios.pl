#!/usr/bin/perl
use feature "switch";

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
	if($x == 30) {
			if ($character == 0x00) { print " <- Domain Name / Workstation Service / IIS";}
			if ($character == 0x01) { print " <- Master Browser / Messenger Service"; }
			if ($character == 0x03) { print " <- Messenger Service"; }
			if ($character == 0x06) { print " <- RAS Service"; }
			if ($character == 0x1b) { print " <- Domain Master Browser"; }
			if ($character == 0x1c) { print " <- Domain Controller / IIS"; }
			if ($character == 0x1d) { print " <- Master Browser"; }
			if ($character == 0x1e) { print " <- Browser Service Election Announcement"; }
			if ($character == 0x1f) { print " <- NetDDE Service"; }
			if ($character == 0x20) { print " <- File Server Service"; }
			if ($character == 0x21) { print " <- RAS Client Service"; }
			if ($character == 0x22) { print " <- Microsoft Exchange Connector"; }
			if ($character == 0x23) { print " <- Microsoft Exchange Store"; }
			if ($character == 0x24) { print " <- Microsoft Exchange Directory"; }
			if ($character == 0x30) { print " <- Modem Sharing Server Service"; }
			if ($character == 0x31) { print " <- Modem Sharing Client Service"; }
			if ($character == 0x43) { print " <- SMS Clients Remote Control"; }
			if ($character == 0x44) { print " <- SMS Clients Remote Control Tool"; }
			if ($character == 0x45) { print " <- SMS Clients Remote Chat"; }
			if ($character == 0x46) { print " <- SMS Clients Remote Transfer"; }
			if ($character == 0x4c) { print " <- DEC Pathworks"; }
			if ($character == 0x42) { print " <- Mcaffee Antivirus"; }
			if ($character == 0x52) { print " <- DEC Pathworks"; }
			if ($character == 0x87) { print " <- Microsoft Exchange MTA"; }
			if ($character == 0x6a) { print " <- Microsoft Exchange"; }
			if ($character == 0xbe) { print " <- Network Monitoring Agent"; }
			if ($character == 0xbf) { print " <- Network Monitoring Application"; }
			if ($character == 0x03) { print " <- Messenger Service"; }
			}
}
print "\n";
}

