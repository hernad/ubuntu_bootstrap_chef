#!/usr/bin/env ruby

#https://www.engineyard.com/blog/2011/spinning-up-cloud-compute-instances/

require 'fog'


def find_server_by_name(servers, name)
   arr = servers.select {|i| i.name == name}
   if arr.length > 0
      arr.first
   else
      nil
   end
end


RACKSPACE_USERNAME=ENV['OS_USERNAME']
RACKSPACE_API_KEY=ENV['OS_PASSWORD']

if RACKSPACE_USERNAME.nil? or RACKSPACE_API_KEY.nil?
  puts "OS_USERNAME, OS_PASSWORD envars definisati !"
  exit 1
end

server_name = ENV['OS_SERVER_NAME']
ssh_key = ENV['OS_SSH_KEY'] || "~/.ssh/sezame_otvori_se"

if server_name.nil?
  puts "OS_SERVER_NAME envar definisati !"
  exit
end

connection = Fog::Compute.new({
  :provider           => 'Rackspace',
  :rackspace_username => RACKSPACE_USERNAME,
  :rackspace_api_key  => RACKSPACE_API_KEY
})

puts "kreiram ubuntu server 12.04 server ..."

# https://www.engineyard.com/blog/2011/spinning-up-cloud-compute-instances/
# knife rackspace flavor list => 125  Ubuntu 12.04 LTS

if false
server = connection.servers.bootstrap({
   :image_id => 125,
   :flavor_id => 1,
   :name => server_name,
   :private_key_path => ssh_key,
   :public_key_path => ssh_key + ".pub"
})
server.wait_for { ready? }
end

#puts #{server}

puts #{connection.servers.get(server.identity)}



until find_server_by_name(connection.servers, 'gitlab.test.out.ba').state == "ACTIVE"
   print "cekam da se server podigne ..."
   sleep 3
end

server=find_server_by_name(connection.servers, 'gitlab.test.out.ba')

print export OS_PUBLIC_IP=#{server.public_ip_address}"
#server.reload
#server.destroy

