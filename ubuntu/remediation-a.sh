#!/bin/bash
tput clear
YELLOW=$'\033[0;33m'
RED=$'\033[0;31m'
NC=$'\033[0m'
GREEN=$'\033[0;32m'
MG=$'\33[1;35m'
BLUE=$'\33[1;34m'

date=$(date +"%d-%m-%Y")
echo $'\e[1;34m'MAJOR PROJECT Group 5 $date$'\e[0m'
echo

echo --------------------------------------------------------------------------------------
echo $'\e[1;31m'Remediation$'\e[0m'
echo --------------------------------------------------------------------------------------

echo -e '\033[1;33mFileSystem\033[0m'
echo "--------------------------------------------------------------------------------------"
echo "${MG}1.1 Filesystem Configuration${NC}"
echo "${YELLOW}[+]	Subsection 1.1.1 Disable Unused File${NC}"
echo "1.1.1.1 Edit the following file '/etc/modprobe.d/' with a line that reads:"
echo "${BLUE}install cramfs /bin/false, blacklist cramfs${NC}"
echo "To unload the cramfs module:"
echo "${BLUE}modprobe -r cramfs${NC}"
echo
echo "1.1.1.2 Edit the following file '/etc/modprobe.d' with a line that reads:"
echo "${BLUE}install squashfs /bin/false,blacklist squahshfs${NC}"
echo "To unload the squashfs module:"
echo "${BLUE}modprobe -r squashfs${NC}"
echo
echo "1.1.1.3 Edit the following file '/etc/modprobe.d' with a line that reads:"
echo "${BLUE}install udf /bin/false, blacklist udf${NC}"
echo "To unload the squashfs module:"
echo "${BLUE}modprobe -r udf${NC}"
echo

echo "${YELLOW}[+]	Subsection 1.1.2 Configure /tmp${NC}"
echo "1.1.2.1 To ensure the /tmp is mounted at boot time:"
echo "${BLUE}systemctl unmask tmp.mount${NC}"
echo
echo "1.1.2.2 Edit the '/etc/fstab' file with:"
echo "${BLUE}nodev${NC}on the 4th line"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /tmp${NC}"
echo
echo "1.1.2.3 Edit the '/etc/fstab' file with:"
echo "${BLUE}noexec${NC}to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /tmp${NC}"
echo

