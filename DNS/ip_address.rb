#
# Copyright 2011, David Hoelzer
# All Rights Reserved
#
# This code is released as free open source code.  You are welcome to use, modify and
# redistribute this code as you see fit provided that this copyright notice remains
# in place and intact.
class IPAddress
  @address

  def address=(address)
    return 0 if address.nil?
    parts = address.to_s.split(".")
    return 0 if parts.count < 4
    @address = 0
    @address += Integer(parts[3])
    @address += Integer(parts[2]) << 8
    @address += Integer(parts[1]) << 16
    @address += Integer(parts[0]) << 24
    return @address
  end

  def raw_address
    @address
  end

  def address()
    [24, 16, 8, 0].collect {|b| (@address >> b) & 255}.join('.')
  end

  def initialize(address)
    self.address=(address)
  end

  def >(other_address)
    return false if !other_address.instance_of?(IPAddress)
    return true if @address > other_address.raw_address
    return false
  end

  def <(other_address)
    return false if !other_address.instance_of?(IPAddress)
    return true if @address < other_address.raw_address
    return false
  end

  def ==(other_address)
    return false if !other_address.instance_of?(IPAddress)
    return true if @address == other_address.raw_address
    return false
  end

  def +(amount)
    #return self if !amount.instance_of?(Integer)
    @address += amount
    return self
  end
end