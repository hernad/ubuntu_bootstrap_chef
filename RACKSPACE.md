Rackspace v2


http://docs.rackspace.com/servers/api/v2/cs-gettingstarted/content/section_gs_install_nova.html


sudo easy_install pip
sudo pip install rackspace-novaclient


~/.bash_profile popunio

nova client
-----------

~$ nova credentials
<pre>
+------------------------+---------------------------------------------------------------------------------------+
| User Credentials       | Value
|
+------------------------+---------------------------------------------------------------------------------------+
| RAX-AUTH:defaultRegion |
|
| id                     | 299999
|
| name                   | bringout
|
| roles                  | [{u'description': u'User Admin Role.', u'id':
u'3', u'name': u'identity:user-admin'}] |
+------------------------+---------------------------------------------------------------------------------------+
+---------+----------------------------------------+
| Token   | Value                                  |
+---------+----------------------------------------+
| expires | 2012-11-09T08:07:36.000-06:00          |
| id      | xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx   |
| tenant  | {u'id': u'75999',   u'name': u'75999'} |
+---------+----------------------------------------+
</pre>



<pre>
	~$ nova image-list
	+--------------------------------------+----------------------------------------------------------------------------------------------+--------+--------+
	| ID                                   | Name                                                                                         | Status | Server |
	+--------------------------------------+----------------------------------------------------------------------------------------------+--------+--------+
	| c94f5e59-0760-467a-ae70-9a37cfa6b94e | Arch 2012.08                                                                                 | ACTIVE |        |
	| 03318d19-b6e6-4092-9b5c-4758ee0ada60 | CentOS 5.6                                                                                   | ACTIVE |        |
	| acf05b3c-5403-4cf0-900c-9b12b0db0644 | CentOS 5.8                                                                                   | ACTIVE |        |
	...
	| 3afe97b2-26dc-49c5-a2cc-a2fc8d80c001 | Ubuntu 11.10 (Oneiric Oncelot)                                                               | ACTIVE |        |
	| 5cebb13a-f783-4f8c-8058-c4182c724ccd | Ubuntu 12.04 LTS (Precise Pangolin)                                                          | ACTIVE |        |
                | ACTIVE |        |
	| 80599479-b5a2-49f2-bb46-2bc75a8be98b | Windows Server 2008 R2 SP1 (with updates) + SQL Server 2008 R2 SP1 Web                    ..

	| d6153e86-f4e0-4053-a711-d35632e512cd | Windows Server 2008 R2 SP1 + SQL Server 2008 R2 Web                                          | ACTIVE |        |
	| f7d06722-2b30-4c02-b74d-da5a7337f357 | Windows Server 2008 R2 SP1 + SQL Server 2012 Standard                                        | ACTIVE |        |
	| e7a11eed-d348-44da-8210-f136d4256e81 | Windows Server 2008 R2 SP1 + SQL Server 2012 Web                                             | ACTIVE |        |
    ...                                   
	| d226f189-f83f-4569-95b8-622133d71f02 | Windows Server 2012 + SQL Server 2012 Standard                                               | ACTIVE |        |
	| 057d2670-68bc-4e28-b7b1-b9bc72245683 | Windows Server 2012 + SQL Server 2012 Web                                                    | ACTIVE |        |
	| 096c55e5-39f3-48cf-a413-68d9377a3ab6 | openSUSE 12.1                                                                                | ACTIVE |        |
	+--------------------------------------+----------------------------------------------------------------------------------------------+--------+--------+
</pre>



nova flavor-show
<pre>
	~$ nova flavor-list
	+----+-------------------------+-----------+------+-----------+------+-------+-------------+-----------+-------------+
	| ID | Name                    | Memory_MB | Disk | Ephemeral | Swap | VCPUs | RXTX_Factor | Is_Public | extra_specs |
	+----+-------------------------+-----------+------+-----------+------+-------+-------------+-----------+-------------+
	| 2  | 512MB Standard Instance | 512       | 20   | N/A       | 512  | 1     | 2.0         | N/A       | N/A         |
	| 3  | 1GB Standard Instance   | 1024      | 40   | N/A       | 1024 | 1     | 3.0         | N/A       | N/A         |
	| 4  | 2GB Standard Instance   | 2048      | 80   | N/A       | 2048 | 2     | 6.0         | N/A       | N/A         |
	| 5  | 4GB Standard Instance   | 4096      | 160  | N/A       | 2048 | 2     | 10.0        | N/A       | N/A         |
	| 6  | 8GB Standard Instance   | 8192      | 320  | N/A       | 2048 | 4     | 15.0        | N/A       | N/A         |
	| 7  | 15GB Standard Instance  | 15360     | 620  | N/A       | 2048 | 6     | 20.0        | N/A       | N/A         |
	| 8  | 30GB Standard Instance  | 30720     | 1200 | N/A       | 2048 | 8     | 30.0        | N/A       | N/A         |
	+----+-------------------------+-----------+------+-----------+------+-------+-------------+-----------+-------------+
</pre>


