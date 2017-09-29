#!/usr/bin/env ruby
require 'json'
require 'aws-sdk'

File.open('node.cfg', 'w') do |file|
	File.open('pssh_hosts', 'w') do |pssh_file|

	file.write("
[manager]
type=manager
host=10.95.190.205

[proxy]
type=proxy
host=10.95.190.205

")

	regions = `aws ec2 describe-regions --output text | cut -f3`
	regions.split(/\n/).each do |region|
		puts region
		ec2 = Aws::EC2::Resource.new(region: region)
		ec2.instances.each do |i|
			i.tags.each do |tag|
				if (tag.key == "Name" && tag.value.include?("VPN")) then
					file.write("[#{tag.value}]\ntype=worker\nhost=#{i.private_ip_address}\n\n")
					pssh_file.write("#{i.private_ip_address}\n")
				end
			end
		end
	end
end
end
