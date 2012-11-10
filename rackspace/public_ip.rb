#!/usr/bin/env ruby
#
cd = Dir.pwd

require cd + "/rackspace_server"

r = RackServer.new
print r.public_ip

