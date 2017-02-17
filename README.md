# DebianScript
Bash Script for hardening Ubuntu and Debian linux distributions, installing major server functions, and configuring them.

More functions will be added for end users as well, and for additional server features, creating a simple,
menu driven script to perform most major installation and configuration tasks with minimal user intervention and time required.

This currently only supports Ubuntu Server 16.04 LTS. Other distros will be supported soon.

USE:

Either download from here and place the files where you would like them, or begin in the directory you wish to place them in. This script assumes you are logged in as a user with sudo privileges, you own the folder you're extracting it to, and you will be prompted for your password when necessary. Do not run as root user or with sudo.

1) wget https://github.com/RentANerdConsulting/DebianScript/archive/v.1.1.1.tar.gz

2) tar --strip-components=2 -zxvf v.1.1.1.tar.gz DebianScript-v.1.1.1/Bash/

Make sure each whoami is surrounded by tilde on each side

3) sudo chown -R \`whoami\`:\`whoami\` ./

4) sudo chmod -R 770 ./

5) rm -R debian turnkey

6) ./LinuxUtility.sh
