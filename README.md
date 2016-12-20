# DebianScript
Bash Script for hardening Ubuntu and Debian linux distributions, installing major server functions, and configuring them.

More functions will be added for end users as well, and for additional server features, creating a simple,
menu driven script to perform most major installation and configuration tasks with minimal user intervention and time required.

Python Variant may be worked on but should be based on finalized versions, not the work leading up to a new version.

We would like to create two main adaptations, aside from the master done in Bash:

1) Python adaptation

2) Education adaptation, in Bash script, identical to  Bash master except that it explains each command and requires user 
   to hit enter to run the commands. (Commented to death with pauses so new users can see what's happening, read the 
   explanation, and learn)

3) While v1.0 of this script isn't in wide use, all changes that alter the settings, and do not simply add new functions, must be integrated into the version update function for each version. Use tests to verify that the changes need to be made. For testing purposes, v1.0 can be made available.

4) Each new complete version must have it's own entry in the version update script, to ensure compatibility and smooth transitioning.


This currently only supports Ubuntu Server 16.04 LTS. Other distros will be supported soon.

USE:

Either download from here and place the files where you would like them, or begin in the directory you wish to place them in.

1) wget https://github.com/RentANerdConsulting/DebianScript/archive/v.1.1-alpha.0.tar.gz (if downloading direct)

2) tar -zxvf v.1.1-alpha.0.tar.gz

3) ./LinuxUtility.sh