<pre>
~$ nova flavor-show 2
+-------------+-------------------------+
| Property    | Value                   |
+-------------+-------------------------+
| disk        | 20                      |
| extra_specs | N/A                     |
| id          | 2                       |
| name        | 512MB Standard Instance |
| ram         | 512                     |
| rxtx_factor | 2.0                     |
| swap        | 512                     |
| vcpus       | 1                       |
+-------------+-------------------------+
</pre>




~/FIT/SI/agile_dev_env/ubuntu_boostrap_chef/rackspace$ nova boot --flavor 2 --image 5cebb13a-f783-4f8c-8058-c4182c724ccd python.test.out.ba
<pre>
+-------------------------+--------------------------------------+
| Property                | Value                                |
+-------------------------+--------------------------------------+
| OS-DCF:diskConfig       | AUTO                                 |
| OS-EXT-STS:power_state  | 0                                    |
| OS-EXT-STS:task_state   | scheduling                           |
| OS-EXT-STS:vm_state     | building                             |
| accessIPv4              |                                      |
| accessIPv6              |                                      |
| adminPass               | 6v7CCiSEr5h9                         |
| created                 | 2012-11-08T14:33:48Z                 |
| flavor                  | 512MB Standard Instance              |
| hostId                  |                                      |
| id                      | 987f3613-aab6-435b-b513-a84a5cd40716 |
| image                   | Ubuntu 12.04 LTS (Precise Pangolin)  |
| metadata                | {}                                   |
| name                    | python.test.out.ba                   |
| progress                | 0                                    |
| rax-bandwidth:bandwidth | []                                   |
| status                  | BUILD                                |
| tenant_id               | 758631                               |
| updated                 | 2012-11-08T14:33:48Z                 |
| user_id                 | 270191                               |
+-------------------------+--------------------------------------+
</pre>


~/FIT/SI/agile_dev_env/ubuntu_boostrap_chef/rackspace$ nova show python.test.out.ba
<pre>
+-------------------------+----------------------------------------------------------------------------+
| Property                | Value                                                                      |
+-------------------------+----------------------------------------------------------------------------+
| OS-DCF:diskConfig       | AUTO                                                                       |
| OS-EXT-STS:power_state  | 0                                                                          |
| OS-EXT-STS:task_state   | spawning                                                                   |
| OS-EXT-STS:vm_state     | building                                                                   |
| accessIPv4              |                                                                            |
| accessIPv6              |                                                                            |
| created                 | 2012-11-08T14:34:07Z                                                       |
| flavor                  | 512MB Standard Instance (2)                                                |
| hostId                  | 996dc5d48d7b14866c064ce3021e1d6709872415e0a1a98eb973c6b9                   |
| id                      | 987f3613-aab6-435b-b513-a84a5cd40716                                       |
| image                   | Ubuntu 12.04 LTS (Precise Pangolin) (5cebb13a-f783-4f8c-8058-c4182c724ccd) |
| metadata                | {}                                                                         |
| name                    | python.test.out.ba                                                         |
| private network         | 10.180.14.87                                                               |
| progress                | 42                                                                         |
| public network          | 2001:4800:780e:0510:ce5e:5464:ff04:9646, 198.61.200.137                    |
| rax-bandwidth:bandwidth | []                                                                         |
| status                  | BUILD                                                                      |
| tenant_id               | 758631                                                                     |
| updated                 | 2012-11-08T14:35:04Z                                                       |
| user_id                 | 270191                                                                     |
+-------------------------+----------------------------------------------------------------------------+
</pre>


~/FIT/SI/agile_dev_env/ubuntu_boostrap_chef/rackspace$ nova show python.test.out.ba
<pre>
+-------------------------+----------------------------------------------------------------------------+
| Property                | Value                                                                      |
+-------------------------+----------------------------------------------------------------------------+
| OS-DCF:diskConfig       | AUTO                                                                       |
| OS-EXT-STS:power_state  | 1                                                                          |
| OS-EXT-STS:task_state   | None                                                                       |
| OS-EXT-STS:vm_state     | active                                                                     |
| accessIPv4              | 198.61.200.137                                                             |
| accessIPv6              | 2001:4800:780e:0510:ce5e:5464:ff04:9646                                    |
| created                 | 2012-11-08T14:34:07Z                                                       |
| flavor                  | 512MB Standard Instance (2)                                                |
| hostId                  | 996dc5d48d7b14866c064ce3021e1d6709872415e0a1a98eb973c6b9                   |
| id                      | 987f3613-aab6-435b-b513-a84a5cd40716                                       |
| image                   | Ubuntu 12.04 LTS (Precise Pangolin) (5cebb13a-f783-4f8c-8058-c4182c724ccd) |
| metadata                | {}                                                                         |
| name                    | python.test.out.ba                                                         |
| private network         | 10.180.14.87                                                               |
| progress                | 100                                                                        |
| public network          | 2001:4800:780e:0510:ce5e:5464:ff04:9646, 198.61.200.137                    |
| rax-bandwidth:bandwidth | []                                                                         |
| status                  | ACTIVE                                                                     |
| tenant_id               | 758631                                                                     |
| updated                 | 2012-11-08T14:38:12Z                                                       |
| user_id                 | 270191                                                                     |
+-------------------------+----------------------------------------------------------------------------+
</pre>


ssh-copy-id  -i ~/.ssh/sezame_otvori_se root@198.61.200.137

