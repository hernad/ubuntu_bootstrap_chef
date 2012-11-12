Boostrap chef on ubuntu
========================

OS envars
---------

~/.bash_profile 

    export OS_AUTH_URL=https://identity.api.rackspacecloud.com/v2.0/
    export OS_AUTH_SYSTEM=rackspace
    export OS_REGION_NAME=DFW
    export OS_USERNAME=bringout

    export OS_SERVER_NAME="gitlab.knowhow.out.ba"
    export OS_DNS_DOMAIN="knowhow.out.ba"

    #export OS_SERVER_NAME="gitlab-stable.test.out.ba"
    #export OS_DNS_DOMAIN="test.out.ba"

    export GITLAB_REPOS="git://github.com/hernad/gitlabhq.git"
    #export GITLAB_VERSION="v3.0.2"
    export GITLAB_VERSION="master"

    # OS_ENVARS sadrzi sve varijable koje chef-solo treba kod konifiguracije  remote sistema
    OS_ENVARS="GMAIL_USER=bring.out.sa@gmail.com GMAIL_PASSWORD=pwd"
    OS_ENVARS="$OS_ENVARS MYSQL_ROOT_PWD=pwd MYSQL_PWD=pwd2"
    OS_ENVARS="$OS_ENVARS GITHUB_USER=hernad GITHUB_PROJECT=vagrant_gitlab"
    OS_ENVARS="$OS_ENVARS OS_SERVER_NAME=$OS_SERVER_NAME
    OS_DNS_DOMAIN=$OS_DNS_DOMAIN"
    OS_ENVARS="$OS_ENVARS GITLAB_VERSION=$GITLAB_VERSION
    GITLAB_REPOS=$GITLAB_REPOS"
    export OS_ENVARS

    export OS_TENANT_NAME=bringout
    export NOVA_RACK_AUTH=1
    export OS_PASSWORD=rackspace_api_key
    export OS_PROJECT_ID=bringout
    export OS_NO_CACHE=1


Create and setup rackspace server
----------------------------------