echo "1.1.2.4 Edit the '/etc/fstab' file with:"
echo "${BLUE}nosuid${NC}to the 4th field"
echo  "Proceed to run:"
echo "${BLUE}mount -o remount /tmp${NC}"
echo
echo "${YELLOW}[+]	Subsection 1.1.3 Configure /var${NC}"
echo "1.1.3.1 For new installations, during installation do create a custom partition and specify the partition for /var"
echo "For systems that has already exist, configure appropriately in:"
echo "${BLUE}/etc/fstab${NC}"
echo
echo "1.1.3.2 Edit the '/etc/fstab' file with:"
echo "${BLUE}nodev${NC}to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var${NC}"
echo
echo "1.1.3.3 Edit the '/etc/fstab' file with:"
echo "${BLUE}noexec${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var${NC}"
echo
echo "1.1.3.4 Edit the '/etc/fstab' file with:"
echo "${BLUE}nosuid${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var${NC}"
echo
echo "${YELLOW}[+]	Subsection 1.1.4 Configure /var/tmp${NC}"
echo "1.1.4.1 For new installations, do create a custom partition and specify the separate partition for '/var/tmp'"
echo "For systems that has already exists, configure appropriately in:"
echo "${BLUE}/etc/fstab${NC}"
echo
echo "1.1.4.2 Edit the '/etc/fstab' file with:"
echo "${BLUE}noexec${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var/tmp${NC}"
echo
echo "1.1.4.3 Edit the '/etc/fstab' file with:"
echo "${BLUE}nosuid${NC} to the 4th field for the /var/tmp"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var/tmp${NC}"
echo
echo "1.1.4.4 Edit the '/etc/fstab' file with:"
echo "${BLUE}nodev${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var/tmp"
echo
echo "${YELLOW}[+]	Subsection 1.1.5 Configure /var/log${NC}"
echo "1.1.5.1 For new installations, do create a custom partition and specify the separate partition for '/var/log'"
echo "For systems that has already exists, configure appropriately in the:"
echo "${BLUE}/etc/fstab${NC}"
echo
echo "1.1.5.2 Edit the '/etc/fstab' file with:"
echo "${BLUE}nodev${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var/log${NC}"
echo
echo "1.1.5.3 Edit the '/etc/fstab' file with:"
echo "${BLUE}noexec${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var/log${NC}"
echo 
echo "1.1.5.4 Edit the '/etc/fstab' file with:"
echo "${BLUE}nosuid${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var/log${NC}"
echo
echo "${YELLOW}[+]	Subsection 1.1.6 Configure /var/log/audit${NC}"
echo "1.1.6.1 For new installation, do create a custom partition and specify the separate partition for /var/log/audit"
echo "For systems that has already exists, configure appropriately in the:"
echo "${BLUE}/etc/fstab${NC} file"
echo
echo "1.1.6.2 Edit the '/etc/fstab' file with:"
echo "${BLUE}noexec${NC}to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var/log/audit${NC}"
echo
echo "1.1.6.3 Edit the '/etc/fstab' file with:"
echo "${BLUE}nodev${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var/log/audit${NC}"
echo
echo "1.1.6.4 Edit the '/etc/fstab' file with:"
echo "${BLUE}nosuid${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /var/log/audit${NC}"
echo
echo "${YELLOW}[+]	Subsection 1.1.7 Configure /home${NC}"
echo "1.1.7.1 For new installation, do create a custom partition and specify the separate partition for /home"
echo "For systems that has already exists, configure appropriately in the:"
echo "${BLUE}/etc/fstab${NC} file"
echo
echo "1.1.7.2 Edit the '/etc/fstab' file with:"
echo "${BLUE}nodev${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /home${NC}"
echo 
echo "1.1.7.3 Edit the '/etc/fstab' file with:"
echo "${BLUE}nosuid${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /home${NC}"
echo 
echo "1.1.7.4 Edit the '/etc/fstab' file with:"
echo "${BLUE}ursquota${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /home${NC}"
echo "Create quota database with:"
echo "${BLUE}quotacheck -cugv /home${NC}"
echo "To enable the quotas run:"
echo "${BLUE}quotaon -vug /home${NC}"
echo 
echo "1.1.7.5 Edit the '/etc/fstab' file with:"
echo "${BLUE}grpquota${NC} to the 4th field"
echo " Proceed to run:"
echo "${BLUE}mount -o remount /home${NC}"
echo "Create quota database with:"
echo "${BLUE}quotacheck -cugv /homE${NC}"
echo "To enable the quotas:"
echo "${BLUE}quotan -vug /home${NC}"
echo
echo "${YELLOW}[+]	Subsection 1.1.8 Configure /dev/shm${NC}"
echo "1.1.8.1 Edit the '/etc/fstab' file with:"
echo "${BLUE}nodev${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /dev/shm${NC}"
echo 
echo "1.1.8.2 Edit the '/etc/fstab' file with:"
echo "${BLUE}noexec${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /dev/shm${NC}"
echo 
echo "1.1.8.3 Edit the '/etc/fstab' file with:"
echo "${BLUE}nosuid${NC} to the 4th field"
echo "Proceed to run:"
echo "${BLUE}mount -o remount /dev/shm${NC}"
echo
echo "1.1.9 Disable Automounting"
echo "Remove the packages with:"
echo "${BLUE}dnf remove autofs${NC}"
echo "To disable Autofs:"
echo "${BLUE}systemctl --now disable autofs${NC}"
echo
echo "1.1.10 Disable USB Storage"
echo "Edit the '/etc/modprobe.d/' with:"
echo "${BLUE}install usb-storage /bin/false${NC}"
echo "To unload the usb-storage module run:"
echo "${BLUE}rmmod usb-storage${NC}"
echo
echo "${MG}1.2 Configure Software Updates${NC}"
echo "1.2.1 Update your package manager GPG Keys in accordance to the site policy"
echo 
echo "1.2.2 Edit the '/etc/dnf/dnf.conf' and set:"
echo "${BLUE}gpgchecks=1${NC}"
echo
echo "1.2.3 Configure your package manager repositories according to the site policy"
echo 
echo "${MG}1.3 Filesystem Integrity Checking${NC}"
echo "1.3.1 To install AIDE, run this command:"
echo "${BLUE}dnf install aide${NC}"
echo "Configure the AIDE with:"
echo "${BLUE}aide --init, mv /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz${NC}"
echo
echo "1.3.2 Run the following to do an aide check:"
echo "${BLUE}crontab -u root -e${NC}"
echo "Add the following line to crontab:"
echo "${BLUE}'0 5 * * * /usr/sbin/aide --check${NC}"
echo
echo "${MG}1.4 Secure Boot Settings${NC}"
echo "1.4.1 Create an encryted password with:"
echo "${BLUE}grub2-password${NC}"
echo
echo "1.4.2 When the system uses UEFI, edit using:"
echo "${BLUE}/etc/fstab file, add 'fmask=0077, uid=0, gid=0${NC}"
echo 
echo "1.4.3 Create a file '/etc/systemd/system/rescue.service.d/00-require-auth.conf' which contains only the configuration to be overriden:"
echo "${BLUE}ExecStart= /usr/lib/systemd/systemd-sulogin-shell rescue${NC}"
echo
echo "${MG}1.5 Additional Process Hardening${NC}"
echo "1.5.1 To edit file:"
echo "${BLUE}/etc/systemd/coredump.conf and add 'Storage=none'${NC}"
echo
echo "1.5.2 To edit file:"
echo "${BLUE}/etc/systemd/coredump.conf and add 'ProcessSizeMax=0'${NC}"
echo
echo "1.5.3 Set the following in '/etc/sysctl.conf':"
echo "${BLUE}Printf 'kernel.randomize_va_space=2' >> /etc/systcl.d/60-kernel_systcl.conf${NC}"
echo "And run:"
echo "${BLUE}sysctl -w kernel.randomize_va_space=2${NC}"
echo
echo "${MG}1.6 Mandatory Access Control ${NC}"
echo "1.6.1.1 To install SELinux run this command:"
echo "${BLUE}dnf install libselinux${NC}"
echo "1.6.1.2 To remove all instances of selinux=0 and enforcing=0:"
echo "${BLUE}grubby --update-kernel ALL --remove-args 'selinux=0 enforcing=0${NC}"
echo 
echo "1.6.1.3 Edit '/etc/selinux/config' to set:"
echo "${BLUE}SELINUXTYPE=targeted${NC}"
echo
echo "1.6.1.4 To set mode Enforcing, run:"
echo "${BLUE}setenforce 1${NC}"
echo "Or to set mode to Permissice, run:"
echo "${BLUE}setenforce 0${NC}"
echo
echo "1.6.1.5 To set mode Enforcing, run:"
echo "${BLUE}setenforce 1${NC}"
echo "Or to set mode to Permissice, run:"
echo "${BLUE}setenforce 0${NC}"
echo 
echo "1.6.1.6 Look through any unconfined processes found during the audit action"
echo 
echo "1.6.1.7 To uninstall 'setroubleshoot' run:"
echo "${BLUE}dnf remove setroubleshoot${NC}"
echo
echo "1.6.1.8 To uninstall 'mcstrans' run:"
echo "${BLUE}dnf remove mcstrans${NC}"
echo
echo "${MG}1.7 Command Line Warning BAnners${NC}"
echo "1.7.1 Edit '/etc/motd' file and remove any instances, '\m, \r, \s, \v'"
echo " If motd is not used, remove the file by running:"
echo "${BLUE}rm /etc/motd${NC}"
echo 
echo "1.7.2 Edit '/etc/issue' and remove any instances, '\m, \r, \s, \v'"
echo 
echo "1.7.3 Edit '/etc/issue.net' and remove any instances, '\m, \r, \s, \v'"
echo 
echo "1.7.4 Run these commands to set permissions on '/etc/motd':"
echo "${BLUE}chown root:root /etc/motd and chmod u-x, go-wx /etc/motd${NC}"
echo
echo "1.7.5 Run these commands to set permissions on '/etc/issue':"
echo "{BLUE}chown root:root /etc/issue and chmod u-x,go-wx /etc/issue${NC}"
echo 
echo "1.7.6 Run these commands to set permissions on '/etc/issue.net':"
echo "${BLUE}chmod root:root /etc/issue.net and chmod u-x,go-wx /etc/issue.net${NC}"
echo
echo "${MG}1.8 GNOME Display Manager${NC}"
echo "1.8.1 To remove the 'gdm' run this command:"
echo "${BLUE}dnf remove gdm${NC}"
echo
echo "1.8.2 Edit '/etc/dconf/profile/gdm' and add these following:"
echo "${BLUE}user-db:user, system-db:gdm, file-db:/usr/share/gdm/greeter-dconf-defaults${NC}"
echo "Edit '/etc/dconf/db/gdm.d/' and add the following:"
echo "${BLUE}[org/gnome/login-screen, banner-message-enable=true, banner-message-text= <banner meassage>${NC}"
echo "Lastly to run:"
echo "${BLUE}dconf update${NC}"
echo
echo "1.8.3 Edit '/etc/dconf/profile/gdm' and add these following:"
echo "${BLUE}user-db:user, system-db:gdm, file-db: /usr/share/gdm/greeter-dconf-defaults${NC}"
echo "Edit '/etc/dconf/db/gdm.d/' and add the following:"
echo "${BLUE}[org/gnome/login-screen] Do not show the user list, disable-user-list=true${NC}"
echo "Lastly to run:"
echo "${BLUE}dconf update${NC}"
echo 
echo "1.8.4 Edit '/etc/gdm/custom.conf'and remove:"
echo "${BLUE}Enable=true${NC} line"
echo 
echo "1.8.5 Ensure all automatic mounting medias are disabled for GNOME users"
echo "${BLUE}Automount=false, Automount-open=false${NC}"
echo "3. To apply the changes, run:"
echo "${BLUE}dconf update${NC}"
echo
echo "1.9 Ensure updates, patches, and additional security software are installed"
echo "1.9 To update the packages, run:"
echo "${BLUE}dnf update${NC}"
echo
echo "1.10 Ensure system-wide crypto policy is not legacy"
echo "1.10 To change the system-wide crypto policy, run:"
echo "${BLUE}update-crypto-policies --set <CRYPTO POLICY>${NC}"

