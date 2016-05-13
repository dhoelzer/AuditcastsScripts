#!/usr/bin/python
from scapy.all import *
import sys

def send_packets(chk):
	packet1 = IP(dst=target, flags="MF", frag=0)/ICMP(type=8,code=0, chksum=chk)/"111111111111111111111111"
	packet2 = IP(dst=target, flags="MF", frag=4, proto=1)/"2222222222222222"
	packet3 = IP(dst=target, flags="MF", frag=6, proto=1)/"333333333333333333333333"
	packet4 = IP(dst=target, flags="MF", frag=1, proto=1)/"44444444444444444444444444444444"
	packet5 = IP(dst=target, flags="MF", frag=6, proto=1)/"555555555555555555555555"
	packet6 = IP(dst=target, frag=9, proto=1)/"666666666666666666666666"
	send(packet1)
	send(packet2)
	send(packet3)
	send(packet4)
	send(packet5)
	send(packet6)


	if len(sys.argv) < 2:
		print "You must supply a target IP address."
		sys.exit(1)
		target = sys.argv[1]
		# We don't know the correct ICMP checksum
		for x in range(0,65535):
			send_packets(x)
