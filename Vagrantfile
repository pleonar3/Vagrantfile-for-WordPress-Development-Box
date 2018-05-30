
Vagrant.configure('2') do |config|
config.vm.provider 'virtualbox' do |vb|; vb.customize [ 'modifyvm', :id, '--uartmode1', 'disconnected']; end
  config.vm.box = "ubuntu/xenial64"
  config.vm.network "private_network", ip: "100.0.0.2"
  config.vm.provision "shell", inline: <<-SHELL
    apt-get -y update
    apt-get -y install vim
    printf "set nocompatible\nset number\nsyntax on\nset tabstop=2\nset shiftwidth=2\nset expandtab" > ~/.vimrc     
    apt-get -y install apache2
    sudo apt-get install -y mariadb-server python-mysqldb
    apt-get -y install mariadb-server
    apt-get -y install php libapache2-mod-php php-mcrypt php-mysql
    apt-get -y install unzip
    systemctl reload apache2
    cd /var/www/html
    sudo curl -o latest.zip https://wordpress.org/latest.zip
    unzip latest.zip
    rm latest.zip
    printf "CREATE DATABASE wordpress; CREATE USER 'user'@'localhost' IDENTIFIED BY 'password'; GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost';" | mysql
    cp -r wordpress/* .
    rm -r wordpress
    rm index.html
  SHELL
end
