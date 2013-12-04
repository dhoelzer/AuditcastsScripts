#!/usr/bin/ruby

require 'time'

if(ARGV.length < 1 || ARGV.length > 1) then
  puts "You must give me a correction offset in minutes!"
  exit 1
end

correction = ARGV.first
puts "Correcting by #{correction}"
input = IO.new STDIN.fileno
input.each_line do |line|
  timestamp = line[0,15]
  rest = line[16..-1]
  timestamp = Time.parse(timestamp)
  timestamp = timestamp + (correction.to_i * 60)
  puts "#{timestamp.strftime("%b %d %k:%M:%S")} #{rest}"
end
