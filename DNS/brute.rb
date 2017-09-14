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
  puts "#{$0} <nameserver> <domain.name>"
end

unless ARGV.count >= 2
  usage
  exit
end

nameserver = (ARGV.count >= 2 ? ARGV[0] : nil)
domain = (ARGV.count >= 2 ? ARGV[1] : nil)
tested = 0

puts "Using #{nameserver} to find hosts in #{domain}"

resolver = Resolv::DNS.new(:nameserver => [nameserver], :ndots => 1) if nameserver
resolver = Resolv::DNS.new() if !nameserver

#resolver.timeout = 5
puts"Looking up names!"
file = File.open('names', 'r')
file.each_line do |host|
  host.chomp!
  host_to_test = "#{host}.#{domain}"
  result = resolver.getaddresses(host_to_test)
  if result.size != 0 then
    print "#{host_to_test}:\t"
    result.each { |name| puts "\t#{name}"}
  end
#  result = resolver.getresources(host)
#  if result.size != 0 then
#    print "#{host} (R):\t"
#    result.each { |name| puts "\t#{name}"}
#  end
  
  tested = tested + 1
#  puts " -> #{host_to_test}" if tested % 100 == 0
end
