# **Known issues in 1.1.2**

1) In /etc/apache2/sites-avalable/owncloud.conf and /etc/apache2/sites-available/000-default.conf the trailing / was forgotten in the \*.80 virtual host config. This is fixed in the version upgrade function to 1.1.3, and in the 1.1.3 script itself, to be released soon.

2) owncloud virtual host was separated into /etc/apache2/sites-avalable/owncloud.conf and /etc/apache2/conf-avalable/owncloud.conf, mimicing the Turnkey appliance configuration. This causes an issue hosting more than one host (netdata.foo.bar and owncloud.foo.bar), as it overrides any site and forwards to the owncloud site. This is fixed in the version upgrade function to 1.1.3, and in the 1.1.3 script itself, to be released soon.

3) There is a loop in the email/logwatch configuration function which causes a slight slowdown each time the script is run after getting to the menu the first time. It repeatedly enters the directory for the apache logs into /usr/share/logwatch/default.conf/logwatch.conf. This is fixed in the version upgrade function to 1.1.3, and in the 1.1.3 script itself, to be released soon.


# DebianScript
Bash Script for hardening Ubuntu and Debian linux distributions, installing major server functions, and configuring them.

**This script is provided as-is. Use it at your own risk. It has been tested thoroughly, but we can't
prepare for every possible issue or configuration.**

More functions will be added for end users as well, and for additional server features, creating a simple,
menu driven script to perform most major installation and configuration tasks with minimal user intervention and time required.

The script uses flag files to track which functions have been completed and what has been configured. 
This prevents it from running multiple instances of the same functions and causing configuration errors.

**This currently only supports Ubuntu Server 16.04 LTS. Other distros will be supported soon.**

**USE:**

Either download from here and place the files where you would like them, or begin in the directory you wish to place them in. 
This script assumes you are logged in as a user with sudo privileges, you own the folder you're extracting it to,
and you will be prompted for your password when necessary. Do not run as root user or with sudo.

Change the version number for the first two commands to suit the version you wish to download from the available releases.
  
```
$ wget https://github.com/RentANerdConsulting/DebianScript/archive/1.1.2.tar.gz

$ tar --strip-components=2 -zxvf 1.1.2.tar.gz DebianScript-1.1.2/Bash/

$ sudo chown -R `whoami`:`whoami` ./

$ sudo chmod -R 770 ./

$ rm -R debian turnkey

$ ./LinuxUtility.sh
```  
The system will prompt for a reboot at least once. After reboot, cd to the script directory.
```
$ cd /directory-you-chose
  
$ ./LinuxUtility.sh
```
Once at the main menu, choose exit without reboot, then 
```
$ sudo chown -R `whoami`:admin ./
```
Once this is done, rerun the script and enjoy.


If the script was used to install ownCloud do the next command as well:  (This will eventually be a built in function)
```
  $ sudo nano /etc/apache2/mods-available/evasive.conf
```  
  add to file
```
DOSWhitelist   $SUBNET
```
(Use subnet info and proper netmask in place of $SUBNET, using \*’s in place of /24. Example: 192.168.1.0/24 = 192.168.1.\*)
  and
  ```
  DOSSystemCommand "echo 'mod_evasive HTTP Blacklisted %s on $FQDN' | mail -s 'Blocked IP by mod_evasive' root@localhost"
  ```
  (Make sure to use the FQDN in place of $FQDN in the above entry, and make sure it’s all on one line.
  There’s an occasional glitch when copying text)
   
   
   
**CRON CONFIGURATION**
  
  
**OwnCloud Cron**
 ```
  $ sudo crontab -u www-data -e
 ```
  Select the option to use nano as the editor.
 
  Paste the following at the end of the created file:
 ```
  */15  *  *  *  * php -f /var/www/owncloud/cron.php
 ```
  ctrl + x to exit, y to save, enter to save the file.
 
 
**Tripwire Cron**
 ```
  $ sudo crontab -e
 ```
  Paste and edit the following at the end of the created file:
 ```
  30 3 * * * /usr/sbin/tripwire --check | mail -s "Tripwire report for FDQN" Admin_email
 ```  
 (FQDN is the servers fully qualified domain name, ie:  owncloud.randomwebsite.com. 
 Admin_email is the email address used during installation, ie: somecallmetim@google.com.
 First number is minute of the hour, second number is hour of the day, in 24hr format. Runs daily.
 Set to a time when the server will be on, but not actively being used.)
 
 ctrl + x to exit, y to save, enter to save the file.
 
 
**Let’sEncrypt Cron (if installed for certificate)**
 ```
  $ sudo crontab -e
 ```
  Paste and edit the following at the end of the created file:
  (First number is minute of the hour, second number is hour of the day, in 24hr format. Runs daily.
  Set to a time when the server will be on, but not actively being used.)
 ```
  30 2 * * * /usr/bin/letsencrypt renew >> /var/log/le-renew.log
 ```
  ctrl + x to exit, y to save, enter to save the file.
