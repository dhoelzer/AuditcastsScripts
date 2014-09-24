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
			if ($character == 0x00) { print "\t<- Domain Name / Workstation Service / IIS";}
			if ($character == 0x01) { print "\t<- Master Browser / Messenger Service"; }
			if ($character == 0x03) { print "\t<- Messenger Service"; }
			if ($character == 0x06) { print "\t<- RAS Service"; }
			if ($character == 0x1b) { print "\t<- Domain Master Browser"; }
			if ($character == 0x1c) { print "\t<- Domain Controller / IIS"; }
			if ($character == 0x1d) { print "\t<- Master Browser"; }
			if ($character == 0x1e) { print "\t<- Browser Service Election Announcement"; }
			if ($character == 0x1f) { print "\t<- NetDDE Service"; }
			if ($character == 0x20) { print "\t<- File Server Service"; }
			if ($character == 0x21) { print "\t<- RAS Client Service"; }
			if ($character == 0x22) { print "\t<- Microsoft Exchange Connector"; }
			if ($character == 0x23) { print "\t<- Microsoft Exchange Store"; }
			if ($character == 0x24) { print "\t<- Microsoft Exchange Directory"; }
			if ($character == 0x30) { print "\t<- Modem Sharing Server Service"; }
			if ($character == 0x31) { print "\t<- Modem Sharing Client Service"; }
			if ($character == 0x43) { print "\t<- SMS Clients Remote Control"; }
			if ($character == 0x44) { print "\t<- SMS Clients Remote Control Tool"; }
			if ($character == 0x45) { print "\t<- SMS Clients Remote Chat"; }
			if ($character == 0x46) { print "\t<- SMS Clients Remote Transfer"; }
			if ($character == 0x4c) { print "\t<- DEC Pathworks"; }
			if ($character == 0x42) { print "\t<- Mcaffee Antivirus"; }
			if ($character == 0x52) { print "\t<- DEC Pathworks"; }
			if ($character == 0x87) { print "\t<- Microsoft Exchange MTA"; }
			if ($character == 0x6a) { print "\t<- Microsoft Exchange"; }
			if ($character == 0xbe) { print "\t<- Network Monitoring Agent"; }
			if ($character == 0xbf) { print "\t<- Network Monitoring Application"; }
			if ($character == 0x03) { print "\t<- Messenger Service"; }
			}
}
print "\n";
}

