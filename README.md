Nagios Core is a free and open source software application that provides monitoring and alerting services for servers, switches, 
applications and services. It monitors targets (i.e. hosts and services) and alerts users when something go wrong and alerts them a 
second time when the problem has been resolved. Nagios Core is primary application and monitoring and alerting engine, around that 
hundred of Nagios Projects are built.

Nagios Core is an free and open source Nework, Server and Application monitoring software. A drawback of Nagios Core is that it lacks a configuration tool, therefore we have to edit configurations files using a text editor. Manually editing configuration files is always a headache and highly prone to typostatic errors.NagiosQL is a web based configurator for Nagios Core. It completely integrates with Nagios Core and makes configuration management much easier. 


With this script you install Nagios Core with NagiosQL on CentOs7.

1) Clone or copy the install.sh on your fresh installed CentOs7
2) Navigate to the folder in which the script is located
3) Open the Script and change if needed the NagiosVersion the NagiosPluginsVersions and Nagios Username/Password under "variable definitions" (it's tested with NagiosCore 4.4.3 and Nagios Plugins Version 2.2.1)
and the Root Password for MariaDB on Line 59 and 60.
4) Remove special Characters: "sed -i 's/\r//' install.sh"
5) Make the Script executable with "chmod +x install.sh"
6) Run the Script "./install.sh"

The script is more or less automated but needs a few places currently still inputs.
These are:
During the Installation Process you will be ask for the libssh2 prefix. Default its autodetected if you wanna use this confirm with enter

After NagiosCore and NagiosQL is installed you see a message that the Installation is done and you should visit http://ipadress/nagiosql and follow the wizard. IMPORTENT: Do not click any button until the wizard is not completed. 

Here are the PrintScreens with the Settings you need:

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

If everything goes fine, then you will reach at the NagiosQL login page.

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-installation-wizard-05.png)

Login as admin user

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-installation-wizard-06.png)

NagiosQL is installed with zero configurations, therefore, we have to import our existing Nagios Core configurations.
Go to Administration > Config Targets.

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-config-target-01.png)

Click on Modify under Function column.

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-config-target-02.png)

Adjust directory paths according to you environment and click on Save.
Go to Tools > Data Import.
Select all import files and click on Import.

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-config-target-03.png)

Go to Supervision tab and you may observe that there are now some active groups has been imported

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-config-target-04.png)

File status is missed because we haven’t save our files yet. Therefore, Click on Write all config files.

![alt text](https://github.com/elcustrinio/nagioscore-with-nagiosql-centos7/blob/master/NagiosQL%20Web%20Wizard/nagiosql-config-target-05.png)

You may observe that the file status is now up-to-date.
Repeat the process for other targets/configurations like hosts, commands, templates, etc to save them in NagiosQL configure directory.

When you are finished go back to you ScriptWindow and click any Button. If everything is okay you get a message.

If you have performed above steps correctly, then there should be no error.
We have successfully installed NagiosQL Nagios Configurator on CentOS 7 server.

