#!/bin/bash


###### Variables and arrays for error checking ######

progname=$(basename $0)
correct=""
beenrun=0
filecount=0
a=0
declare -a filestoreplace=()


###### Variables for LAMP functions ######

mdbrootpass=""
maxuploadMB=0
uploadbase=1048576
maxuploadMBtemp=0
exthttpport=""
exthttpsport=""
inthttpport=""
inthttpsport=""
domainname=""
hostname=""
fqdn=""
# names for site conf files: 0-default, 1-default-ssl, 2-owncloud, etc
# 0-default
# 1-default-ssl
# 2-owncloud
# 3-netdata-ssl
# 4-phpvirtualbox-ssl


###### Variables for system role functions ######

hostedserver=""
guiorcli=""
servordesk=""
physicalsystem=""


###### Variables for ownCloud functions ######

ocdbpass=""
ocadminpass=""
ochostname=""


###### Netdata variables ######

ndhostname=""


###### Variables for virtualbox functions ######

virttype=""
virtualbox=""
phpvbhostname=""
vboxuserpass=""
vmdir=""


###### Variables for Samba ######

createsambauser=0
useraddoops=0
sambadir=""


###### Plex variables ######

plexdir=""
plexpass=""


###### Variables and arrays for menus ######

menuselection=1
declare -a menuoptions=('1 - ownCloud functions' '2 - Samba functions' '3 - Plex functions' '4 - Webmin Functions' '5 - VirtualBox Functions' '6 - Netdata Functions' '7 - System utilities' '8 - Firewall options' '9 - User management' '10 - Certificate management' '11 - Security management' '0 - Exit without reboot' '00 - Exit and reboot.')
declare -a secmanagemenuoptions=('1 - Disable password login via SSH' '2 - Generate SSH RSA keys locally using ssh-keygen - good' '3 - Generate SSH RSA keys using PuTTYgen - better' '4 - Switch SSH listen port to 1022 to reduce attacks' '00 - Return to Main Menu')
declare -a owncloudmenuoptions=('1 - Install and configure ownCloud' '2 - Upgrade ownCloud after package update' '3 - Set secure file permissions' '4 - Revoke secure file permissions' '5 - Turn on maintenance mode' '6 - Turn off maintenance mode' '7 - Uninstall ownCloud' '00 - Return to Main Menu')
declare -a sambamenuoptions=('1 - Install and configure Samba file sharing' '2 - Add additional Samba users' '3 - Display existing Samba users' '4 - Display existing Samba share groups' '5 - Create Samba share group' '6 - Add existing Samba users to existing share group' '7 - Add group share - read only' '8 - Add group share - full access' '9 - Uninstall Samba' '00 - Return to Main Menu')
declare -a plexmenuoptions=('1 - Install Plex Media Server' '2 - Uninstall Plex Media Server' '00 - Return to Main Menu')
declare -a webminmenuoptions=('1 - Install Webmin' '2 - Uninstall Webmin' '00 - Return to Main Menu')
declare -a netdatamenuoptions=('1 - Install Netdata' '2 - Uninstall Netdata' '00 - Return to Main Menu')
declare -a virtualboxmenuoptions=('1 - Install VirtualBox and PHPVirtualBox' '2 - Uninstall VirtualBox and PHPVirtualBox' '3 - Update Guest Additions' '00 - Return to Main Menu')
declare -a usersmenuoptions=('1 - Add additional administrators or upgrade an existing user to admin' '2 - Add additional standard users' '3 - Display administrator users' '4 - Display human users' '5 - Display non system user accounts - full detail' '6 - Display non system user accounts - user name only' '7 - Display system user accounts - full detail' '8 - Display system user accounts - user name only' '9 - Display groups - full detail' '10 - Display groups - group names only' '0 - Next' '00 - Return to Main Menu')
declare -a usersmenu2options=('1 - Remove user accounts' '2 - Check if a user exists, and if admin or standard user' '3 - Check if a group exists' '4 - Check if a user is a member of a group' '5 - Add a user to an existing group' '6 - Create a new group' '7 - Display all users in a specific group' '8 - Display all groups a specific user belongs to' '00 - Return to previous menu')
declare -a systemmenuoptions=('1 - System cleanup - remove obsolete packages' '2 - System update - update system files and programs' '3 - Update Tripwire database' '4 - List configured cron jobs' '00 - Return to Main Menu')
declare -a firewallmenu1options=('1 - Enable Rsync' '2 - Disable Rsync' '3 - Enable NFS' '4 - Disable NFS' '5 - Enable CUPS' '6 - Disable CUPS' '7 - Enable MySQL' '8 - Disable MySQL' '9 - Enable iSCSI' '10 - Disable iSCSI' '0 - Next' '00 - Return to Main Menu')
declare -a firewallmenu2options=('1 - Enable Samba' '2 - Disable Samba' '3 - Enable Webmin' '4 - Disable Webmin' '5 - Enable RDP' '6 - Disable RDP' '7 - Enable PHPVirtualBox' '8 - Disable PHPVirtualBox' '9 - Enable JBOSS' '10 - Disable JBOSS' '0 - Next' '00 - Return to Previous Menu')
declare -a firewallmenu3options=('1 - Enable Wildfly' '2 - Disable Wildfly' '00 - Return to Previous Menu')
declare -a certmanagemenuoptions=('1 - Change installed SSL certificates' '2 - Update LetsEncrypt Certificates' '3 - Add new Certificate Authority' '00 - Return to Main Menu')