[./setup\_rack\_server.sh](https://github.com/hernad/ubuntu_bootstrap_chef/blob/master/rackspace/setup_rack_server.sh)

    ...

    Selecting previously unselected package libc6-dev.
    Unpacking libc6-dev (from .../libc6-dev_2.15-0ubuntu10.3_amd64.deb) ...
    Selecting previously unselected package cpp-4.6.
    Unpacking cpp-4.6 (from .../cpp-4.6_4.6.3-1ubuntu5_amd64.deb) ...
    Selecting previously unselected package cpp.
    Unpacking cpp (from .../cpp_4%3a4.6.3-1ubuntu5_amd64.deb) ...
    Selecting previously unselected package gcc-4.6.

    ....

    Unpacking manpages-dev (from .../manpages-dev_3.35-0.1ubuntu1_all.deb) ...
    Selecting previously unselected package unattended-upgrades.
    Unpacking unattended-upgrades (from .../unattended-upgrades_0.76_all.deb) ...
    Selecting previously unselected package python-pycurl.
    Unpacking python-pycurl (from .../python-pycurl_7.19.0-4ubuntu3_amd64.deb) ...
    Selecting previously unselected package python-software-properties.
    Unpacking python-software-properties (from .../python-software-properties_0.82.7.3_all.deb) ...
    Selecting previously unselected package ruby1.9.1.
    Unpacking ruby1.9.1 (from .../ruby1.9.1_1.9.3.0-1ubuntu2.4_amd64.deb) ...
    Selecting previously unselected package ri1.9.1.
    Unpacking ri1.9.1 (from .../ri1.9.1_1.9.3.0-1ubuntu2.4_all.deb) ...
    Selecting previously unselected package ruby1.9.1-dev.
    Unpacking ruby1.9.1-dev (from .../ruby1.9.1-dev_1.9.3.0-1ubuntu2.4_amd64.deb) ...
    Selecting previously unselected package libyaml-dev.

    ...

    Setting up libk5crypto3 (1.10+dfsg~beta1-2ubuntu0.3) ...
    Setting up libkrb5-3 (1.10+dfsg~beta1-2ubuntu0.3) ...
    Setting up libgssapi-krb5-2 (1.10+dfsg~beta1-2ubuntu0.3) ...
    Setting up libgssrpc4 (1.10+dfsg~beta1-2ubuntu0.3) ...
    Setting up libyaml-0-2 (0.1.4-2) ...
    Setting up libgnutlsxx27 (2.12.14-5ubuntu3.1) ...
    Setting up libmpc2 (0.9-4) ...
    Setting up m4 (1.4.16-2ubuntu1) ...
    Setting up autoconf (2.68-1ubuntu2) ...
    Setting up autotools-dev (20120210.1ubuntu1) ...
    Setting up automake (1:1.11.3-1ubuntu2) ...
    update-alternatives: using /usr/bin/automake-1.11 to provide /usr/bin/automake (automake) in auto mode.
    Setting up binutils (2.22-6ubuntu1) ...
    Setting up libc-dev-bin (2.15-0ubuntu10.3) ...
    Setting up linux-libc-dev (3.2.0-32.51) ...
    Setting up libc6-dev (2.15-0ubuntu10.3) ...
    Setting up cpp-4.6 (4.6.3-1ubuntu5) ...
    Setting up cpp (4:4.6.3-1ubuntu5) ...
    Setting up gcc-4.6 (4.6.3-1ubuntu5) ...
    Setting up gcc (4:4.6.3-1ubuntu5) ...
    Setting up make (3.81-8.1ubuntu1) ...
    Setting up libdpkg-perl (1.16.1.2ubuntu7) ...
    Setting up dpkg-dev (1.16.1.2ubuntu7) ...
    Setting up fakeroot (1.18.2-1) ...
    update-alternatives: using /usr/bin/fakeroot-sysv to provide /usr/bin/fakeroot (fakeroot) in auto mode.
    Setting up liberror-perl (0.17-1) ...
    Setting up git-man (1:1.7.9.5-1) ...
    Setting up git (1:1.7.9.5-1) ...
    Setting up comerr-dev (2.1-1.42-1ubuntu2) ...
    Setting up krb5-multidev (1.10+dfsg~beta1-2ubuntu0.3) ...
    Setting up libalgorithm-diff-perl (1.19.02-2) ...
    Setting up libalgorithm-diff-xs-perl (0.04-2build2) ...

    ...

    Setting up g++ (4:4.6.3-1ubuntu5) ...
    update-alternatives: using /usr/bin/g++ to provide /usr/bin/c++ (c++) in auto mode.
    Setting up build-essential (11.5ubuntu2.1) ...
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place
    Building native extensions.  This could take a while...
    [Version 0.7.8] test suite cleanup (eliminated some race conditions related to queue.message_count)
    Building native extensions.  This could take a while...
    Successfully installed mixlib-config-1.1.2
    Successfully installed mixlib-cli-1.2.2
    Successfully installed mixlib-log-1.4.1
    Successfully installed mixlib-authentication-1.3.0
    Successfully installed mixlib-shellout-1.1.0
    Successfully installed systemu-2.5.2
    Successfully installed yajl-ruby-1.1.0
    Successfully installed ipaddress-0.8.0
    Successfully installed ohai-6.14.0
    Successfully installed mime-types-1.19
    ...

    Successfully installed highline-1.6.15
    Successfully installed erubis-2.7.0
    Successfully installed moneta-0.6.0
    Successfully installed uuidtools-2.1.3
    Successfully installed chef-10.16.2
    Successfully installed bundler-1.2.1
    Successfully installed rake-0.9.2.2
    Building native extensions.  This could take a while...
    Successfully installed ruby-shadow-2.1.4
    26 gems installed
    ----------------------------------------
    install cookbook
    ----------------------------------------
    git://github.com/hernad/vagrant_gitlab.git
    Cloning into 'vagrant_gitlab'...
    /root/vagrant_gitlab
    Already up-to-date.
      % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                     Dload  Upload   Total   Spent    Left  Speed
    100  1049  100  1049    0     0   420run_solo by ubuntu_chef_bootstrap--     0
    Reading package lists...
    Building dependency tree...3      0 --:--:-- --:--:-- --:--:--  5324
    run_solo.sh: line 26: /etc/profile.d/rvm.sh: No such file or directory

    Reading state information...
    The following extra packages will be installed:
      bison libbison-dev libreadline-gplv2-dev libreadline5 libsqlite3-0
      libsqlite3-dev libxml2 libxml2-dev
    Suggested packages:
      bison-doc sqlite3-doc
    The following packages will be REMOVED:
      libreadline-dev libreadline6-dev
    The following NEW packages will be installed:
      bison libbison-dev libreadline-gplv2-dev libreadline5 libsqlite3-dev
      libxml2-dev ruby-rvm
    The following packages will be upgraded:
      libsqlite3-0 libxml2
    2 upgraded, 7 newly installed, 2 to remove and 92 not upgraded.
    Need to get 3700 kB of archives.
    After this operation, 7735 kB of additional disk space will be used.
    Get:1 http://mirror.rackspace.com/ubuntu/ precise-updates/main libsqlite3-0 amd64 3.7.9-2ubuntu1.1 [349 kB]
    Get:2 http://mirror.rackspace.com/ubuntu/ precise-updates/main libxml2 amd64 2.7.8.dfsg-5.1ubuntu4.2 [673 kB]
    Get:3 http://mirror.rackspace.com/ubuntu/ precise/main libreadline5 amd64 5.2-11 [128 kB]

    ...

    Get:7 http://mirror.rackspace.com/ubuntu/ precise-updates/main libxml2-dev amd64 2.7.8.dfsg-5.1ubuntu4.2 [804 kB]
    Get:8 http://mirror.rackspace.com/ubuntu/ precise/main libreadline-gplv2-dev amd64 5.2-11 [246 kB]
    Get:9 http://mirror.rackspace.com/ubuntu/ precise-updates/universe ruby-rvm all 1.6.9-0ubuntu2.1 [713 kB]
    perl: warning: Setting locale failed.
    perl: warning: Please check that your locale settings:
      LANGUAGE = (unset),
      LC_ALL = (unset),
      LC_CTYPE = "bs_BA.UTF-8",
      LANG = "en_US.UTF-8"
        are supported and installed on your system.
    perl: warning: Falling back to the standard locale ("C").
    locale: Cannot set LC_CTYPE to default locale: No such file or directory
    locale: Cannot set LC_ALL to default locale: No such file or directory
    debconf: unable to initialize frontend: Dialog
    debconf: (TERM is not set, so the dialog frontend is not usable.)
    debconf: falling back to frontend: Readline
    debconf: unable to initialize frontend: Readline
    debconf: (This frontend requires a controlling tty.)
    debconf: falling back to frontend: Teletype
    dpkg-preconfigure: unable to re-open stdin: 
    Fetched 3700 kB in 2s (1745 kB/s)
    (Reading database ... 74838 files and directories currently installed.)
    Removing libreadline-dev ...
    Removing libreadline6-dev ...
    Processing triggers for install-info ...
    (Reading database ... 74809 files and directories currently installed.)

    .....

    Setting up libsqlite3-0 (3.7.9-2ubuntu1.1) ...
    Setting up libxml2 (2.7.8.dfsg-5.1ubuntu4.2) ...
    Setting up libreadline5 (5.2-11) ...
    Setting up libbison-dev (1:2.5.dfsg-2.1) ...
    Setting up bison (1:2.5.dfsg-2.1) ...
    update-alternatives: using /usr/bin/bison.yacc to provide /usr/bin/yacc (yacc) in auto mode.
    Setting up libsqlite3-dev (3.7.9-2ubuntu1.1) ...
    Setting up libxml2-dev (2.7.8.dfsg-5.1ubuntu4.2) ...
    Setting up libreadline-gplv2-dev (5.2-11) ...
    Setting up ruby-rvm (1.6.9-0ubuntu2.1) ...
    Processing triggers for libc-bin ...
    ldconfig deferred processing now taking place
    Installing Ruby from source to: /usr/share/ruby-rvm/rubies/ruby-1.9.3-p286, this may take a while depending on your cpu(s)...


    Called from:
      /var/lib/gems/1.9.1/gems/chef-10.16.2/lib/chef/node/attribute.rb:449:in `method_missing'
      /var/lib/gems/1.9.1/gems/chef-10.16.2/lib/chef/node.rb:346:in `method_missing'
      /root/vagrant_gitlab/cookbooks/mysql/libraries/helpers.rb:24:in `debian_before_squeeze?'

    [2012-11-12T10:39:57+00:00] WARN: Setting attributes without specifying a precedence is deprecated and will be
    removed in Chef 11.0. To set attributes at normal precedence, change code like:
    `node["key"] = "value"` # Not this
    to:
    `node.set["key"] = "value"` # This

    Called from:
      /var/lib/gems/1.9.1/gems/chef-10.16.2/lib/chef/node/attribute.rb:449:in `method_missing'
      /var/lib/gems/1.9.1/gems/chef-10.16.2/lib/chef/node.rb:346:in `method_missing'
      /root/vagrant_gitlab/cookbooks/mysql/libraries/helpers.rb:28:in `ubuntu_before_lucid?'

    [2012-11-12T10:39:57+00:00] WARN: Setting attributes without specifying a precedence is deprecated and will be
    removed in Chef 11.0. To set attributes at normal precedence, change code like:
    `node["key"] = "value"` # Not this
    to:
    `node.set["key"] = "value"` # This

    Called from:
      /var/lib/gems/1.9.1/gems/chef-10.16.2/lib/chef/node/attribute.rb:449:in `method_missing'
      /var/lib/gems/1.9.1/gems/chef-10.16.2/lib/chef/node.rb:346:in `method_missing'
      /root/vagrant_gitlab/cookbooks/mysql/attributes/server.rb:105:in `from_file'

    [2012-11-12T10:39:57+00:00] INFO: Processing gem_package[rvm] action install (rvm::default line 21)
    /root/vagrant_gitlab/cookbooks/rvm/libraries/rvm_chef_user_environment.rb:51: warning: class variable access from toplevel
    [2012-11-12T10:39:57+00:00] INFO: Processing execute[apt-get update] action run (mysql::ruby line 23)
    [2012-11-12T10:40:04+00:00] INFO: execute[apt-get update] ran successfully
    [2012-11-12T10:40:04+00:00] INFO: Processing package[mysql-client] action install (mysql::client line 46)
    [2012-11-12T10:40:21+00:00] INFO: Processing package[libmysqlclient-dev] action install (mysql::client line 46)
    [2012-11-12T10:40:25+00:00] INFO: Processing chef_gem[mysql] action install (mysql::ruby line 36)
    [2012-11-12T10:40:31+00:00] INFO: Processing execute[apt-get update] action run (postgresql::ruby line 21)
    [2012-11-12T10:40:39+00:00] INFO: execute[apt-get update] ran successfully
    [2012-11-12T10:40:39+00:00] INFO: Processing package[postgresql-client] action install (postgresql::client line 23)
    [2012-11-12T10:40:46+00:00] INFO: Processing package[libpq-dev] action install (postgresql::client line 23)
    [2012-11-12T10:40:51+00:00] INFO: Processing chef_gem[pg] action install (postgresql::ruby line 36)
    [2012-11-12T10:41:02+00:00] INFO: Enabling redis_6379
    [2012-11-12T10:41:02+00:00] INFO: Processing chef_gem[sshkey] action install (gitlab::default line 72)
    [2012-11-12T10:41:02+00:00] INFO: ohai plugins will be at: /etc/chef/ohai_plugins
    [2012-11-12T10:41:02+00:00] INFO: Processing remote_directory[/etc/chef/ohai_plugins] action create (ohai::default line 27)
    [2012-11-12T10:41:02+00:00] INFO: remote_directory[/etc/chef/ohai_plugins] created directory /etc/chef/ohai_plugins
    [2012-11-12T10:41:02+00:00] INFO: remote_directory[/etc/chef/ohai_plugins] owner changed to 0
    [2012-11-12T10:41:02+00:00] INFO: remote_directory[/etc/chef/ohai_plugins] group changed to 0
    [2012-11-12T10:41:02+00:00] INFO: remote_directory[/etc/chef/ohai_plugins] mode changed to 755
    [2012-11-12T10:41:02+00:00] INFO: Processing cookbook_file[/etc/chef/ohai_plugins/README] action create (dynamically defined)
    [2012-11-12T10:41:03+00:00] INFO: cookbook_file[/etc/chef/ohai_plugins/README] mode changed to 644
    [2012-11-12T10:41:03+00:00] INFO: cookbook_file[/etc/chef/ohai_plugins/README] created file /etc/chef/ohai_plugins/README
    [2012-11-12T10:41:03+00:00] INFO: Processing ohai[custom_plugins] action reload (ohai::default line 42)
    [2012-11-12T10:41:05+00:00] INFO: ohai[custom_plugins] reloaded

    ...

    [2012-11-12T10:41:13+00:00] INFO: Processing package[bash] action install (rvm::system_install line 51)
    [2012-11-12T10:41:13+00:00] INFO: Processing package[curl] action install (rvm::system_install line 51)
    [2012-11-12T10:41:13+00:00] INFO: Processing package[git-core] action install (rvm::system_install line 51)
    [2012-11-12T10:41:15+00:00] INFO: Processing template[/etc/rvmrc] action create (rvm::system_install line 140)
    [2012-11-12T10:41:15+00:00] INFO: template[/etc/rvmrc] backed up to /var/chef/backup/etc/rvmrc.chef-20121112104115
    [2012-11-12T10:41:16+00:00] INFO: template[/etc/rvmrc] updated content
    [2012-11-12T10:41:16+00:00] INFO: template[/etc/rvmrc] owner changed to 0
    [2012-11-12T10:41:16+00:00] INFO: template[/etc/rvmrc] group changed to 0
    [2012-11-12T10:41:16+00:00] INFO: template[/etc/rvmrc] mode changed to 644
    [2012-11-12T10:41:16+00:00] INFO: Processing execute[install system-wide RVM] action run (rvm::system_install line 76)
    [2012-11-12T10:41:22+00:00] INFO: execute[install system-wide RVM] ran successfully
    [2012-11-12T10:41:22+00:00] INFO: Processing execute[upgrade system-wide RVM to none] action run (rvm::system_install line 110)
    [2012-11-12T10:41:22+00:00] INFO: Processing rvm_ruby[1.9.3-p286] action install (rvm::system line 170)
    /root/vagrant_gitlab/cookbooks/rvm/libraries/rvm_chef_user_environment.rb:36: warning: class variable access from toplevel
    [2012-11-12T10:41:23+00:00] INFO: Processing package[build-essential] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:23+00:00] INFO: Processing package[openssl] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:23+00:00] INFO: Processing package[libreadline6] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:23+00:00] INFO: Processing package[libreadline6-dev] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:28+00:00] INFO: Processing package[zlib1g] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:28+00:00] INFO: Processing package[zlib1g-dev] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:28+00:00] INFO: Processing package[libssl-dev] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:28+00:00] INFO: Processing package[libyaml-dev] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:29+00:00] INFO: Processing package[libsqlite3-dev] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:29+00:00] INFO: Processing package[sqlite3] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:32+00:00] INFO: Processing package[libxml2-dev] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:32+00:00] INFO: Processing package[libxslt-dev] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:32+00:00] INFO: package[libxslt-dev] is a virtual package, actually acting on package[libxslt1-dev]
    [2012-11-12T10:41:40+00:00] INFO: Processing package[autoconf] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:40+00:00] INFO: Processing package[libc6-dev] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:40+00:00] INFO: Processing package[ncurses-dev] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:40+00:00] INFO: package[ncurses-dev] is a virtual package, actually acting on package[libncurses5-dev]
    [2012-11-12T10:41:43+00:00] INFO: Processing package[automake] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:43+00:00] INFO: Processing package[libtool] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:47+00:00] INFO: Processing package[bison] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:47+00:00] INFO: Processing package[ssl-cert] action install (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:41:51+00:00] INFO: Building rvm_ruby[ruby-1.9.3-p286], this could take awhile...
    [2012-11-12T10:42:09+00:00] INFO: Installation of rvm_ruby[ruby-1.9.3-p286] was successful.
    [2012-11-12T10:42:11+00:00] INFO: Importing initial gemsets for rvm_ruby[ruby-1.9.3-p286]
    [2012-11-12T10:42:16+00:00] INFO: Processing package[build-essential] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:16+00:00] INFO: Processing package[openssl] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:16+00:00] INFO: Processing package[libreadline6] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:16+00:00] INFO: Processing package[libreadline6-dev] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:16+00:00] INFO: Processing package[zlib1g] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:16+00:00] INFO: Processing package[zlib1g-dev] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:16+00:00] INFO: Processing package[libssl-dev] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:16+00:00] INFO: Processing package[libyaml-dev] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:16+00:00] INFO: Processing package[libsqlite3-dev] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:16+00:00] INFO: Processing package[sqlite3] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:16+00:00] INFO: Processing package[libxml2-dev] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:17+00:00] INFO: Processing package[libxslt-dev] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:17+00:00] INFO: package[libxslt-dev] is a virtual package, actually acting on package[libxslt1-dev]
    [2012-11-12T10:42:17+00:00] INFO: Processing package[autoconf] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:17+00:00] INFO: Processing package[libc6-dev] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:17+00:00] INFO: Processing package[ncurses-dev] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)
    [2012-11-12T10:42:17+00:00] INFO: package[ncurses-dev] is a virtual package, actually acting on package[libncurses5-dev]
    [2012-11-12T10:42:17+00:00] INFO: Processing package[automake] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/ruby.rb line 156)

    ....

    [2012-11-12T10:43:32+00:00] INFO: Processing package[postgresql-client] action install (postgresql::client line 23)
    [2012-11-12T10:43:32+00:00] INFO: Processing package[libpq-dev] action install (postgresql::client line 23)
    [2012-11-12T10:43:32+00:00] INFO: Processing execute[apt-get update] action nothing (postgresql::ruby line 21)
    [2012-11-12T10:43:32+00:00] INFO: Processing chef_gem[pg] action install (postgresql::ruby line 36)
    [2012-11-12T10:43:32+00:00] INFO: Processing package[libreadline-dev] action install (readline::default line 21)
    [2012-11-12T10:43:35+00:00] INFO: Processing package[libreadline5] action install (readline::default line 21)
    [2012-11-12T10:43:35+00:00] INFO: Processing package[openssh-client] action install (openssh::default line 27)
    [2012-11-12T10:43:35+00:00] INFO: Processing package[openssh-server] action install (openssh::default line 27)
    [2012-11-12T10:43:35+00:00] INFO: Processing service[ssh] action enable (openssh::default line 30)
    [2012-11-12T10:43:36+00:00] INFO: service[ssh] enabled
    [2012-11-12T10:43:36+00:00] INFO: Processing service[ssh] action start (openssh::default line 30)
    [2012-11-12T10:43:36+00:00] INFO: Processing template[/etc/ssh/ssh_config] action create (openssh::default line 48)
    [2012-11-12T10:43:36+00:00] INFO: template[/etc/ssh/ssh_config] backed up to /var/chef/backup/etc/ssh/ssh_config.chef-20121112104336
    [2012-11-12T10:43:36+00:00] INFO: template[/etc/ssh/ssh_config] updated content
    [2012-11-12T10:43:36+00:00] INFO: template[/etc/ssh/ssh_config] owner changed to 0
    [2012-11-12T10:43:36+00:00] INFO: template[/etc/ssh/ssh_config] group changed to 0
    [2012-11-12T10:43:36+00:00] INFO: template[/etc/ssh/ssh_config] mode changed to 644
    [2012-11-12T10:43:36+00:00] INFO: Processing template[/etc/ssh/sshd_config] action create (openssh::default line 66)
    [2012-11-12T10:43:36+00:00] INFO: template[/etc/ssh/sshd_config] backed up to /var/chef/backup/etc/ssh/sshd_config.chef-20121112104336
    [2012-11-12T10:43:36+00:00] INFO: template[/etc/ssh/sshd_config] updated content
    [2012-11-12T10:43:36+00:00] INFO: template[/etc/ssh/sshd_config] owner changed to 0
    [2012-11-12T10:43:36+00:00] INFO: template[/etc/ssh/sshd_config] group changed to 0
    [2012-11-12T10:43:36+00:00] INFO: template[/etc/ssh/sshd_config] mode changed to 644
    [2012-11-12T10:43:36+00:00] INFO: Processing package[libxml2-dev] action install (xml::default line 27)
    [2012-11-12T10:43:36+00:00] INFO: Processing package[libxslt-dev] action install (xml::default line 27)
    [2012-11-12T10:43:37+00:00] INFO: package[libxslt-dev] is a virtual package, actually acting on package[libxslt1-dev]
    [2012-11-12T10:43:37+00:00] INFO: Processing package[zlib-devel] action install (zlib::default line 20)
    [2012-11-12T10:43:37+00:00] INFO: Processing package[python] action install (python::package line 55)
    [2012-11-12T10:43:37+00:00] INFO: Processing package[python-dev] action install (python::package line 55)
    [2012-11-12T10:43:54+00:00] INFO: Processing remote_file[/root/vagrant_gitlab/distribute_setup.py] action create (python::pip line 28)
    [2012-11-12T10:43:55+00:00] INFO: remote_file[/root/vagrant_gitlab/distribute_setup.py] updated

    ...

    [2012-11-12T10:43:59+00:00] INFO: Processing directory[/var/run/redis/6379] action create (/root/vagrant_gitlab/cookbooks/redisio/providers/install.rb line 101)
    [2012-11-12T10:43:59+00:00] INFO: directory[/var/run/redis/6379] created directory /var/run/redis/6379
    [2012-11-12T10:43:59+00:00] INFO: directory[/var/run/redis/6379] owner changed to 1000
    [2012-11-12T10:43:59+00:00] INFO: directory[/var/run/redis/6379] group changed to 1001
    [2012-11-12T10:43:59+00:00] INFO: directory[/var/run/redis/6379] mode changed to 755
    [2012-11-12T10:43:59+00:00] INFO: Processing directory[.] action create (/root/vagrant_gitlab/cookbooks/redisio/providers/install.rb line 109)
    [2012-11-12T10:43:59+00:00] INFO: Processing file[] action touch (/root/vagrant_gitlab/cookbooks/redisio/providers/install.rb line 118)
    [2012-11-12T10:43:59+00:00] INFO: Processing file[/var/lib/redis/appendonly-6379.aof] action create (/root/vagrant_gitlab/cookbooks/redisio/providers/install.rb line 127)
    [2012-11-12T10:43:59+00:00] INFO: Processing file[/var/lib/redis/dump-6379.rdb] action create (/root/vagrant_gitlab/cookbooks/redisio/providers/install.rb line 134)
    [2012-11-12T10:43:59+00:00] INFO: Processing template[/etc/redis/6379.conf] action create (/root/vagrant_gitlab/cookbooks/redisio/providers/install.rb line 142)
    [2012-11-12T10:43:59+00:00] INFO: template[/etc/redis/6379.conf] updated content
    [2012-11-12T10:43:59+00:00] INFO: template[/etc/redis/6379.conf] owner changed to 1000
    [2012-11-12T10:43:59+00:00] INFO: template[/etc/redis/6379.conf] group changed to 1001
    [2012-11-12T10:43:59+00:00] INFO: template[/etc/redis/6379.conf] mode changed to 644
    [2012-11-12T10:43:59+00:00] INFO: Processing template[/etc/init.d/redis6379] action create (/root/vagrant_gitlab/cookbooks/redisio/providers/install.rb line 179)
    [2012-11-12T10:44:00+00:00] INFO: template[/etc/init.d/redis6379] updated content
    [2012-11-12T10:44:00+00:00] INFO: template[/etc/init.d/redis6379] owner changed to 0
    [2012-11-12T10:44:00+00:00] INFO: template[/etc/init.d/redis6379] group changed to 0
    [2012-11-12T10:44:00+00:00] INFO: template[/etc/init.d/redis6379] mode changed to 755
    [2012-11-12T10:44:00+00:00] INFO: Processing remote_file[/root/vagrant_gitlab/redis-2.4.16.tar.gz] action create (/root/vagrant_gitlab/cookbooks/redisio/providers/install.rb line 35)
    [2012-11-12T10:44:00+00:00] INFO: remote_file[/root/vagrant_gitlab/redis-2.4.16.tar.gz] updated
    [2012-11-12T10:44:00+00:00] INFO: Processing execute[cd /root/vagrant_gitlab && tar zxf redis-2.4.16.tar.gz] action run (/root/vagrant_gitlab/cookbooks/redisio/providers/install.rb line 43)
    [2012-11-12T10:44:00+00:00] INFO: execute[cd /root/vagrant_gitlab && tar zxf redis-2.4.16.tar.gz] ran successfully
    [2012-11-12T10:44:00+00:00] INFO: Processing execute[cd /root/vagrant_gitlab/redis-2.4.16 && make clean && make] action run (/root/vagrant_gitlab/cookbooks/redisio/providers/install.rb line 50)
    [2012-11-12T10:44:37+00:00] INFO: execute[cd /root/vagrant_gitlab/redis-2.4.16 && make clean && make] ran successfully

    ...

    [2012-11-12T10:46:32+00:00] INFO: Processing package[libperl-dev] action install (perl::default line 21)
    [2012-11-12T10:46:42+00:00] INFO: Processing remote_file[/usr/local/bin/cpanm] action create (perl::default line 26)
    [2012-11-12T10:46:43+00:00] INFO: remote_file[/usr/local/bin/cpanm] updated
    [2012-11-12T10:46:43+00:00] INFO: remote_file[/usr/local/bin/cpanm] owner changed to 0
    [2012-11-12T10:46:43+00:00] INFO: remote_file[/usr/local/bin/cpanm] group changed to 0
    [2012-11-12T10:46:43+00:00] INFO: remote_file[/usr/local/bin/cpanm] mode changed to 755
    [2012-11-12T10:46:43+00:00] INFO: Processing group[git] action create (gitlab::gitolite line 25)
    [2012-11-12T10:46:44+00:00] INFO: group[git] created
    [2012-11-12T10:46:44+00:00] INFO: Processing user[git] action create (gitlab::gitolite line 31)
    [2012-11-12T10:46:44+00:00] INFO: user[git] created
    [2012-11-12T10:46:44+00:00] INFO: Processing directory[/home/git/bin] action create (gitlab::gitolite line 41)
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/bin] created directory /home/git/bin
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/bin] owner changed to 1001
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/bin] group changed to 1002
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/bin] mode changed to 775
    [2012-11-12T10:46:44+00:00] INFO: Processing directory[/home/git/repositories] action create (gitlab::gitolite line 41)
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/repositories] created directory /home/git/repositories
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/repositories] owner changed to 1001
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/repositories] group changed to 1002
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/repositories] mode changed to 775
    [2012-11-12T10:46:44+00:00] INFO: Processing execute[add bin/path to $GIT_HOME/.profile] action run (gitlab::gitolite line 53)
    [2012-11-12T10:46:44+00:00] INFO: execute[add bin/path to $GIT_HOME/.profile] ran successfully
    [2012-11-12T10:46:44+00:00] INFO: Processing directory[/home/git] action create (gitlab::gitolite line 58)
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git] mode changed to 750
    [2012-11-12T10:46:44+00:00] INFO: Processing directory[/home/git/.ssh] action create (gitlab::gitolite line 65)
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/.ssh] created directory /home/git/.ssh
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/.ssh] owner changed to 1001
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/.ssh] group changed to 1002
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/.ssh] mode changed to 740
    [2012-11-12T10:46:44+00:00] INFO: Processing directory[/home/git/.gitolite] action create (gitlab::gitolite line 78)
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/.gitolite] created directory /home/git/.gitolite

    ...

    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/.gitolite/logs] mode changed to 754
    [2012-11-12T10:46:44+00:00] INFO: Processing directory[/home/git/.gitolite/conf] action create (gitlab::gitolite line 85)
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/.gitolite/conf] created directory /home/git/.gitolite/conf
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/.gitolite/conf] owner changed to 1001
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/.gitolite/conf] group changed to 1002
    [2012-11-12T10:46:44+00:00] INFO: directory[/home/git/.gitolite/conf] mode changed to 754
    [2012-11-12T10:46:44+00:00] INFO: Processing template[/home/git/.gitolite.rc] action create (gitlab::gitolite line 93)
    [2012-11-12T10:46:45+00:00] INFO: template[/home/git/.gitolite.rc] updated content
    [2012-11-12T10:46:45+00:00] INFO: template[/home/git/.gitolite.rc] owner changed to 1001
    [2012-11-12T10:46:45+00:00] INFO: template[/home/git/.gitolite.rc] group changed to 1002
    [2012-11-12T10:46:45+00:00] INFO: template[/home/git/.gitolite.rc] mode changed to 644
    [2012-11-12T10:46:45+00:00] INFO: Processing template[/home/git/.gitolite/hooks/common/update] action create (gitlab::gitolite line 104)
    [2012-11-12T10:46:45+00:00] INFO: template[/home/git/.gitolite/hooks/common/update] updated content
    [2012-11-12T10:46:45+00:00] INFO: template[/home/git/.gitolite/hooks/common/update] owner changed to 1001
    [2012-11-12T10:46:45+00:00] INFO: template[/home/git/.gitolite/hooks/common/update] group changed to 1002
    [2012-11-12T10:46:45+00:00] INFO: template[/home/git/.gitolite/hooks/common/update] mode changed to 644
    [2012-11-12T10:46:45+00:00] INFO: Processing git[/home/git/gitolite] action checkout (gitlab::gitolite line 113)
    [2012-11-12T10:46:45+00:00] INFO: git[/home/git/gitolite] cloning repo git://github.com/sitaramc/gitolite.git to /home/git/gitolite
    [2012-11-12T10:46:47+00:00] INFO: git[/home/git/gitolite] checked out branch: master reference: c03d107bac810e663357e7d703a43f30ca0d376e
    [2012-11-12T10:46:47+00:00] INFO: Processing execute[gitolite-install] action run (gitlab::gitolite line 123)
    [2012-11-12T10:46:47+00:00] INFO: execute[gitolite-install] ran successfully
    [2012-11-12T10:46:47+00:00] INFO: Processing execute[fix gitolite repositories permissions] action run (gitlab::gitolite line 137)
    [2012-11-12T10:46:47+00:00] INFO: execute[fix gitolite repositories permissions] ran successfully
    [2012-11-12T10:46:47+00:00] INFO: Processing execute[add gitlabsite to /etc/hosts] action run (gitlab::gitolite line 147)
    [2012-11-12T10:46:47+00:00] INFO: execute[add gitlabsite to /etc/hosts] ran successfully
    [2012-11-12T10:46:47+00:00] INFO: Processing log[>> ARCHITECTURE TIP: Gitlab needs the sendmail command in order to send emails (for things like lost password recovery).] action write (gitlab::email line 30)
    [2012-11-12T10:46:47+00:00] INFO: >> ARCHITECTURE TIP: Gitlab needs the sendmail command in order to send emails (for things like lost password recovery).
    [2012-11-12T10:46:47+00:00] INFO: Processing package[postfix] action install (postfix::default line 21)
    [2012-11-12T10:46:58+00:00] INFO: Processing service[postfix] action enable (postfix::default line 30)
    [2012-11-12T10:46:58+00:00] INFO: Processing template[/etc/postfix/main.cf] action create (postfix::default line 53)
    [2012-11-12T10:46:58+00:00] INFO: template[/etc/postfix/main.cf] backed up to /var/chef/backup/etc/postfix/main.cf.chef-20121112104658
    [2012-11-12T10:46:58+00:00] INFO: template[/etc/postfix/main.cf] updated content
    [2012-11-12T10:46:58+00:00] INFO: template[/etc/postfix/main.cf] owner changed to 0
    [2012-11-12T10:46:58+00:00] INFO: template[/etc/postfix/main.cf] group changed to 0
    [2012-11-12T10:46:58+00:00] INFO: template[/etc/postfix/main.cf] mode changed to 644
    [2012-11-12T10:46:58+00:00] INFO: Processing template[/etc/postfix/master.cf] action create (postfix::default line 53)
    [2012-11-12T10:46:58+00:00] INFO: template[/etc/postfix/master.cf] backed up to /var/chef/backup/etc/postfix/master.cf.chef-20121112104658
    [2012-11-12T10:46:58+00:00] INFO: template[/etc/postfix/master.cf] updated content
    [2012-11-12T10:46:58+00:00] INFO: template[/etc/postfix/master.cf] owner changed to 0
    [2012-11-12T10:46:58+00:00] INFO: template[/etc/postfix/master.cf] group changed to 0
    [2012-11-12T10:46:58+00:00] INFO: template[/etc/postfix/master.cf] mode changed to 644
    [2012-11-12T10:46:58+00:00] INFO: template[/etc/postfix/master.cf] not queuing delayed action restart on service[postfix] (delayed), as it's already been queued
    [2012-11-12T10:46:58+00:00] INFO: Processing service[postfix] action start (postfix::default line 63)
    [2012-11-12T10:47:00+00:00] INFO: Processing package[libsasl2-2] action install (postfix::sasl_auth line 42)
    [2012-11-12T10:47:00+00:00] INFO: Processing package[ca-certificates] action install (postfix::sasl_auth line 42)
    [2012-11-12T10:47:00+00:00] INFO: Processing execute[postmap-sasl_passwd] action nothing (postfix::sasl_auth line 46)
    [2012-11-12T10:47:00+00:00] INFO: Processing template[/etc/postfix/sasl_passwd] action create (postfix::sasl_auth line 51)
    [2012-11-12T10:47:01+00:00] INFO: template[/etc/postfix/sasl_passwd] updated content
    [2012-11-12T10:47:01+00:00] INFO: template[/etc/postfix/sasl_passwd] owner changed to 0
    [2012-11-12T10:47:01+00:00] INFO: template[/etc/postfix/sasl_passwd] group changed to 0
    [2012-11-12T10:47:01+00:00] INFO: template[/etc/postfix/sasl_passwd] mode changed to 400
    [2012-11-12T10:47:01+00:00] INFO: template[/etc/postfix/sasl_passwd] sending run action to execute[postmap-sasl_passwd] (immediate)
    [2012-11-12T10:47:01+00:00] INFO: Processing execute[postmap-sasl_passwd] action run (postfix::sasl_auth line 46)
    [2012-11-12T10:47:01+00:00] INFO: execute[postmap-sasl_passwd] ran successfully
    [2012-11-12T10:47:01+00:00] INFO: template[/etc/postfix/sasl_passwd] not queuing delayed action restart on service[postfix] (delayed), as it's already been queued
    [2012-11-12T10:47:01+00:00] INFO: Processing log[>> USAGE TIP: echo "my body text" | mail -s "test from no reply" -aFrom:noreply@bring.out.ba hernad@bring.out.ba] action write (gitlab::email line 92)
    [2012-11-12T10:47:01+00:00] INFO: >> USAGE TIP: echo "my body text" | mail -s "test from no reply" -aFrom:noreply@bring.out.ba hernad@bring.out.ba
    [2012-11-12T10:47:01+00:00] INFO: Processing package[mailutils] action install (gitlab::email line 96)
    [2012-11-12T10:47:07+00:00] INFO: Processing group[www-data] action create (gitlab::default line 41)
    [2012-11-12T10:47:07+00:00] INFO: Processing user[www-data] action create (gitlab::default line 46)
    [2012-11-12T10:47:07+00:00] INFO: user[www-data] altered
    [2012-11-12T10:47:07+00:00] INFO: Processing group[git] action modify (gitlab::default line 54)
    [2012-11-12T10:47:07+00:00] INFO: group[git] modified
    [2012-11-12T10:47:07+00:00] INFO: Processing group[www-data] action modify (gitlab::default line 60)
    [2012-11-12T10:47:08+00:00] INFO: group[www-data] modified
    [2012-11-12T10:47:08+00:00] INFO: Processing link[/usr/bin/redis-cli] action create (gitlab::default line 67)
    [2012-11-12T10:47:08+00:00] INFO: link[/usr/bin/redis-cli] created
    [2012-11-12T10:47:08+00:00] INFO: Processing chef_gem[sshkey] action install (gitlab::default line 72)
    [2012-11-12T10:47:08+00:00] INFO: Processing python_pip[pygments] action install (gitlab::default line 77)
    [2012-11-12T10:47:08+00:00] INFO: Installing python_pip[pygments] version latest
    [2012-11-12T10:47:16+00:00] INFO: Processing directory[/var/www] action create (gitlab::default line 82)
    [2012-11-12T10:47:16+00:00] INFO: directory[/var/www] created directory /var/www
    [2012-11-12T10:47:16+00:00] INFO: directory[/var/www] owner changed to 33
    [2012-11-12T10:47:16+00:00] INFO: directory[/var/www] group changed to 33
    [2012-11-12T10:47:16+00:00] INFO: Processing directory[/var/www/.ssh] action create (gitlab::default line 89)
    [2012-11-12T10:47:16+00:00] INFO: directory[/var/www/.ssh] created directory /var/www/.ssh
    [2012-11-12T10:47:16+00:00] INFO: directory[/var/www/.ssh] owner changed to 33
    [2012-11-12T10:47:16+00:00] INFO: directory[/var/www/.ssh] group changed to 33
    [2012-11-12T10:47:16+00:00] INFO: directory[/var/www/.ssh] mode changed to 700
    [2012-11-12T10:47:16+00:00] INFO: Processing template[/var/www/.ssh/id_rsa] action create (gitlab::default line 117)
    [2012-11-12T10:47:16+00:00] INFO: template[/var/www/.ssh/id_rsa] updated content
    [2012-11-12T10:47:16+00:00] INFO: template[/var/www/.ssh/id_rsa] owner changed to 33
    [2012-11-12T10:47:16+00:00] INFO: template[/var/www/.ssh/id_rsa] group changed to 33
    [2012-11-12T10:47:16+00:00] INFO: template[/var/www/.ssh/id_rsa] mode changed to 600
    [2012-11-12T10:47:16+00:00] INFO: Processing template[/var/www/.ssh/id_rsa.pub] action create (gitlab::default line 127)
    [2012-11-12T10:47:16+00:00] INFO: template[/var/www/.ssh/id_rsa.pub] updated content
    [2012-11-12T10:47:16+00:00] INFO: template[/var/www/.ssh/id_rsa.pub] owner changed to 33
    [2012-11-12T10:47:16+00:00] INFO: template[/var/www/.ssh/id_rsa.pub] group changed to 33
    [2012-11-12T10:47:16+00:00] INFO: template[/var/www/.ssh/id_rsa.pub] mode changed to 644
    [2012-11-12T10:47:16+00:00] INFO: Processing template[/home/git/gitlab.pub] action create (gitlab::default line 144)
    [2012-11-12T10:47:16+00:00] INFO: template[/home/git/gitlab.pub] updated content
    [2012-11-12T10:47:16+00:00] INFO: template[/home/git/gitlab.pub] owner changed to 1001
    [2012-11-12T10:47:16+00:00] INFO: template[/home/git/gitlab.pub] group changed to 1002
    [2012-11-12T10:47:16+00:00] INFO: template[/home/git/gitlab.pub] mode changed to 444
    [2012-11-12T10:47:16+00:00] INFO: Processing execute[install-gitlab-key] action run (gitlab::default line 155)
    [2012-11-12T10:47:18+00:00] INFO: execute[install-gitlab-key] ran successfully
    [2012-11-12T10:47:18+00:00] INFO: Processing template[/var/www/.ssh/config] action create (gitlab::default line 169)
    [2012-11-12T10:47:18+00:00] INFO: template[/var/www/.ssh/config] updated content
    [2012-11-12T10:47:18+00:00] INFO: template[/var/www/.ssh/config] owner changed to 33
    [2012-11-12T10:47:18+00:00] INFO: template[/var/www/.ssh/config] group changed to 33
    [2012-11-12T10:47:18+00:00] INFO: template[/var/www/.ssh/config] mode changed to 644
    [2012-11-12T10:47:18+00:00] INFO: Processing service[gitlab] action nothing (gitlab::default line 183)
    [2012-11-12T10:47:19+00:00] INFO: Processing directory[/opt/gitlab] action create (gitlab::default line 190)
    [2012-11-12T10:47:19+00:00] INFO: directory[/opt/gitlab] created directory /opt/gitlab
    [2012-11-12T10:47:19+00:00] INFO: directory[/opt/gitlab] owner changed to 33
    [2012-11-12T10:47:19+00:00] INFO: directory[/opt/gitlab] group changed to 33
    [2012-11-12T10:47:19+00:00] INFO: Processing git[/opt/gitlab] action checkout (gitlab::default line 202)
    [2012-11-12T10:47:19+00:00] INFO: git[/opt/gitlab] cloning repo git://github.com/hernad/gitlabhq.git to /opt/gitlab
    [2012-11-12T10:47:25+00:00] INFO: git[/opt/gitlab] checked out branch: master reference: 28f58071451deef0b6cfd2161f17a29eba9a3add
    [2012-11-12T10:47:25+00:00] INFO: git[/opt/gitlab] enabling git submodules
    [2012-11-12T10:47:25+00:00] INFO: Processing directory[/opt/gitlab/tmp/repositories] action create (gitlab::default line 210)
    [2012-11-12T10:47:25+00:00] INFO: directory[/opt/gitlab/tmp/repositories] created directory /opt/gitlab/tmp/repositories
    [2012-11-12T10:47:25+00:00] INFO: directory[/opt/gitlab/tmp/repositories] owner changed to 33
    [2012-11-12T10:47:25+00:00] INFO: directory[/opt/gitlab/tmp/repositories] group changed to 33
    [2012-11-12T10:47:25+00:00] INFO: directory[/opt/gitlab/tmp/repositories] mode changed to 755
    [2012-11-12T10:47:25+00:00] INFO: Processing bash[fix gitlab perms] action run (gitlab::default line 220)
    [2012-11-12T10:47:25+00:00] INFO: bash[fix gitlab perms] ran successfully
    [2012-11-12T10:47:25+00:00] INFO: Processing template[/opt/gitlab/.rvmrc] action create (gitlab::default line 225)
    [2012-11-12T10:47:25+00:00] INFO: template[/opt/gitlab/.rvmrc] updated content
    [2012-11-12T10:47:25+00:00] INFO: template[/opt/gitlab/.rvmrc] owner changed to 33
    [2012-11-12T10:47:25+00:00] INFO: template[/opt/gitlab/.rvmrc] group changed to 33
    [2012-11-12T10:47:25+00:00] INFO: template[/opt/gitlab/.rvmrc] mode changed to 755
    [2012-11-12T10:47:25+00:00] INFO: Processing rvm_gemset[gitlab] action create (gitlab::default line 232)
    /root/vagrant_gitlab/cookbooks/rvm/libraries/rvm_chef_user_environment.rb:36: warning: class variable access from toplevel
    [2012-11-12T10:47:30+00:00] INFO: Creating rvm_gemset[ruby-1.9.3-p286@gitlab]
    [2012-11-12T10:47:35+00:00] INFO: Processing script[trust_rvmrc] action run (gitlab::default line 238)
    [2012-11-12T10:47:35+00:00] INFO: script[trust_rvmrc] ran successfully
    [2012-11-12T10:47:35+00:00] INFO: Processing template[/opt/gitlab/config/gitlab.yml] action create (gitlab::default line 251)
    [2012-11-12T10:47:36+00:00] INFO: template[/opt/gitlab/config/gitlab.yml] updated content
    [2012-11-12T10:47:36+00:00] INFO: template[/opt/gitlab/config/gitlab.yml] owner changed to 33
    [2012-11-12T10:47:36+00:00] INFO: template[/opt/gitlab/config/gitlab.yml] group changed to 33
    [2012-11-12T10:47:36+00:00] INFO: template[/opt/gitlab/config/gitlab.yml] mode changed to 644
    [2012-11-12T10:47:36+00:00] INFO: Processing template[/opt/gitlab/config/unicorn.rb] action create (gitlab::default line 269)
    [2012-11-12T10:47:36+00:00] INFO: template[/opt/gitlab/config/unicorn.rb] updated content
    [2012-11-12T10:47:36+00:00] INFO: template[/opt/gitlab/config/unicorn.rb] owner changed to 33
    [2012-11-12T10:47:36+00:00] INFO: template[/opt/gitlab/config/unicorn.rb] group changed to 33
    [2012-11-12T10:47:36+00:00] INFO: template[/opt/gitlab/config/unicorn.rb] mode changed to 644
    [2012-11-12T10:47:36+00:00] INFO: Processing template[/etc/bash.bashrc] action create (gitlab::default line 293)
    [2012-11-12T10:47:36+00:00] INFO: template[/etc/bash.bashrc] backed up to /var/chef/backup/etc/bash.bashrc.chef-20121112104736
    [2012-11-12T10:47:36+00:00] INFO: template[/etc/bash.bashrc] updated content
    [2012-11-12T10:47:36+00:00] INFO: template[/etc/bash.bashrc] owner changed to 0
    [2012-11-12T10:47:36+00:00] INFO: template[/etc/bash.bashrc] group changed to 0
    [2012-11-12T10:47:36+00:00] INFO: template[/etc/bash.bashrc] mode changed to 755
    [2012-11-12T10:47:36+00:00] INFO: Processing directory[/var/www/.bundle] action create (gitlab::default line 301)
    [2012-11-12T10:47:36+00:00] INFO: directory[/var/www/.bundle] created directory /var/www/.bundle
    [2012-11-12T10:47:36+00:00] INFO: directory[/var/www/.bundle] owner changed to 33
    [2012-11-12T10:47:36+00:00] INFO: directory[/var/www/.bundle] group changed to 33
    [2012-11-12T10:47:36+00:00] INFO: directory[/var/www/.bundle] mode changed to 755
    [2012-11-12T10:47:36+00:00] INFO: Processing template[/var/www/.bundle/options] action create (gitlab::default line 308)
    [2012-11-12T10:47:36+00:00] INFO: template[/var/www/.bundle/options] updated content
    [2012-11-12T10:47:36+00:00] INFO: template[/var/www/.bundle/options] owner changed to 33
    [2012-11-12T10:47:36+00:00] INFO: template[/var/www/.bundle/options] group changed to 33
    [2012-11-12T10:47:36+00:00] INFO: template[/var/www/.bundle/options] mode changed to 644
    [2012-11-12T10:47:36+00:00] INFO: Processing template[/etc/chef/ohai_plugins/nginx.rb] action create (nginx::ohai_plugin line 22)
    [2012-11-12T10:47:37+00:00] INFO: template[/etc/chef/ohai_plugins/nginx.rb] updated content
    [2012-11-12T10:47:37+00:00] INFO: template[/etc/chef/ohai_plugins/nginx.rb] owner changed to 0
    [2012-11-12T10:47:37+00:00] INFO: template[/etc/chef/ohai_plugins/nginx.rb] group changed to 0
    [2012-11-12T10:47:37+00:00] INFO: template[/etc/chef/ohai_plugins/nginx.rb] mode changed to 755
    [2012-11-12T10:47:37+00:00] INFO: Processing remote_directory[/etc/chef/ohai_plugins] action nothing (ohai::default line 27)
    [2012-11-12T10:47:37+00:00] INFO: Processing ohai[custom_plugins] action nothing (ohai::default line 42)
    [2012-11-12T10:47:37+00:00] INFO: Processing package[nginx] action install (nginx::default line 31)
    [2012-11-12T10:47:42+00:00] INFO: Processing service[nginx] action enable (nginx::default line 32)
    [2012-11-12T10:47:42+00:00] INFO: Processing directory[/etc/nginx] action create (nginx::commons line 20)
    [2012-11-12T10:47:42+00:00] INFO: Processing directory[/var/log/nginx] action create (nginx::commons line 26)
    [2012-11-12T10:47:42+00:00] INFO: directory[/var/log/nginx] owner changed to 33
    [2012-11-12T10:47:42+00:00] INFO: Processing directory[/etc/nginx/sites-available] action create (nginx::commons line 33)
    [2012-11-12T10:47:42+00:00] INFO: Processing directory[/etc/nginx/sites-enabled] action create (nginx::commons line 33)
    [2012-11-12T10:47:42+00:00] INFO: Processing directory[/etc/nginx/conf.d] action create (nginx::commons line 33)
    [2012-11-12T10:47:42+00:00] INFO: Processing template[/usr/sbin/nxensite] action create (nginx::commons line 41)
    [2012-11-12T10:47:42+00:00] INFO: template[/usr/sbin/nxensite] updated content
    [2012-11-12T10:47:42+00:00] INFO: template[/usr/sbin/nxensite] owner changed to 0
    [2012-11-12T10:47:42+00:00] INFO: template[/usr/sbin/nxensite] group changed to 0
    [2012-11-12T10:47:42+00:00] INFO: template[/usr/sbin/nxensite] mode changed to 755
    [2012-11-12T10:47:42+00:00] INFO: Processing template[/usr/sbin/nxdissite] action create (nginx::commons line 41)
    [2012-11-12T10:47:43+00:00] INFO: template[/usr/sbin/nxdissite] updated content
    [2012-11-12T10:47:43+00:00] INFO: template[/usr/sbin/nxdissite] owner changed to 0
    [2012-11-12T10:47:43+00:00] INFO: template[/usr/sbin/nxdissite] group changed to 0
    [2012-11-12T10:47:43+00:00] INFO: template[/usr/sbin/nxdissite] mode changed to 755
    [2012-11-12T10:47:43+00:00] INFO: Processing template[nginx.conf] action create (nginx::commons line 49)
    [2012-11-12T10:47:43+00:00] INFO: template[nginx.conf] backed up to /var/chef/backup/etc/nginx/nginx.conf.chef-20121112104743
    [2012-11-12T10:47:43+00:00] INFO: template[nginx.conf] updated content
    [2012-11-12T10:47:43+00:00] INFO: template[nginx.conf] owner changed to 0
    [2012-11-12T10:47:43+00:00] INFO: template[nginx.conf] group changed to 0
    [2012-11-12T10:47:43+00:00] INFO: template[nginx.conf] mode changed to 644
    [2012-11-12T10:47:43+00:00] INFO: template[nginx.conf] sending reload action to service[nginx] (immediate)
    [2012-11-12T10:47:43+00:00] INFO: Processing service[nginx] action reload (nginx::default line 39)
    [2012-11-12T10:47:43+00:00] INFO: Processing template[/etc/nginx/sites-available/default] action create (nginx::commons line 58)
    [2012-11-12T10:47:43+00:00] INFO: template[/etc/nginx/sites-available/default] backed up to /var/chef/backup/etc/nginx/sites-available/default.chef-20121112104743
    [2012-11-12T10:47:43+00:00] INFO: template[/etc/nginx/sites-available/default] updated content
    [2012-11-12T10:47:43+00:00] INFO: template[/etc/nginx/sites-available/default] owner changed to 0
    [2012-11-12T10:47:43+00:00] INFO: template[/etc/nginx/sites-available/default] group changed to 0
    [2012-11-12T10:47:43+00:00] INFO: template[/etc/nginx/sites-available/default] mode changed to 644
    [2012-11-12T10:47:43+00:00] INFO: Processing execute[nxensite default] action run (nginx::commons line 23)
    [2012-11-12T10:47:43+00:00] INFO: Processing service[nginx] action start (nginx::default line 39)
    [2012-11-12T10:47:44+00:00] INFO: service[nginx] started

    ...

    [2012-11-12T10:47:44+00:00] INFO: Processing template[/etc/nginx/sites-available/gitlab.conf] action create (gitlab::nginx line 32)
    [2012-11-12T10:47:44+00:00] INFO: template[/etc/nginx/sites-available/gitlab.conf] updated content
    [2012-11-12T10:47:44+00:00] INFO: template[/etc/nginx/sites-available/gitlab.conf] mode changed to 644
    [2012-11-12T10:47:44+00:00] INFO: Processing execute[ssl gitlab.key/crt] action run (gitlab::nginx line 46)
    [2012-11-12T10:47:44+00:00] INFO: execute[ssl gitlab.key/crt] ran successfully
    [2012-11-12T10:47:44+00:00] INFO: Processing link[/etc/nginx/sites-enabled/gitlab.conf] action create (gitlab::nginx line 53)
    [2012-11-12T10:47:44+00:00] INFO: link[/etc/nginx/sites-enabled/gitlab.conf] created
    [2012-11-12T10:47:44+00:00] INFO: Processing link[/etc/nginx/sites-enabled/default] action delete (gitlab::nginx line 59)
    [2012-11-12T10:47:44+00:00] INFO: link[/etc/nginx/sites-enabled/default] deleted
    ....

    [2012-11-12T10:47:45+00:00] INFO: execute[preseed mysql-server] ran successfully
    [2012-11-12T10:47:45+00:00] INFO: Processing template[/etc/mysql/debian.cnf] action create (mysql::server line 51)
    [2012-11-12T10:47:45+00:00] INFO: template[/etc/mysql/debian.cnf] updated content
    [2012-11-12T10:47:45+00:00] INFO: template[/etc/mysql/debian.cnf] owner changed to 0
    [2012-11-12T10:47:45+00:00] INFO: template[/etc/mysql/debian.cnf] group changed to 0
    [2012-11-12T10:47:45+00:00] INFO: template[/etc/mysql/debian.cnf] mode changed to 600
    [2012-11-12T10:47:45+00:00] INFO: Processing package[mysql-server] action install (mysql::server line 78)


    ....


    [2012-11-12T10:47:45+00:00] INFO: template[/etc/mysql/debian.cnf] mode changed to 600
    [2012-11-12T10:47:45+00:00] INFO: Processing package[mysql-server] action install (mysql::server line 78)
    [2012-11-12T10:48:12+00:00] INFO: Processing directory[/etc/mysql/conf.d] action create (mysql::server line 85)
    [2012-11-12T10:48:12+00:00] INFO: directory[/etc/mysql/conf.d] owner changed to 107
    [2012-11-12T10:48:12+00:00] INFO: directory[/etc/mysql/conf.d] group changed to 116
    [2012-11-12T10:48:12+00:00] INFO: Processing service[mysql] action nothing (mysql::server line 105)
    [2012-11-12T10:48:12+00:00] INFO: Processing template[/etc/mysql/my.cnf] action create (mysql::server line 125)
    [2012-11-12T10:48:12+00:00] INFO: template[/etc/mysql/my.cnf] backed up to /var/chef/backup/etc/mysql/my.cnf.chef-20121112104812
    [2012-11-12T10:48:12+00:00] INFO: template[/etc/mysql/my.cnf] updated content
    [2012-11-12T10:48:12+00:00] INFO: template[/etc/mysql/my.cnf] owner changed to 0
    [2012-11-12T10:48:12+00:00] INFO: template[/etc/mysql/my.cnf] group changed to 0
    [2012-11-12T10:48:12+00:00] INFO: template[/etc/mysql/my.cnf] mode changed to 644
    [2012-11-12T10:48:12+00:00] INFO: template[/etc/mysql/my.cnf] sending restart action to service[mysql] (immediate)
    [2012-11-12T10:48:12+00:00] INFO: Processing service[mysql] action restart (mysql::server line 105)
    [2012-11-12T10:48:17+00:00] INFO: service[mysql] restarted
    [2012-11-12T10:48:17+00:00] INFO: Processing template[/etc/mysql/grants.sql] action create (mysql::server line 179)
    [2012-11-12T10:48:17+00:00] INFO: template[/etc/mysql/grants.sql] updated content
    [2012-11-12T10:48:17+00:00] INFO: template[/etc/mysql/grants.sql] owner changed to 0
    [2012-11-12T10:48:17+00:00] INFO: template[/etc/mysql/grants.sql] group changed to 0
    [2012-11-12T10:48:17+00:00] INFO: template[/etc/mysql/grants.sql] mode changed to 600
    [2012-11-12T10:48:17+00:00] INFO: template[/etc/mysql/grants.sql] sending run action to execute[mysql-install-privileges] (immediate)
    [2012-11-12T10:48:17+00:00] INFO: Processing execute[mysql-install-privileges] action run (mysql::server line 195)
    [2012-11-12T10:48:17+00:00] INFO: execute[mysql-install-privileges] ran successfully
    [2012-11-12T10:48:17+00:00] INFO: Processing execute[mysql-install-privileges] action nothing (mysql::server line 195)
    [2012-11-12T10:48:17+00:00] INFO: Processing mysql_database_user[gitlab] action create (gitlab::database line 33)
    [2012-11-12T10:48:18+00:00] INFO: Processing mysql_database[gitlab] action create (gitlab::database line 47)
    [2012-11-12T10:48:18+00:00] INFO: Processing mysql_database_user[gitlab] action grant (gitlab::database line 54)
    [2012-11-12T10:48:18+00:00] INFO: mysql_database_user[gitlab]: granting access with statement [GRANT all ON gitlab.* TO 'gitlab'@'localhost' IDENTIFIED BY 'pwGL144']
    [2012-11-12T10:48:18+00:00] INFO: Processing mysql_database[gitlab_test] action create (gitlab::database line 47)
    [2012-11-12T10:48:18+00:00] INFO: Processing mysql_database_user[gitlab] action grant (gitlab::database line 54)
    [2012-11-12T10:48:18+00:00] INFO: mysql_database_user[gitlab]: granting access with statement [GRANT all ON gitlab_test.* TO 'gitlab'@'localhost' IDENTIFIED BY 'pwGL144']
    [2012-11-12T10:48:18+00:00] INFO: Processing mysql_database[gitlab_development] action create (gitlab::database line 47)
    [2012-11-12T10:48:18+00:00] INFO: Processing mysql_database_user[gitlab] action grant (gitlab::database line 54)
    [2012-11-12T10:48:18+00:00] INFO: mysql_database_user[gitlab]: granting access with statement [GRANT all ON gitlab_development.* TO 'gitlab'@'localhost' IDENTIFIED BY 'pwGL144']
    [2012-11-12T10:48:18+00:00] INFO: Processing template[/opt/gitlab/config/database.yml] action create (gitlab::database line 66)
    [2012-11-12T10:48:19+00:00] INFO: template[/opt/gitlab/config/database.yml] updated content
    [2012-11-12T10:48:19+00:00] INFO: template[/opt/gitlab/config/database.yml] owner changed to 33
    [2012-11-12T10:48:19+00:00] INFO: template[/opt/gitlab/config/database.yml] group changed to 33
    [2012-11-12T10:48:19+00:00] INFO: template[/opt/gitlab/config/database.yml] mode changed to 644
    [2012-11-12T10:48:19+00:00] INFO: Processing rvm_shell[bundle install ruby-1.9.3-p286@gitlab] action run (gitlab::database line 153)
    /root/vagrant_gitlab/cookbooks/rvm/libraries/rvm_chef_user_environment.rb:36: warning: class variable access from toplevel
    [2012-11-12T10:48:23+00:00] INFO: Processing script[bundle install ruby-1.9.3-p286@gitlab] action run (/root/vagrant_gitlab/cookbooks/rvm/providers/shell.rb line 75)
    [2012-11-12T10:53:08+00:00] INFO: script[bundle install ruby-1.9.3-p286@gitlab] ran successfully
    [2012-11-12T10:53:08+00:00] INFO: Processing script[bundle install ruby-1.9.3-p286@gitlab] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/shell.rb line 75)
    [2012-11-12T10:53:08+00:00] INFO: Processing execute[/usr/local/rvm g+w] action run (gitlab::database line 160)
    [2012-11-12T10:53:13+00:00] INFO: execute[/usr/local/rvm g+w] ran successfully
    [2012-11-12T10:53:13+00:00] INFO: Processing rvm_shell[gitlab-production-setup ruby-1.9.3-p286@gitlab / production] action run (gitlab::database line 176)
    /root/vagrant_gitlab/cookbooks/rvm/libraries/rvm_chef_user_environment.rb:36: warning: class variable access from toplevel
    [2012-11-12T10:53:19+00:00] INFO: Processing script[gitlab-production-setup ruby-1.9.3-p286@gitlab / production] action run (/root/vagrant_gitlab/cookbooks/rvm/providers/shell.rb line 75)
    [2012-11-12T10:54:00+00:00] INFO: script[gitlab-production-setup ruby-1.9.3-p286@gitlab / production] ran successfully
    [2012-11-12T10:54:00+00:00] INFO: Processing script[gitlab-production-setup ruby-1.9.3-p286@gitlab / production] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/shell.rb line 75)
    [2012-11-12T10:54:00+00:00] INFO: Processing rvm_shell[gitlab-production-seed ruby-1.9.3-p286@gitlab] action run (gitlab::database line 205)
    /root/vagrant_gitlab/cookbooks/rvm/libraries/rvm_chef_user_environment.rb:36: warning: class variable access from toplevel
    [2012-11-12T10:54:04+00:00] INFO: Processing script[gitlab-production-seed ruby-1.9.3-p286@gitlab] action run (/root/vagrant_gitlab/cookbooks/rvm/providers/shell.rb line 75)
    [2012-11-12T10:54:43+00:00] INFO: script[gitlab-production-seed ruby-1.9.3-p286@gitlab] ran successfully
    [2012-11-12T10:54:43+00:00] INFO: Processing script[gitlab-production-seed ruby-1.9.3-p286@gitlab] action nothing (/root/vagrant_gitlab/cookbooks/rvm/providers/shell.rb line 75)
    [2012-11-12T10:54:43+00:00] INFO: Processing execute[install /opt/gitlab/lib/hooks/post-receive => /home/git/.gitolite/hooks/common/post-receive] action run (gitlab::database line 260)
    [2012-11-12T10:54:44+00:00] INFO: execute[install /opt/gitlab/lib/hooks/post-receive => /home/git/.gitolite/hooks/common/post-receive] ran successfully
    [2012-11-12T10:54:44+00:00] INFO: Processing template[/etc/init.d/gitlab] action create (gitlab::database line 268)
    [2012-11-12T10:54:44+00:00] INFO: template[/etc/init.d/gitlab] updated content
    [2012-11-12T10:54:44+00:00] INFO: template[/etc/init.d/gitlab] owner changed to 0
    [2012-11-12T10:54:44+00:00] INFO: template[/etc/init.d/gitlab] group changed to 0
    [2012-11-12T10:54:44+00:00] INFO: template[/etc/init.d/gitlab] mode changed to 755
    [2012-11-12T10:54:44+00:00] INFO: Processing service[gitlab] action start (gitlab::database line 290)
    [2012-11-12T10:54:45+00:00] INFO: template[/etc/ssh/sshd_config] sending restart action to service[ssh] (delayed)
    [2012-11-12T10:54:45+00:00] INFO: Processing service[ssh] action restart (openssh::default line 30)
    [2012-11-12T10:54:46+00:00] INFO: service[ssh] restarted
    [2012-11-12T10:54:46+00:00] INFO: template[/etc/postfix/main.cf] sending restart action to service[postfix] (delayed)
    [2012-11-12T10:54:46+00:00] INFO: Processing service[postfix] action restart (postfix::default line 63)
    [2012-11-12T10:54:47+00:00] INFO: service[postfix] restarted
    [2012-11-12T10:54:47+00:00] INFO: link[/etc/nginx/sites-enabled/gitlab.conf] sending reload action to service[nginx] (delayed)
    [2012-11-12T10:54:47+00:00] INFO: Processing service[nginx] action reload (nginx::default line 39)
    [2012-11-12T10:54:47+00:00] INFO: service[nginx] reloaded
    [2012-11-12T10:54:47+00:00] INFO: template[/etc/init.d/gitlab] sending enable action to service[gitlab] (delayed)
    [2012-11-12T10:54:47+00:00] INFO: Processing service[gitlab] action enable (gitlab::default line 183)
    [2012-11-12T10:54:48+00:00] INFO: Chef Run complete in 891.471861642 seconds
    [2012-11-12T10:54:48+00:00] INFO: Running report handlers
    [2012-11-12T10:54:48+00:00] INFO: Report handlers complete
    ----------------------------------------
    boostrap chef for vagrant_gitlab is finished (0.9.9) :)
    restartujem server ...
    Restartujem server gitlab.knowhow.out.ba

    real	27m47.949s
    user	0m6.788s
    sys	0m0.762s


