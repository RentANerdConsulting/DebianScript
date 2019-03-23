#!/bin/bash


###### Variables and arrays for error checking ######

progname=$(basename $0)
correct=""
beenrun=0
filecount=0
a=0
declare -a filestoreplace=()


###### Variables for LAMP functions ######

singlesite=""
phpmaadmin=""
phpmapass=""
phpmahostname=""
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
# 5-phpmyadmin-ssl
# 6-plex-ssl
# 7-chat-ssl
# 8-wp-ssl


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
declare -a existingvms=()
declare -a getexistingvms=()


###### Variables for Samba ######

createsambauser=0
useraddoops=0
sambadir=""


###### Plex variables ######

plexdir=""
plexpass=""


###### Variables and arrays for menus ######

INPUT=/tmp/menu.sh.$$
menuselection=""
declare -a menuoptions=('ownCloud Functions' 'Samba Functions' 'Plex Functions' 'Webmin Functions' 'Web-based Admin Site User Access Functions' 'VirtualBox Functions' 'Netdata Functions' 'System utilities' 'Firewall options' 'User management' 'Certificate management' 'Security management' 'Exit without reboot' 'Exit and reboot.')
declare -a secmanagemenuoptions=('Disable password login via SSH' 'Generate SSH RSA keys locally using ssh-keygen - good' 'Generate SSH RSA keys using PuTTYgen - better' 'Switch SSH listen port to 1022 to reduce attacks' 'Return to Main Menu')
declare -a owncloudmenuoptions=('Install and configure ownCloud' 'Upgrade ownCloud after package update' 'Set secure file permissions' 'Revoke secure file permissions' 'Turn on maintenance mode' 'Turn off maintenance mode' 'Uninstall ownCloud' 'Return to Main Menu')
declare -a sambamenuoptions=('Install and configure Samba file sharing' 'Add additional Samba users' 'Display existing Samba users' 'Display existing Samba share groups' 'Create Samba share group' 'Add existing Samba users to existing share group' 'Add group share - read only' '8 - Add group share - full access' '9 - Uninstall Samba' '00 - Return to Main Menu')
declare -a plexmenuoptions=('Install Plex Media Server' 'Uninstall Plex Media Server' 'Return to Main Menu')
declare -a webminmenuoptions=('Install Webmin' 'Uninstall Webmin' 'Return to Main Menu')
declare -a webadminmenuoptions=('Add new user to PHPMyAdmin access list' 'Add new user to PHPVirtualBox access list' 'Add new user to Netdata access list' 'Return to Main Menu')
declare -a netdatamenuoptions=('Install Netdata' 'Uninstall Netdata' 'Return to Main Menu')
declare -a virtualboxmenuoptions=('Install VirtualBox and PHPVirtualBox' 'Uninstall VirtualBox and PHPVirtualBox' 'Update Guest Additions' 'Display existing VMs' 'Set VM to start/stop with host automatically' 'Return to Main Menu')
declare -a usersmenuoptions=('Add additional administrators or upgrade an existing user to admin' 'Add additional standard users' 'Display administrator users' 'Display human users' 'Display non system user accounts - full detail' 'Display non system user accounts - user name only' 'Display system user accounts - full detail' 'Display system user accounts - user name only' 'Display groups - full detail' 'Display groups - group names only' 'Next' 'Return to Main Menu')
declare -a usersmenu2options=('Remove user accounts' 'Check if a user exists, and if admin or standard user' 'Check if a group exists' 'Check if a user is a member of a group' 'Add a user to an existing group' 'Create a new group' 'Remove a non-system user from a group' 'Remove a non-system group' 'Display all users in a specific group' 'Display all groups a specific user belongs to' 'Return to previous menu')
declare -a systemmenuoptions=('System cleanup - remove obsolete packages' 'System update - update system files and programs' 'Update Tripwire database' 'List configured cron jobs' 'Return to Main Menu')
declare -a firewallmenu1options=('Enable Rsync' 'Disable Rsync' 'Enable NFS' 'Disable NFS' 'Enable CUPS' 'Disable CUPS' 'Enable MySQL' 'Disable MySQL' 'Enable iSCSI' 'Disable iSCSI' 'Next' 'Return to Main Menu')
declare -a firewallmenu2options=('Enable Samba' 'Disable Samba' 'Enable Webmin' 'Disable Webmin' 'Enable RDP' 'Disable RDP' 'Enable PHPVirtualBox' 'Disable PHPVirtualBox' 'Enable JBOSS' 'Disable JBOSS' 'Next' 'Return to Previous Menu')
declare -a firewallmenu3options=('Enable Wildfly' 'Disable Wildfly' 'Return to Previous Menu')
declare -a certmanagemenuoptions=('Change installed SSL certificates' 'Update LetsEncrypt Certificates' 'Add new Certificate Authority' 'Return to Main Menu')
declare -a zfsmanagementoptions=('Install ZFS' 'List ZFS pools' 'Import ZFS pool' 'Export ZFS pool' 'Create ZFS pool' 'Scrub ZFS pool' 'Return to Main Menu')

