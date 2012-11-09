#https://www.engineyard.com/blog/2011/spinning-up-cloud-compute-instances/

require 'fog'

ssh_key = "~/.ssh/sezame_otvori_se"

puts ARGV[0]

RACKSPACE_USERNAME=ENV['OS_USERNAME']
RACKSPACE_API_KEY=ENV['OS_PASSWORD']

connection = Fog::Compute.new({
  :provider           => 'Rackspace',
  :rackspace_username => RACKSPACE_USERNAME,
  :rackspace_api_key  => RACKSPACE_API_KEY
})

# https://www.engineyard.com/blog/2011/spinning-up-cloud-compute-instances/
# knife rackspace flavor list => 125  Ubuntu 12.04 LTS
server = connection.servers.bootstrap({
   :image_id => 125,
   :flavor_id => 1,
   :name => "gitlab.test.out.ba",
   :private_key_path => ssh_key,
   :public_key_path => ssh_key + ".pub"
})


#connection.servers

