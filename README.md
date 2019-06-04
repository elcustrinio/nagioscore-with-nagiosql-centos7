Nagios Core is a free and open source software application that provides monitoring and alerting services for servers, switches, 
applications and services. It monitors targets (i.e. hosts and services) and alerts users when something go wrong and alerts them a 
second time when the problem has been resolved. Nagios Core is primary application and monitoring and alerting engine, around that 
hundred of Nagios Projects are built.


With this script you install Nagios Core with NagiosQL on CentOs7.

1) Clone or copy the install.sh on your fresh installed CentOs7
2) Navigate to the folder in which the script is located
3) Open the Script and change if needed the NagiosVersion the NagiosPluginsVersions and Nagios Username/Password under "Variablendefinitionen" (it's tested with NagiosCore 4.4.3 and Nagios Plugins Version 2.2.1)
and the Root Password for MariaDB on Line 59 and 60.
4) Remove special Characters: "sed -i 's/\r//' install.sh"
5) Make the Script executable with "chmod +x install.sh"
6) Run the Script "./install.sh"

The script is more or less automated but needs a few places currently still inputs.
These are:

- During the Installation Process you will be ask for the libssh2 prefix. Default its autodetected if you wanna use this confirm with enter
- After NagiosQL is installed you see a message that the Installation is done and you should visit http://ipadress/nagiosql and follow the wizard. Here are the PrintScreens with the Settings you need:




