#!/usr/bin/env python

import os
import clouddns

def record_exists(domain, name):
    for record in domain.get_records():
        if (record.name == name):
            return 1

    return 0


def list_domains(connection):
    print "evo brig.out domena koje hostira rackspace:"

    for domain in connection.get_domains():
            print domain.name


import sys
from optparse import OptionParser

def main(argv):
    dns_record=''
    ip_address=''


    #print "definisati environment varijable OS_USERNAME=bringout, OS_PASSWORD=api_key_rackspace,"
    #print "OS_DNS_DOMAIN u ~/.bash_profile"


    parser = OptionParser()
    parser.add_option("-d", "--dns-domain", type="string", dest="dns_domain",
                          help="DNS DOMAIN")
    parser.add_option("-r", "--dns-record", type="string", dest="dns_record",
                          help="DNS RECORD")
    parser.add_option("-i", "--ip-address", type="string", dest="ip_address", 
                          help="IP ADDRESS")

    (options, argv) = parser.parse_args(argv)

    print "dns_domain:", options.dns_domain, "dns_record:", options.dns_record, "ip_address", options.ip_address

    if (options.dns_domain == None) or (options.dns_record == None) or (options.ip_address == None):
        parser.print_help()
        sys.exit(0)

    username = os.environ['OS_USERNAME']
    apikey = os.environ['OS_PASSWORD']
    dns = clouddns.connection.Connection(username, apikey)

    list_domains(dns)

    #Create new record::

    dns_record = options.dns_record
    ip_address = options.ip_address
    dns_domain = options.dns_domain
    domain = dns.get_domain(name=dns_domain)

    if not record_exists(domain, dns_record):
        domain.create_record(dns_domain, dns_record, 'A')
    else:
        print "dns record postoji " + dns_record

    #Update a record::

    record = domain.get_record(name=dns_record)
    record.update(data=ip_address)

    # list sve zapise
    for record in domain.get_records():
            print '(%s) %s -> %s' % (record.type, record.name, record.data)


if __name__ == "__main__":
     main(sys.argv)