declare -a cleanupmenu=('Revert recent file changes, then exit.' 'Exit without reverting changes.' 'Remove last user added, then exit.')
declare -a certificatemenu=('1 - Generate self-signed certificates' '2 - Use LetsEncrypt to generate and maintain certificates')

declare -a removeowncloudmenuoptions=('Uninstall ownCloud application and MariaDB' 'Uninstall ownCloud application, all pre-requisites, database, and stored data' 'Return to Uninstall Menu')
declare -a removesambamenuoptions=('Uninstall Samba application' 'Uninstall Samba application, pre-requisites, and data' 'Return to Uninstall Menu')
declare -a removeplexmenuoptions=('Uninstall Plex application' 'Uninstall Plex application, pre-requisites, and data' 'Return to Uninstall Menu')


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
currentversion="1.1.7"
installedversion=""
userchoice=""
osversion=""
distroid=""
totsysmemory=""
freesysmemory=""
usedsysmemory=""


###### Network variables ######

nicname=""
subnetip=""
subnetmask=""
baseip=""
netclassipv4=""
currentip=""


###### ZFS variables ######

zfsmemorymax=""
zfsmemorymin=""
zfspoolname=""
declare -a getzfsnames=()
declare -a zfsnames=()



#######################
###### Functions ######
#######################

# Import functions
. $PWD/scripts/ErrorCleanupFunctions.cfg
. $PWD/scripts/ErrorFunctions.cfg
. $PWD/scripts/InputVerificationFunctions.cfg
. $PWD/scripts/HWInfoFunctions.cfg
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
. $PWD/scripts/MariaDBFunctions.cfg
. $PWD/scripts/ownCloudFunctions.cfg
. $PWD/scripts/ApacheFunctions.cfg
. $PWD/scripts/CertificateFunctions.cfg
. $PWD/scripts/CleanupFunctions.cfg
. $PWD/scripts/NetdataFunctions.cfg
. $PWD/scripts/VirtualBoxFunctions.cfg
. $PWD/scripts/SambaFunctions.cfg
. $PWD/scripts/PlexFunctions.cfg
. $PWD/scripts/WebminFunctions.cfg
. $PWD/scripts/ZFSFunctions.cfg
. $PWD/scripts/InstallFunctions.cfg
. $PWD/scripts/UninstallFunctions.cfg
. $PWD/scripts/UninstallMenus.cfg
. $PWD/scripts/MainMenus.cfg
. $PWD/scripts/GetExistingConfig.cfg
. $PWD/scripts/PrimaryPreMenu.cfg


######################################
############ Main program ############
######################################

error=$(errorTracking)
versionCheck;
preInstall;
mainMenu;


#####################################
############ End of file ############
#####################################
