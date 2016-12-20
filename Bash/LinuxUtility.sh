#!/bin/bash


###### Variables and arrays for error checking ######
#####################################################

progname=$(basename $0)
correct=""
beenrun=0
filecount=0
a=0
declare -a filestoreplace=()


###### Variables and arrays for ownCloud functions ######
#########################################################

mdbrootpass=""
ocdbpass=""
ocadminpass=""
maxuploadMB=0
uploadbase=1048576
maxuploadMBtemp=0


###### Variables and arrays for Samba ######
############################################

createsambauser=0
useraddoops=0


###### Variables and arrays for menus ######
############################################

menuselection=1
declare -a menuoptions=('1 - Install primary functions' '2 - Uninstall primary functions' '3 - System utilities' '4 - Firewall options' '5 - User management' '0 - Exit and reboot.')
declare -a installmenuoptions=('1 - Install and configure ownCloud.' '2 - Install and configure Samba file sharing.' '3 - Install Plex Media Server.' '0 - Return to Main Menu')
declare -a usersmenuoptions=('1 - Add additional administrators.' '2 - Add additional standard users.' '3 - Add additional Samba users' '0 - Return to Main Menu')
declare -a systemmenuoptions=('1 - System cleanup - remove obsolete packages' '2 - System update - update system files and programs' '3 - Upgrade ownCloud after package update' '4 - Update Tripwire database' '5 - List configured cron jobs' '0 - Return to Main Menu')
declare -a firewallmenuoptions=('1 - Enable Rsync' '2 - Disable Rsync' '3 - Enable NFS' '4 - Disable NFS' '5 - Enable CUPS' '6 - Disable CUPS' '7 - Enable MySQL' '8 - Disable MySQL' '9 - Enable iSCSI' '10 - Disable iSCSI' '11 - Enable Samba' '12 - Disable Samba' '0 - Return to Main Menu')
declare -a cleanupmenu=('1 - Revert recent file changes, then exit.' '2 - Exit without reverting changes.' '3 - Remove last user added, then exit.')
declare -a certificatemenu=('1 - Generate self-signed certificates' '2 - Use LetsEncrypt to generate and maintain certificates')
declare -a uninstallmenuoptions=('1 - Uninstall ownCloud' '2 - Uninstall Samba' '3 - Uninstall Plex Media Server' '0 - Return to Main Menu')
declare -a removeowncloudmenuoptions=('1 - Uninstall ownCloud application and MariaDB' '2 - Uninstall ownCloud application, all pre-requisites, database, and stored data' '0 - Return to Uninstall Menu')
declare -a removesambamenuoptions=('1 - Uninstall Samba application' '2 - Uninstall Samba application, pre-requisites, and data' '0 - Return to Uninstall Menu')
declare -a removeplexmenuoptions=('1 - Uninstall Plex application' '2 - Uninstall Plex application, pre-requisites, and data' '0 - Return to Uninstall Menu')


###### Certificate variables ######
###################################

clientcertificate="none"
clientkey="none"
clientcachain="none"
generatecertificate=0
letsencrypt=0
combinedcert=0


###### Universal variables and arrays ######
############################################

uninstall=""
virtualbox=""
nicname=""
subnetip=""
subnetmask=""
lastuser=""
fqdn=""
smtplogin=""
hostname=""
currentuser=""
clientname=""
tzmain=""
tzcountry=""
tzlocale=""
hostedserver=""
currentversion="1.1"
installedversion=""


# Import functions
. $PWD/scripts/ErrorCleanupFunctions.cfg
. $PWD/scripts/ErrorFunctions.cfg
. $PWD/scripts/TimezoneFunctions.cfg
. $PWD/scripts/VirtualBoxFunctions.cfg
. $PWD/scripts/NetworkInterfaceFunctions.cfg
. $PWD/scripts/ClientInfoFunctions.cfg
. $PWD/scripts/HostnameFunctions.cfg
. $PWD/scripts/CurrentUserFunctions.cfg
. $PWD/scripts/SetRootFunctions.cfg
. $PWD/scripts/FQDNInfoFunctions.cfg
. $PWD/scripts/EmailFunctions.cfg
. $PWD/scripts/SystemUtilityFunctions.cfg
. $PWD/scripts/PrimaryFirewall.cfg
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
. $PWD/scripts/SecurityFunctions.cfg
. $PWD/scripts/LogConfFunctions.cfg
. $PWD/scripts/ownCloudFunctions.cfg
. $PWD/scripts/ApacheFunctions.cfg
. $PWD/scripts/CleanupFunctions.cfg
. $PWD/scripts/SambaFunctions.cfg
. $PWD/scripts/PlexFunctions.cfg
. $PWD/scripts/InstallFunctions.cfg
. $PWD/scripts/UninstallFunctions.cfg
. $PWD/scripts/UninstallMenus.cfg
. $PWD/scripts/MainMenus.cfg
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
