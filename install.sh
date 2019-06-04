#!/bin/sh

#variable definitions
downloadverzeichnis=/tmp/
nagiosversion=4.4.3
nagiospluginsversion=2.2.1
nagiosuser=nagiosadmin
nagiosuserpassword=nagiosadmin

#From here nothing more change except password for MariaDB server.

yum install -y gcc glibc glibc-common wget unzip httpd php gd gd-devel perl postfix wget bzip2
sed -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
setenforce 0

cd $downloadverzeichnis
mkdir nagiosinstall
cd $downloadverzeichnis/nagiosinstall
wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-$nagiosversion.tar.gz
tar xvf nagios-$nagiosversion.tar.gz
cd $downloadverzeichnis/nagiosinstall/nagios-$nagiosversion/
./configure
make all
make install-groups-users
usermod -a -G nagios apache
make install
make install-daemoninit
systemctl enable httpd.service
make install-commandmode
make install-config
make install-webconf
firewall-cmd --permanent --add-service=http
firewall-cmd --reload
htpasswd -b -c /usr/local/nagios/etc/htpasswd.users $nagiosuser $nagiosuserpassword
systemctl start httpd.service
systemctl start nagios.service
systemctl daemon-reload

#Installation NagiosPlugins
yum install -y perl-Net-SNMPyum install -y gcc glibc glibc-common make gettext automake autoconf wget openssl-devel net-snmp net-snmp-utils epel-release
yum install -y perl-Net-SNMP
cd $downloadverzeichnis/nagiosinstall
wget https://nagios-plugins.org/download/nagios-plugins-$nagiospluginsversion.tar.gz
tar xvf nagios-plugins-$nagiospluginsversion.tar.gz
cd $downloadverzeichnis/nagiosinstall/nagios-plugins-$nagiospluginsversion/
./configure
make
make install
systemctl restart httpd.service
systemctl restart nagios.service

#Installation MariaDB Server
yum install -y mariadb-server
systemctl enable mariadb.service
systemctl start mariadb.service
mysql_secure_installation <<EOF

y
rootpassword
rootpassword
y
y
y
y
EOF

#Installation Epel
yum install -y epel-release
rpm -Uvh https://mirror.webtatic.com/yum/el7/webtatic-release.rpm
yum makecache fast
yum remove -y php-common php php-gd php-cli
yum install -y php55w-common php55w php55w-gd php55w-cli php55w-mysql php55w-devel php55w-pear
yum install -y libssh2-devel
pecl channel-update pecl.php.net
pecl install ssh2
echo "date.timezone='Europe/Zurich'" >> /etc/php.ini
echo "extension=ssh2.so" >> /etc/php.ini
systemctl restart httpd

#Installation NagiosQL
cd $downloadverzeichnis/nagiosinstall
wget https://sourceforge.net/projects/nagiosql/files/nagiosql/NagiosQL%203.4.0/nagiosql-3.4.0.tar.bz2
tar xvjf nagiosql-3.4.0.tar.bz2
mv $downloadverzeichnis/nagiosinstall/nagiosql-3.4.0 /var/www/html/nagiosql
restorecon -Rv /var/www/html/nagiosql/
mkdir /usr/local/nagios/etc/nagiosql
chown apache:apache /usr/local/nagios/etc/nagiosql/
chmod o+w /var/www/html/nagiosql/config
echo "Installation of NagiosCore and NagiosQL is finished.Please visit https://ipadresse/nagiosql and follow the wizard. You find the Screenshots with the Settings in the ReadMe." 
read -n 1 -s -r -p "Press a button as soon as the NagiosQL installation via Webwizard has been completed and the configurations have been imported or created."
#NagiosQL has been installed, we can now delete install directory to prevent anyone to run installation wizard again. We have successfully generated settings.php file. Therefore, revoke write permissions from other users for security.
rm -rf /var/www/html/nagiosql/nagiosql-3.4.0/install/
chmod o-w /var/www/html/nagiosql/config
#Finally, we have to edit nagios.cfg file to remove current cfg_dir directives and add our new configuration directory actively managed by NagiosQL. This can be achieved by following two commands.
sed -i 's/^cfg/#cfg/' /usr/local/nagios/etc/nagios.cfg
echo "cfg_dir=/usr/local/nagios/etc/nagiosql/" >> /usr/local/nagios/etc/nagios.cfg
systemctl restart nagios.service
echo "We have successfully installed NagiosQL Nagios Configurator on CentOS 7 server. Happy Monitoring!" 
