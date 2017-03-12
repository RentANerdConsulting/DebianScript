# **Version 1.1.3**


# **Initial System Configuration**

Translates user names, groups, hostnames, etc, into lowercase, to prevent issues from mismatched casing.

Parses subnet, mask, and network type based on IP. (We recommend leaving the NIC set to acquire it's configuration from the router via DHCP, and setting a static IP at the router.)

Keeps flag files to ensure functions are not repeatedly run if installations from the menu share functions.

Error checking, failed commands will report line of script that failed, and if files were altered, offer to revert them back to their original state before the failed function ran.

Pulls all relevant information from the flag files when loading the script.


Prompts and automatic configuration based on responses for:

1) System hostname

2) TimeZone settings

3) HTTP and HTTPS router port forwarding (Only use defaults internally at your system. We haven't worked a complete alteration into the script yet.) This will set auto HTTP forwarding to the relevant port for HTTPS.

4) Prompt to verify that the system is a physical machine during initial system configuration. If not a physical system, VirtualBox will not install from this script.

5) Automatic detection and kernel configuration for virtualization technologies of AMD and Intel, with a prompt during initial configuration to allow a reboot to ensure these are enabled in bios. If they are not, but should be, a reinstall of the OS is recommended for systems with multiple hard disk controllers, as enabling these technologies may alter the device location information and require more time than a base level reinstall to repair.

6) **(Currently defaults to Server and CLI)** Check to see if server or Desktop, installing GUI by default for Desktop, offering several options, and offers CLI or GUI interfaces for servers.

7) Uncomments source list entries for access to source repos and a wider variety of software.

8) Runs initial updates so the system starts out up to date.

9) Installs an array of system utilities, as well as build-essentials.

10) Passwords set as needed throughout, recommended method of generation and storage is Keepass 2.x with GoogleSync or equivalent synchronization plugin.

11) System hardening based on installed applications. **See Security heading**

12) Default DROP ALL firewall. Updates coming soon to fully comply with industry standards for troubleshooting purposes.

13) Email aliases set so admins get root emails.

14) Root user account assigned password stored and generated in Keepass. There is almost never a reason to actually need direct access to the root account, but it is secured and available if necessary.


# **Security**
  
1) Shared memory secured.
  
2) Disabled insecure SSL standards v2/v3.
  
3) Admins created to admin group, su limited to admin group.
  
4) SSH root login disabled, SSH-1 disabled, SSH login restricted to admin group.
  
5) IP Spoofing protection, Ignore ICMP broadcast requests, Disable source packet routing, Ignore send redirects, Block SYN attacks, Log Martians, Ignore ICMP redirects, Ignore Directed pings (Edit to suit your requirements).
  
6) PHP secured.
  
7) Apache secured.
  
8) Mod_evasive.
  
9) Fail2ban enabled per service install, emails currently enabled per blocked attempt. Disable emails if this drives you nuts, a summary is included in logwatch emails.
  
10) Chkrootkit and rkhunter installed and run daily, rkhunter updated when system updates applied.
  
11) Nmap for port checks.
  
12) LogWatch configured for daily emails.
  
13) Apparmor enabled, tune as needed.
  
14) Tripwire installed, with menu function for updating. Database updated when system updates are run, to reduce false positives.

15) Menu option to reconfigure SSH to use port 1022 instead of 22, to drastically reduce malicious access attempts.
  
16) PSAD not yet included.
  
17) ModSecurity not included due the immense hassle of fine tuning it for each application.
  
  
# **System Maintenance**

1) System update, tripwire database updated after updates.

2) System cleanup - Remove old and obsolete packages (including old kernels), rebuild initramfs, update grub.

3) Display currently configured cronjobs.

4) Manually update Tripwire.


# **ownCloud**
  
1) Installation and configuration of Apache, MariaDB, PHP7.0, and ownCloud.
  
2) Secure file settings enabled or disabled as needed before and after updates.
  
3) Menu functions to run manual update after package update, disable or enable maintenance mode, and set or unset secure file permissions for before and after manual maintenance.
  
4) Automatic forwarding of all http requests to https, Self-Signed key generation, LetsEncrypt configuration, or import of existing certificates.

5) Installation of modules needed for the majority of functions owncloud supports, to allow further customization. Please let us know if you find something we've missed.

6) Configuration of firewall rules to support owncloud and the majority of features it supports.

7) Hostname automatically added in /etc/hosts during installation.
  
  
# **Samba**
  