echo
echo $'\e[1;33m'2 Services$'\e[0m'
echo --------------------------------------------------------------------------------------
echo $'\e[1;35m'2.1 inetd Services$'\e[0m'
#2.1.1
echo "2.1.1 Ensure xinetd is not installed"
echo "Run the follwing command to remove xinetd:"
echo $'\e[1;34m'apt purge xinetd$'\e[0m'
echo

#2.1.2
echo "2.1.1 Ensure openbsd-inetd is not installed"
echo "Run the follwing command to uninstall openbsd-inetd:"
echo $'\e[1;34m'apt purge openbsd-inetd$'\e[0m'
echo

echo $'\e[1;35m'2.2 Special Purpose Services$'\e[0m'
echo "2.2.1 Time Synchronization"
#2.2.1.1
echo "2.2.1.1 Ensure time synchronization is in use"
echo "Run the following command to install chrony:"
echo $'\e[1;34m'atp install chrony$'\e[0m'
echo "Run the following command to install ntp:"
echo $'\e[1;34m'atp install ntp$'\e[0m'
echo

#2.2.1.3
echo "2.2.1.3 Ensure chrony is configured"
echo "Add or edit server or pool lines to /etc/chrony.conf as appropriate:"
echo $'\e[1;34m'server \<remote-server\>$'\e[0m'
echo

