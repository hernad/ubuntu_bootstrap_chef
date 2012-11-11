#!/usr/bin/env ruby

cd = Dir.pwd

require cd + "/rackspace_server"

r = RackServer.new

name = ENV['OS_SERVER_NAME']

s = r.find_server_by_name(name)


if s.nil?
   puts "radim bootstrap servera #{name}"
   r.bootstrap
else
   puts "Server sa imenom #{s.name} vec postoji !"
   puts "Server: #{s.name} IP: #{s.public_ip_address}"
end

r.wait_until_active


