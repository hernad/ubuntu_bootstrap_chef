#!/usr/bin/env ruby

cd = Dir.pwd

require cd + "/rackspace_server"

r = RackServer.new

name = ENV['OS_SERVER_NAME']

s = r.find_server_by_name(name)

if s.nil?
   puts "server imena #{name} ne postoji ?!"
else
   puts "Restartujem server #{s.name}"
   s.reload
end

#server.destroy