1) Primary installation and configuration of basic file sharing, firewalled for local network only in IPv4, disabled currently in IPv6.

2) Due to local network only configuration, it is disabled for 3rd party hosted servers. A server hosted by Google isn't likely going to have a local network that you should be using it on.

3) Configuration of a primary directory for shares to be located. Additional users can be added to the Samba group, and shares created under the parent storage directory.

4) Verifcation that new Samba users are not already in the group, that they exist at all, and the option to create standard or administrator users if they do not already exist.

5) In the works: Creation of group read only and full access shares, with new groups being created as necessary, along with the option to add users to said groups and shares.


# **Plex**

1) Installation of Plex Media Server and requirements.

2) Creation of parent folder for media storage, with subfolders Movies, Music, and TV created as well.

3) Firewall rules to support full access via Plex login site, local media server access, etc.

  
# **Netdata**

1) Installation and configuration of Apache, MariaDB, PHP7.0, and Netdata.

2) Enables ksm to conserve memory usage

3) Set to store 4 hours of data for monitoring purposes

4) Configured for use of FQDN format URL, eg netdata.foo.bar, user sets hostname, domain is determined by system wide FQDN.

5) HTTP requests automatically forwarded to HTTPS, user and password created during install required for access.

6) Site set to display system name in hostname@domain to make it easier to identify what system is being accessed if multiple servers exist for the same domain.

7) Configured to start at boot.

8) Further customization is recommended, as it pulls a tooooooooooon of information, most of it not necessary in many cases, with alert values that are a bit too sensitive IMHO.

9) Hostname automatically added in /etc/hosts during installation.
  
  
# **VirtualBox and PHPVirtualBox**
  
1) Installation and configuration of Apache, MariaDB, PHP7.0, VirtualBox, and phpvirtualbox.

2) Configured for use of fqdn format URL, eg phpvirtualbox.foo.bar, user sets hostname.

3) HTTP requests automatically forwarded to HTTPS.

4) Option to select and start VM's at boot from the script menu currently in the works.

5) Prompt to select directory for VM storage during install.

6) Displays current hostnames used by the system before hostname selection, and checks to ensure that a duplicate hostname has not been selected.

7) Configured to send ACPI shutdown signal to active VMs and wait up to 30 sec for them to complete shutdown, in case reboot or power cycle is required.

8) Download and installation of Extention Pack during installation.

9) Hostname automatically added in /etc/hosts during installation.

# **User Management**

1) Add new administrators

2) Add new standard users

3) Display user accounts - full detail or names only

4) Display System user accounts - full detail or names only

5) Display groups - full detail or names only

6) Check to see if a user exists

7) Check to see if a group exists

8) Check to see if a user is a member of a group

  
# **Certificate Management**

1) Renew or replace SSL LetsEncrypt certificates

2) Generate and configure SSH RSA keys via ssh-keygen - good

3) Generate and configure SSH RSA keys via PuTTYgen - BETTER

4) Disable password SSH login after generating SSH RSA keys

5) Self-signed certs are created as wildcard, to simplify hosting multiple sites, and imported certs currently need to be as well. LetsEncrypt certs are automatically renewed and new sites added during installs.
  
  
# **IPTables Firewall**
  
Configured for primary NIC only, can be changed to segment traffic for local and external to handled by different NICs, and this will be included in future versions.
  
  
**Stateful drop-all-by-default firewall rules:**

Established and Related - All

Localhost - All

Local Network SNMP - All

Local Network ICMP - All, outbound and established only out of LAN

Local Network UDP - All, outbound and established only out of LAN
  
  
**Baseline allowed New:**

DNS - outbound

DHCP - outbound

NTP - outbound

WhoIS - outbound

SSH - inbound

FTP - outbound

SMTP - outbound

SMTP SSL - outbound

IMAP SSL - outbound

POP3 SSL - outbound

HTTP & HTTPS - outbound

Logging enabled

Invalid packets dropped
  
  
**ownCloud installed New:**

HTTP & HTTPS - All

FTPS - Outbound

SLDAP - outbound

LDAP - outbound

CalDAV - All

WebDAV - outbound

CardDAV - outbound
  
  
**Samba installed New:**
  


  
**Misc - enabled via menu, off by default:**

Rsync - All - toggle option

NFS - All Local Network only - toggle option

RDP - incoming - toggle option

iSCSI - All - toggle option

MySQL - All - toggle option

CUPS - inbound Local Network only - toggle option

JBOSS - toggle option

Wildfly - toggle option