declare -a cleanupmenu=('1 - Revert recent file changes, then exit.' '2 - Exit without reverting changes.' '3 - Remove last user added, then exit.')
declare -a certificatemenu=('1 - Generate self-signed certificates' '2 - Use LetsEncrypt to generate and maintain certificates')

declare -a removeowncloudmenuoptions=('1 - Uninstall ownCloud application and MariaDB' '2 - Uninstall ownCloud application, all pre-requisites, database, and stored data' '0 - Return to Uninstall Menu')
declare -a removesambamenuoptions=('1 - Uninstall Samba application' '2 - Uninstall Samba application, pre-requisites, and data' '0 - Return to Uninstall Menu')
declare -a removeplexmenuoptions=('1 - Uninstall Plex application' '2 - Uninstall Plex application, pre-requisites, and data' '0 - Return to Uninstall Menu')


###### Certificate variables ######

clientcertificate="none"
clientkey="none"
clientcachain="none"
generatecertificate=0
letsencrypt=0
combinedcert=0


###### Universal variables ######

errortrack="0"
uninstall=""
lastuser=""
smtplogin=""
currentuser=""
clientname=""
tzmain=""
tzcountry=""
tzlocale=""
currentversion="1.1.4"
installedversion=""
userchoice=""


###### Network variables ######

nicname=""
subnetip=""
subnetmask=""
baseip=""
netclassipv4=""


#######################
###### Functions ######
#######################

# Import functions
. $PWD/scripts/ErrorCleanupFunctions.cfg
. $PWD/scripts/ErrorFunctions.cfg
. $PWD/scripts/InputVerificationFunctions.cfg
. $PWD/scripts/GUIOptions.cfg
. $PWD/scripts/TimezoneFunctions.cfg
. $PWD/scripts/NetworkInterfaceFunctions.cfg
. $PWD/scripts/ClientInfoFunctions.cfg
. $PWD/scripts/HostnameFunctions.cfg
. $PWD/scripts/CurrentUserFunctions.cfg
. $PWD/scripts/SetRootFunctions.cfg
. $PWD/scripts/FQDNInfoFunctions.cfg
. $PWD/scripts/EmailFunctions.cfg
. $PWD/scripts/PrimaryFirewall.cfg
. $PWD/scripts/PHPVirtualBoxFirewall.cfg
. $PWD/scripts/RDPFirewall.cfg
. $PWD/scripts/WebminFirewall.cfg
. $PWD/scripts/RsyncFirewall.cfg
. $PWD/scripts/NFSFirewall.cfg
. $PWD/scripts/CUPSFirewall.cfg
. $PWD/scripts/FTPFirewall.cfg
. $PWD/scripts/iSCSIFirewall.cfg
. $PWD/scripts/MySQLFirewall.cfg
. $PWD/scripts/ApacheFirewall.cfg
. $PWD/scripts/PlexFirewall.cfg
. $PWD/scripts/SambaFirewall.cfg
. $PWD/scripts/ownCloudFirewall.cfg
. $PWD/scripts/WildflyFirewall.cfg
. $PWD/scripts/JBOSSFirewall.cfg
. $PWD/scripts/SystemUtilityFunctions.cfg
. $PWD/scripts/UserManagementFunctions.cfg
. $PWD/scripts/LoginSecurityFunctions.cfg
. $PWD/scripts/SecurityFunctions.cfg
. $PWD/scripts/LogConfFunctions.cfg
. $PWD/scripts/ownCloudFunctions.cfg
. $PWD/scripts/ApacheFunctions.cfg
. $PWD/scripts/CertificateFunctions.cfg
. $PWD/scripts/CleanupFunctions.cfg
. $PWD/scripts/NetdataFunctions.cfg
. $PWD/scripts/VirtualBoxFunctions.cfg
. $PWD/scripts/SambaFunctions.cfg
. $PWD/scripts/PlexFunctions.cfg
. $PWD/scripts/WebminFunctions.cfg
. $PWD/scripts/InstallFunctions.cfg
. $PWD/scripts/UninstallFunctions.cfg
. $PWD/scripts/UninstallMenus.cfg
. $PWD/scripts/MainMenus.cfg
. $PWD/scripts/GetExistingConfig.cfg
. $PWD/scripts/PrimaryPreMenu.cfg


######################################
############ Main program ############
######################################

versionCheck;
preInstall;
mainMenu;


#####################################
############ End of file ############
#####################################
