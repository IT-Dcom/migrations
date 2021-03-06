# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = 'ubuntu/trusty64'
  config.vm.network :private_network, ip: '192.168.50.5'

  config.vm.network :forwarded_port, guest: 22, host: 2223, id: 'ssh'
  config.vm.network :forwarded_port, guest: 3306, host: 3306 # mysql

  config.vbguest.auto_update = false if defined?(VagrantVbguest::Middleware)

  config.vm.provider :virtualbox do |vb|
    vb.customize ['modifyvm', :id, '--cpus', '1', '--memory', '512']
    vb.customize ['setextradata', :id,
                  'VBoxInternal2/SharedFoldersEnableSymlinksCreate/v-root',
                  '1'] # solve Windows Symbolic links issues
  end

  config.vm.provision 'shell', privileged: false, inline: <<-SHELL
    sudo locale-gen fr_FR.UTF-8

    DBUSER=root
    DBPASSWD=root

    echo "mysql-server mysql-server/root_password password $DBPASSWD" | sudo debconf-set-selections
    echo "mysql-server mysql-server/root_password_again password $DBPASSWD" | sudo debconf-set-selections

    sudo apt-get install -y mysql-server libmysqlclient-dev

    mysql -u root -proot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root' WITH GRANT OPTION; FLUSH PRIVILEGES;"

    export DB_USER=$DBUSER
    export DB_PASS=$DBPASSWD
  SHELL
end