#2.2.1.4
echo "2.2.1.4 Ensure ntp is configured"
echo "Add or edit restrict lines in /etc/ntp.conf to match the following:"
echo $'\e[1;34m'restrict -4 default kod nomodify notrap nopeer noquery$'\e[0m'
echo $'\e[1;34m'restrict -6 default kod nomodify notrap nopeer noquery$'\e[0m'
echo "Add or edit server or pool lines to /etc/ntp.conf as appropriate:"
echo $'\e[1;34m'server \<remote-server\>$'\e[0m'
echo "Configure ntp to run as the ntp user by adding or editing the /etc/init.d/ntp file:"
echo $'\e[1;34m'RUNASUSER=ntp$'\e[0m'
echo

#2.2.2
echo "2.2.2 Ensure X Window System is not installed"
echo "Run the following command to remove the X Windows System packages:"
echo $'\e[1;34m'apt purge xserver-xorg*$'\e[0m'
echo

#2.2.3
echo "2.2.3 Ensure Avahi Server is not enabled"
echo "Run the following command to disable avahi-daemon:"
echo $'\e[1;34m'systemctl --now disable avahi-daemon$'\e[0m'
echo

#2.2.4
echo "2.2.4 Ensure CUPS is not enabled"
echo "Run the following command to disable cups:"
echo $'\e[1;34m'systemctl --now disable cups$'\e[0m'
echo

#2.2.5
echo "2.2.5 Ensure DHCP Server is not enabled"
echo "Run the following command to disable dhcpd:"
echo $'\e[1;34m'systemctl --now disable isc-dhcp-server$'\e[0m'
echo $'\e[1;34m'systemctl --now disable isc-dhcp-server6$'\e[0m'
echo

#2.2.6
echo "2.2.6 Ensure LDAP Server is not enabled"
echo "Run the following command to disable slapd:"
echo $'\e[1;34m'systemctl --now disable slapd$'\e[0m'
echo

