# DebianScript
Bash Script for hardening Ubuntu and Debian linux distributions, installing major server functions, and configuring them.

More functions will be added for end users as well, and for additional server features, creating a simple,
menu driven script to perform most major installation and configuration tasks with minimal user intervention and time required.

This currently only supports Ubuntu Server 16.04 LTS. Other distros will be supported soon.

USE:

Either download from here and place the files where you would like them, or begin in the directory you wish to place them in.

1) wget https://github.com/RentANerdConsulting/DebianScript/archive/v.1.1-alpha.0.tar.gz (if downloading direct)

2) tar --strip-components=1 -zxvf v.1.1-alpha.0.tar.gz -C ./

3) sudo chmod -R 770 ./

4) If updating from 1.0 (Bash is the only currently working version), use this command: mv Bash/* ./

5) If you're starting with v1.1-alpha.0, then: cd Bash

6) ./LinuxUtility.sh
