#!/usr/bin/env ruby

ARGF.each do |line|
  line.chomp.scan(/[A-Z][A-Z]/).each do |pair|
    letters = pair.split(//)
    print ((letters[0].ord-'A'.ord)*16 + (letters[1].ord-'A'.ord)).chr
  end
  puts
end

  