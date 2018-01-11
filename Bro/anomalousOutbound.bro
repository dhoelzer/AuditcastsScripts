// Bro script to find outbound connections for which there are no corresponding DNS lookups.
// David Hoelzer, Enclave Forensics, Inc - Copyright 2018

global knownAddresses: set[addr];
global internalAddresses: set[subnet] = {192.168.0.0/16};

event dns_A_reply(c: connection, msg: dns_msg, a:addr)
{
	add known_addresses[a];
}

event connection_SYN_packet(c: connection, packet:SYN_packet)
{
	if(c$id$orig_h !in internal_addresses) { return; }
	if(c$id$resp_h in internal_addresses) { return; }
	if(c$id$resp_h in known_addresses) { return; }

	local message: string;
	message = fmt("Outbound connection %s:%s > %s:%s without a DNS lookup.", c$id$orig_h, c$id$orig_p,
		c$id$resp_h, c$id$resp_p);
	NOTICE([$note="OutboundNoLookup", $msg=message, $conn=c]);
}