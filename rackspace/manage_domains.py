#!/usr/bin/env python

import os
import clouddns

print "definisati environment varijable OS_USERNAME=bringout, OS_PASSWORD=api_key_rackspace,"
print "OS_DNS_NAME u ~/.bash_profile"

def record_exists(domain, name):
    for record in domain.get_records():
        if (record.name == name):
            return 1

    return 0


username = os.environ['OS_USERNAME']
apikey = os.environ['OS_PASSWORD']
dns = clouddns.connection.Connection(username, apikey)

print "evo brig.out domena koje hostira rackspace:"

for domain in dns.get_domains():
        print domain.name


#Create new record::

dns_record = os.environ["OS_DNS_RECORD"]
dns_domain = os.environ["OS_DNS_DOMAIN"]
domain = dns.get_domain(name=dns_domain)

if not record_exists(domain, dns_record):
    domain.create_record(dns_record, '127.0.0.1', 'A')
else:
    print "dns record postoji " + dns_record

#Update a record::

record = domain.get_record(name=dns_record)
record.update(data='192.168.3.17', ttl=600)

# list sve zapise
for record in domain.get_records():
        print '(%s) %s -> %s' % (record.type, record.name, record.data)


import sys, getopt

def main(argv):
   dns_record=''
   ip_address=''

   try:
       opts, args = getopt.getopt(argv, "hd:r:")




