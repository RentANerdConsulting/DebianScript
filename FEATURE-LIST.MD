# **Version 1.1.3**

  
# **Security**
  
Many settings found at: https://www.thefanclub.co.za/how-to/how-secure-ubuntu-1604-lts-server-part-1-basics
  
1) Shared memory secured.
  
2) Disabled insecure SSL standards v2/v3.
  
3) Admins created to admin group, su limited to admin group.
  
4) SSH root login disabled, SSH-1 disabled, SSH login restricted to admin group
  
5) IP Spoofing protection, Ignore ICMP broadcast requests, Disable source packet routing, Ignore send redirects, Block SYN attacks, Log Martians, Ignore ICMP redirects, Ignore Directed pings (Edit to suit your requirements)
  
6) PHP secured.
  
7) Apache secured.
  
8) Mod_evasive.
  
9) Fail2ban enabled per service install, emails currently enabled per blocked attempt. Disable emails if this drives you nuts, a summary is included in logwatch emails.
  
10) Chkrootkit and rkhunter installed and run daily, rkhunter updated when system updates applied.
  
11) Nmap for port checks.
  
12) LogWatch configured for daily emails.
  
13) Apparmor enabled, tune as needed.
  
14) Tripwire installed, with menu function for updating. Database updated when system updates are run, to reduce false positives.
  
15) PSAD not yet included.
  
16) ModSecurity not included due the immense hassle of fine tuning it for each application.
  
  
# **System Maintenance**

1) System update, tripwire database updated after updates.

2) System cleanup - Remove old and obsolete packages (including old kernels), rebuild initramfs, update grub.

3) Display currently configured cronjobs.

4) Manually update Tripwire.


# **ownCloud**
  
1) Installation and configuration of Apache, MariaDB, PHP7.0, and ownCloud.
  
2) Secure file settings enabled or disabled as needed before and after updates.
  
3) Menu functions to run manual update after package update, disable or enable maintenance mode, and file permissions.
  
4) Automatic forwarding of all http requests to https, Self-Signed key generation, LetsEncrypt configuration, or import of existing certificates.
  
  
# **Samba**
  
  
# **Plex**
  
  
# **Netdata**

1) Installation and configuration.

2) Enables ksm to conserve memory usage

3) Set to store 4 hours of data for monitoring purposes

4) Configured for use of fqdn format URL, eg netdata.foo.bar, user sets hostname.

5) HTTP requests automatically forwarded to HTTPS, user and password created during install required for access.

6) Site set to display system name in hostname@domain to make it easier to identify what system is being accessed if multiple servers exist for the same domain.

7) Configured to start at boot.
  
  
# **VirtualBox and PHPVirtualBox**
  
1) Installation and configuration.

2) Configured for use of fqdn format URL, eg phpvirtualbox.foo.bar, user sets hostname.

3) HTTP requests automatically forwarded to HTTPS.

4) Option to select and start VM's at boot from the script menu currently in the works.


# **User Management**

1) Add new administrators

2) Add new standard users

3) Display user accounts - full detail or names only

4) Display System user accounts - full detail or names only

5) Display groups - full detail or names only


  
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
