create chef environment on your empty ubuntu machine (rackspace host)


ovaj čovjek je imao istu ideju:

http://www.wolfe.id.au/2012/09/10/how-i-use-chef-solo-with-ubuntu-12.04/

<pre>
sudo su root -c "(apt-get install -y curl) && (curl -L https://raw.github.com/hernad/ubuntu_bootstrap_chef/master/bootstrap.sh | bash)"
</pre>


Mac OS X 
---------

brew install ssh-copy-id
