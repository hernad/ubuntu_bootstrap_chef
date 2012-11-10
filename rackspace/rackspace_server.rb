#!/usr/bin/env ruby

#https://www.engineyard.com/blog/2011/spinning-up-cloud-compute-instances/

require 'fog'

class RackServer

  attr :username
  attr :api_key
  attr :server_name
  attr :connection
  attr :ssh_key

  def initialize

    @username=ENV['OS_USERNAME']
    @api_key=ENV['OS_PASSWORD']

    if @username.nil? or @api_key.nil?
      puts "OS_USERNAME, OS_PASSWORD envars definisati !"
      exit 1
    end

     @server_name = ENV['OS_SERVER_NAME']
     @ssh_key = ENV['OS_SSH_KEY'] || "~/.ssh/sezame_otvori_se"

     if @server_name.nil?
        puts "OS_SERVER_NAME envar definisati !"
        exit 1
     end

     @connection = Fog::Compute.new({
       :provider           => 'Rackspace',
       :rackspace_username => @username,
       :rackspace_api_key  => @api_key
     })

  end

  def bootstrap
    puts "kreiram ubuntu server 12.04 server ..."

    # https://www.engineyard.com/blog/2011/spinning-up-cloud-compute-instances/
    # knife rackspace flavor list => 125  Ubuntu 12.04 LTS

    server = @connection.servers.bootstrap({
       :image_id => 125,
       :flavor_id => 2,
       :name => @server_name,
       :private_key_path => @ssh_key,
       :public_key_path => @ssh_key + ".pub"
    })
  end


  def wait_until_active
    until find_server_by_name(@server_name).state == "ACTIVE"
       print "cekam da se server podigne ..."
       sleep 3
    end
    print "server je kreiran !"
    s=find_server_by_name(@server_name)
    print "Server: #{s.name} IP: #{s.public_ip_address}"
  end

  def find_server_by_name(name)
     arr = @connection.servers.select {|i| i.name == name}
     if arr.length > 0
        arr.first
     else
        nil
     end
  end

  def export_os_public_ip
     server = find_server_by_name(@server_name)
     if server
        "export OS_PUBLIC_IP=#{server.public_ip_address}"
     else
        "unset OS_PUBLIC_IP"
     end
  end
end


#server.reload
#server.destroy
