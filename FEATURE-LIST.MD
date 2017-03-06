# **Version 1.1.3**


**Security**

Many settings found at: https://www.thefanclub.co.za/how-to/how-secure-ubuntu-1604-lts-server-part-1-basics

1) Shared memory secured.

2) Disabled insecure SSL standards v2/v3.

3) Admins created to admin group, su limited to admin group.

4) SSH root login disabled, SSH-1 disabled.

5) IP Spoofing protection, Ignore ICMP broadcast requests, Disable source packet routing, Ignore send redirects, Block SYN attacks, Log Martians, Ignore ICMP redirects, Ignore Directed pings (Edit to suit your requirements)

6) IP Spoofing protection.

7) PHP secured.

8) Apache secured.

9) Mod_evasive.

10) Fail2ban enabled per service install, emails currently enabled per blocked attempt. Disable emails if this drives you nuts, a summary is included in logwatch emails.

11) Chkrootkit and rkhunter installed and run daily, rkhunter updated when system updates applied.

12) Nmap for port checks.

13) LogWatch configured for daily emails.

14) Apparmor enabled, tune as needed.

15) Tripwire installed, with menu function for updating. Will soon be scripted to update when system updates are run, to reduce false positives.

16) PSAD not yet included.

17) ModSecurity not included due the immense hassle of fine tuning it for each application.



**ownCloud**

1) Installation and configuration of Apache, MariaDB, PHP7.0, and ownCloud.

2) Secure file settings enabled or disabled as needed before and after updates.

3) Menu functions to run manual update after package update, disable or enable maintenance mode, and file permissions.

4) Automatic forwarding of all http requests to https, Self-Signed key generation, LetsEncrypt configuration, or import of existing certificates.



**Samba**


**Plex**


**Netdata**


**VirtualBox and PHPVirtualBox**


**User Management**


**IPTables Firewall**

Stateful drop-all-by-default firewall rules:

Baseline allowed:


