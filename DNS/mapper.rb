#!/usr/bin/ruby
#
# Copyright 2011, David Hoelzer
# All Rights Reserved
#
# This code is released as free open source code.  You are welcome to use, modify and
# redistribute this code as you see fit provided that this copyright notice remains
# in place and intact.

require './ip_address.rb'
require 'resolv'

def usage
  puts "#{$0} <starting_address> <ending_address> [nameserver]"
  puts "\n  Simply pass in two IP addresses to discover associated host names."
end

unless ARGV.count >= 2
  usage
  exit
end

nameserver = (ARGV.count >= 3 ? ARGV[2] : nil)
a = IPAddress.new(ARGV[0])
b = IPAddress.new(ARGV[1])
tested = 0

increment = (ARGV.count == 4 ? ARGV[3].to_i : 1)

resolver = Resolv::DNS.new(:nameserver => [nameserver], :search => ['.com'], :ndots => 1) if nameserver
resolver = Resolv::DNS.new() if !nameserver

#resolver.timeout = 5
puts"Starting at #{a.address}, counting up to #{b.address}"
while(a < b)
  result = resolver.getnames(a.address)
  if result.size != 0 then
    print "#{a.address}:\t"
    result.each { |name| puts "\t#{name}"}
  end
  a = a + increment
  tested = tested + 1
#  puts " -> #{a.address}" if tested % 100 == 0
end
