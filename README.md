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

After NagiosQL is installed you see a message that the Installation is done and you should visit http://ipadress/nagiosql and follow the wizard. Here are the PrintScreens with the Settings you need:

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-installation-wizard-01.png)
Since, we are running NagiosQL installation wizard for the first time and there isn’t any settings.php file exists in config folder, therefore the wizard is giving us the following warning “Settings file not found or not readable (config/settings.php). Upgrade not available!” It is save to ignore it.

Click on START INSTALLATION

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-installation-wizard-02.png)
NagiosQL installation wizard is checking for requirments and will give warnings, if a prerequisite is missing.
If you have followed the steps above correctly, then it won’t give you any warning.

Click on Next

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-installation-wizard-03.png)
Define the settings according to the above screenshot.

Click on Next

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-installation-wizard-04.png)

Click on Next

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-installation-wizard-05.png)
If everything goes fine, then you will reach at the NagiosQL login page.

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-installation-wizard-05.png)

Login as admin user