#2.2.7
echo "2.2.7 Ensure NFS and RPC are not enabled"
echo "Run the following command to disable nfs and rpcbind:"
echo $'\e[1;34m'systemctl --now disable nfs-server$'\e[0m'
echo $'\e[1;34m'systemctl --now disable rpcbind$'\e[0m'
echo

#2.2.8
echo "2.2.8 Ensure DNS Server is not enabled"
echo "Run the following command to disable DNS server:"
echo $'\e[1;34m'systemctl --now disable bind9$'\e[0m'
echo

#2.2.9
echo "2.2.9 Ensure FTP Server is not enabled"
echo "Run the following command to disable vsftpd:"
echo $'\e[1;34m'systemctl --now disable vsftpd$'\e[0m'
echo

#2.2.10
echo "2.2.10 Ensure HTTP Server is not enabled"
echo "Run the following command to disable apache:"
echo $'\e[1;34m'systemctl --now disable apache2$'\e[0m'
echo

#2.2.11
echo "2.2.11 Ensure email services are not enabled"
echo "Run the following command to disable dovecot:"
echo $'\e[1;34m'systemctl --now disable dovecot$'\e[0m'
echo

#2.2.12
echo "2.2.12 Ensure Samba is not enabled"
echo "Run the following command to disable Samba:"
echo $'\e[1;34m'systemctl --now disable smbd$'\e[0m'
echo

#2.2.13
echo "2.2.13 Ensure HTTP Proxy Server is not enabled"
echo "Run the following command to disable squid:"
echo $'\e[1;34m'systemctl --now disable squid$'\e[0m'
echo

#2.2.14
echo "2.2.14 Ensure SNMP Server is not enabled"
echo "Run the following command to disable snmpd:"
echo $'\e[1;34m'systemctl --now disable snmpd$'\e[0m'
echo

#2.2.15
echo "2.2.15 Ensure mail transfer agent is configured for local-only mode"
echo "Edit /etc/exim4/update-exim4.conf and or modify following lines to look like the lines below:"
echo $'\e[1;34m'dc_eximconfig_configtype='local'$'\e[0m'
echo $'\e[1;34m'dc local interfaces='127.0.0.1 ; ::1'$'\e[0m'
echo $'\e[1;34m'dc readhost=''$'\e[0m'
echo $'\e[1;34m'dc_relay_domains=''$'\e[0m'
echo $'\e[1;34m'dc minimaldns='false'$'\e[0m'
echo $'\e[1;34m'dc_relay_nets=''$'\e[0m'
echo $'\e[1;34m'dc smarthost=''$'\e[0m'
echo $'\e[1;34m'dc_use_split_config='false'$'\e[0m'
echo $'\e[1;34m'dc hide mailname=''$'\e[0m'
echo $'\e[1;34m'dc_mailname_in_oh='true'$'\e[0m'
echo $'\e[1;34m'dc_localdelivery='mail_spool'$'\e[0m'
echo "Run the following command to restart exim4:"
echo $'\e[1;34m'systemctl restart exim4$'\e[0m'
echo

#2.2.16
echo "2.2.16 Ensure rsync service is not enabled"
echo "Run the following command to disable rsync:"
echo $'\e[1;34m'systemctl --now disable rsync$'\e[0m'
echo

#2.2.17
echo "2.2.17 Ensure NIS Server is not enabled"
echo "Run the following command to disable nis:"
echo $'\e[1;34m'systemctl --now disable nis$'\e[0m'
echo

echo $'\e[1;35m'2.3 Service Clients$'\e[0m'
#2.3.1
echo "2.3.1 Ensure NIS Client is not installed"
echo "Run the following command to uninstall nis:"
echo $'\e[1;34m'apt purge nis$'\e[0m'
echo

#2.3.2
echo "2.3.2 Ensure rsh client is not installed"
echo "Run the following command to uninstall rsh:"
echo $'\e[1;34m'apt purge rsh-client$'\e[0m'
echo

#2.3.3
echo "2.3.3 Ensure talk client is not installed"
echo "Run the following command to uninstall talk:"
echo $'\e[1;34m'apt purge talk$'\e[0m'
echo

#2.3.4
echo "2.3.4 Ensure telnet client is not installed"
echo "Run the following command to uninstall telnet:"
echo $'\e[1;34m'apt purge telnet$'\e[0m'
echo

#2.3.5
echo "2.3.5 Ensure LDAP Client is not installed"
echo "Run the following command to uninstall ldap-utils:"
echo $'\e[1;34m'apt purge ldap-utils$'\e[0m'
echo

