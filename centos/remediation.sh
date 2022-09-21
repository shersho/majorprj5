#!/bin/bash
tput clear
YELLOW=$'\033[0;33m'
RED=$'\033[0;31m'
NC=$'\033[0m'
GREEN=$'\033[0;32m'
MG=$'\33[1;35m'
BLUE=$'\33[1;34m'

purple=`echo -en "\e[35m"`
lightaqua=`echo -en "\e[96m"`
lightpurple=`echo -en "\e[95m"`
lightred=`echo -en "\e[91m"`
lightgreen=`echo -en "\e[92m"`
default=`echo -en "\e[39m"`
lightblue=`echo -en "\e[94m"`
bold=$(tput bold)
normal=$(tput sgr0)
lightyellow=`echo -en "\e[93m"`

date=$(date +"%d-%m-%Y")
echo $'\e[1;34m'Major Project $date$'\e[0m'
echo ---------------------------------------------------------------------------------------
echo $'\e[1;31m'Remediation$'\e[0m'
echo ---------------------------------------------------------------------------------------
echo
echo "${YELLOW}${bold}1 Initial Setup${NC}"
echo "${MG}1.1 Filesystem Configuration${NC}"
echo "${YELLOW}[+]	1.1.1 Disable Unused File${NC}"
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

echo "${YELLOW}[+]	1.1.2 Configure /tmp${NC}"
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
echo "${YELLOW}[+]	1.1.3 Configure /var${NC}"
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
echo "${YELLOW}[+]	1.1.4 Configure /var/tmp${NC}"
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
echo "${YELLOW}[+]	1.1.5 Configure /var/log${NC}"
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
echo "${YELLOW}[+]	1.1.6 Configure /var/log/audit${NC}"
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
echo "${YELLOW}[+]	1.1.7 Configure /home${NC}"
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
echo "${YELLOW}[+]	1.1.8 Configure /dev/shm${NC}"
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
echo "${MG} 1.6 Mandatory Access Control ${NC}"
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
echo "${MG}Section 1.7 Command Line Warning BAnners${NC}"
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
echo ---------------------------------------------------------------------------------------
echo $'\e[1;33m'2 Services$'\e[0m'
echo ---------------------------------------------------------------------------------------
echo $'\e[1;35m'2.1 Time Synchronization$'\e[0m'
#2.1.1
echo "2.1.1 Ensure time synchronization"
echo "Run the follwing command to install chrony:"
echo $'\e[1;34m'dnf install chrony$'\e[0m'
echo
#2.1.2
echo "2.1.2 Ensure chrony is configured"
echo "Run the follwing command to add or edit server or pool lines to /etc/chrony.conf as appropriate:"
echo $'\e[1;34m'server \<remote-server\>$'\e[0m'
echo "Run the follwing command to add or edit the OPTIONS in /etc/sysconfig/chronyd to include '-u chrony':"
echo $'\e[1;34m'OPTIONS\="-u chrony"$'\e[0m'
echo

echo $'\e[1;35m'2.2 Special Purpose Services$'\e[0m'
#2.2.1
echo "2.2.1 Ensure xinetd is not installed"
echo "Run the following command to verify xinetd is not installed:"
echo $'\e[1;34m'dnf remove xinetd$'\e[0m'
echo
#2.2.2
echo "2.2.2 Ensure xorg-x11-server-commmon is not installed"
echo "Run the following command to verify X Windows Server is not installed:"
echo $'\e[1;34m'dnf remove xorg-x11-server-common$'\e[0m'
echo
#2.2.3
echo "2.2.3 Ensure Avahi Server is not installed"
echo "Run the following commands to stop, mask and remove avahi-autoipd and avahi:"
echo $'\e[1;34m'systemctl stop avahi-daemon.socket avahi-daemon.service$'\e[0m'
echo $'\e[1;34m'dnf remove avahi-autoipd avahi$'\e[0m'
echo
#2.2.4
echo "2.2.4 Ensure CUPS is not installed"
echo "Run the following command to remove cups:"
echo $'\e[1;34m'dnf remove cups$'\e[0m'
echo
#2.2.5
echo "2.2.5 Ensure DHCP is not installed"
echo "Run the following command to remove dhcp:"
echo $'\e[1;34m'dnf remove dhcp-server$'\e[0m'
echo
#2.2.6
echo "2.2.6 Ensure DNS is not installed"
echo "Run the following command to remove bind:"
echo $'\e[1;34m'dnf remove bind$'\e[0m'
echo
#2.2.7
echo "2.2.7 Ensure FTP Server is not installed"
echo "Run the following command to remove ftp:"
echo $'\e[1;34m'dnf remove ftp$'\e[0m'
echo
#2.2.8
echo "2.2.8 Ensure VSFTP Server is not installed"
echo "Run the following command to remove vsftpd:"
echo $'\e[1;34m'dnf remove vsftpd$'\e[0m'
echo
#2.2.9
echo "2.2.9 Ensure TFTP Server is not installed"
echo "Run the following command to remove tftp-server:"
echo $'\e[1;34m'dnf remove tftp-server$'\e[0m'
echo
#2.2.10
echo "2.2.10 Ensure a web server is not installed"
echo "Run the following command to remove httpd and nginx:"
echo $'\e[1;34m'dnf remove httpd nginx$'\e[0m'
echo
#2.2.11
echo "2.2.11 Ensure IMAP and POP3 is not installed"
echo "Run the following command to remove dovecot and cyrus-imapd:"
echo $'\e[1;34m'dnf remove dovecot cyrus-imapd$'\e[0m'
echo
#2.2.12
echo "2.2.12 Ensure Samba is not installed"
echo "Run the following command to remove samba:"
echo $'\e[1;34m'dnf remove samba$'\e[0m'
echo
#2.2.13
echo "2.2.13 Ensure HTTP Proxy Server is not installed"
echo "Run the following command to remove the squid package:"
echo $'\e[1;34m'dnf remove squid$'\e[0m'
echo
#2.2.14
echo "2.2.14 Ensure net-snmp is not installed"
echo "Run the following command to remove net-snmpd:"
echo $'\e[1;34m'dnf remove net-snmp$'\e[0m'
echo
#2.2.15
echo "2.2.15 Ensure NIS server is not installed"
echo "Run the following command to remove ypserv:"
echo $'\e[1;34m'dnf remove ypserv$'\e[0m'
echo
#2.2.16
echo "2.2.16 Ensure telnet-server is not installed"
echo "Run the following command to remove the telnet-server package:"
echo $'\e[1;34m'dnf remove telnet-server$'\e[0m'
echo
#2.2.17
echo "2.2.17 Ensure mail transfer agent is configured for local-only mode"
echo "Edit /etc/postfix/main.cf and add the following line to the RECEIVING MAIL section. If the line already exists, change it to look like the line below:"
echo $'\e[1;34m'inet_interfaces = loopback-only$'\e[0m'
echo "Run the following command to restart postfix:"
echo $'\e[1;34m'systemctl restart postfix$'\e[0m'
echo
#2.2.18
echo "2.2.18 Ensure nfs-utils is not installed or the nfs-server service is masked"
echo "Run the following command to remove nfs-utils:"
echo $'\e[1;34m'dnf remove nfs-utils$'\e[0m'
echo OR
echo "If the nfs-package is required as a dependency, run the following command to stop and mask the nfs-server service:"
echo $'\e[1;34m'systemctl --now mask nfs-server$'\e[0m'
echo
#2.2.19
echo "2.2.19 Ensure rpcbind is not installed or the rpcbind services are masked"
echo "Run the following command to remove rpcbind:"
echo $'\e[1;34m'dnf remove rpcbind$'\e[0m'
echo OR
echo "If the rpcbind package is required as a dependency, run the following command to stop and mask the rpcbind and rpcbind.socket services:"
echo $'\e[1;34m'systemctl --now mask rpcbind$'\e[0m'
echo $'\e[1;34m'systemctl --now mask rpcbind.socket$'\e[0m'
echo

#2.2.20
echo "2.2.20 Ensure rsync is not installed or the rsyncd service is masked"
echo "2.2.18 Ensure nfs-utils is not installed or the nfs-server service is masked"
echo "Run the following command to remove rsync package:"
echo $'\e[1;34m'dnf remove rsync$'\e[0m'
echo OR
echo "Run the following command to mask the rsyncd service"
echo $'\e[1;34m'systemctl --now mask rsyncd$'\e[0m'
echo

echo $'\e[1;35m'2.3 Service Clients$'\e[0m'
#2.3.1
echo "2.3.1 Ensure NIS Client is not installed"
echo "Run the following command to remove the ypbind package:"
echo $'\e[1;34m'dnf remove ypbind$'\e[0m'
echo
#2.3.2
echo "2.3.2 Ensure rsh client is not installed"
echo "Run the following command to remove the rsh package:"
echo $'\e[1;34m'dnf remove rsh$'\e[0m'
echo
#2.3.3
echo "2.3.3 Ensure talk client is not installed"
echo "Run the following command to remove the talk package:"
echo $'\e[1;34m'dnf remove talk$'\e[0m'
echo
#2.3.4
echo "2.3.4 Ensure telnet client is not installed"
echo "Run the following command to remove the telnet package:"
echo $'\e[1;34m'dnf remove telnet$'\e[0m'
echo
#2.3.5
echo "2.3.5 Ensure LDAP client is not installed"
echo "Run the following command to remove the openldap-clients package:"
echo $'\e[1;34m'dnf remove openldap-clients$'\e[0m'
echo
#2.3.6
echo "2.3.6 Ensure TFTP client is not installed"
echo "Run the following command to remove tftp:"
echo $'\e[1;34m'dnf remove tftp$'\e[0m'
echo
#2.4
echo "2.4 Ensure nonessential services are removed or masked"
echo "Run the following command to remove the package containing the service:"
echo $'\e[1;34m'dnf remove \<package_name\>$'\e[0m'
echo OR
echo "If the required packages have a dependency, run the following command to stop and mask the service:"
echo $'\e[1;34m'systemctl --now mask \<service_name\>$'\e[0m'
echo

{
echo " "
}

{
	echo ---------------------------------------------------------------------------------------
}

{
echo "${lightyellow}${bold}3 Network Configurations${normal}${default}"
}

{
        echo ---------------------------------------------------------------------------------------
}

{
echo "${lightpurple}${bold}3.1 Disable unused network protocols and devices${normal}${default}"
}

{
echo "3.1.1 Verify if IPv6 is enabled on the system"
echo "To disable IPv6 through the GRUB2 config, run the following command:"
echo "${lightblue}${bold}grubby --update-kernel ALL --args 'ipv6.disable=1'${default}${normal}"
echo "OR"
echo "To disable IPv6 through sysctl settings, set the following parameters:"
echo "${lightblue}${bold}printf '"
echo "net.ipv6.conf.all.disable_ipv6 = 1" 
echo "net.ipv6.conf.default.disable_ipv6 = 1"
echo "' >> /etc/sysctl.d/60-disable_ipv6.conf${default}${normal}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightblue}${bold}{"
echo "sysctl -w net.ipv6.conf.all.disable_ipv6=1 "
echo "sysctl -w net.ipv6.conf.default.disable_ipv6=1 "
echo "sysctl -w net.ipv6.route.flush=1"
echo "}${default}${normal}"
}

{
echo " "
}

{
echo "3.1.2 Ensure SCTP is disabled"
echo "Edit or create a file in the /etc/modprobe.d/ directory ending in .conf:"
echo "${lightblue}${bold}printf 'install sctp /bin/true' >> /etc/modprobe.d/sctp.conf${default}${normal}"
}

{
echo " "
}

{
echo "3.1.3 Ensure DCCP is disabled"
echo "Edit or create a file in the /etc/modprobe.d/ directory ending in .conf:"
echo "${lightblue}${bold}printf 'install dccp /bin/true' >> /etc/modprobe.d/dccp.conf${default}${normal}"
}

{
echo " "
}

{
echo "3.1.4 Ensure wireless interfaces are disabled"
echo "Run the following script to disable any wireless interfaces(Remember to convert single quotation to double):"
echo "${lightred}Convert all (#) to ($) except for the first line of the script${default}" 
echo "${lightblue}${bold}#!/usr/bin/env bash"
echo "{"
echo "if command -v nmcli >/dev/null 2>&1 ;"
echo "then"
echo "	nmcli radio all off"
echo "else"
echo "	if [ -n '#(find /sys/class/net/*/ -type d -name wireless)' ];"
echo "	then"
echo "		mname=#(for driverdir in #(find /sys/class/net/*/ -type d -name "
echo "wireless | xargs -0 dirname); do basename '#(readlink -f '#driverdir'/device"
echo "/driver/module)';done | sort -u)"
echo "		for dm in #mname;"
echo "		do"
echo "			echo 'install $dm /bin/true' >> /etc/modprobe.d/"
echo "disable_wireless.conf"
echo "		done"
echo "	fi"
echo "fi"
echo "}${default}${normal}"
}

{
echo " "
}

{
echo "${lightpurple}${bold}3.2 Network Parameters (Host Only)${normal}${default}"
}

{
echo "3.2.1 Ensure IP forwarding is disabled"
echo "Set the following parameter in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightblue}${bold}printf '"
echo "net.ipv4.ip_forward = 0"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf"
echo "printf '"
echo "net.ipv6.conf.all.forwarding = 0"
echo "' >> /etc/sysctl.d/60-netipv6_sysctl.conf${default}${normal}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightblue}${bold}{sysctl -w net.ipv4.ip_forward=0" 
echo " sysctl -w net.ipv4.route.flush=1" 
echo " sysctl -w net.ipv6.conf.all.forwarding=0" 
echo " sysctl -w net.ipv6.route.flush=1}${default}${normal}"
}

{
echo " "
}

{
echo "3.2.2 Ensure packet redirect sending is disabled"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightblue}${bold}printf '"
echo "net.ipv4.conf.all.send_redirects = 0"
echo "net.ipv4.conf.default.send_redirects = 0"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}${normal}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightblue}${bold}{sysctl -w net.ipv4.conf.all.send_redirects=0"
echo "sysctl -w net.ipv4.conf.default.send_redirects=0"
echo "sysctl -w net.ipv4.route.flush=1}${default}${normal}"
}

{
echo " "
}

{
echo "${lightpurple}${bold}3.3 Network Parameters (Host and Router)${normal}${default}"
}

{
echo "3.3.1 Ensure source routed packets are not accepted"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightblue}${bold}printf '"
echo "net.ipv4.conf.all.accept_source_route = 0"
echo "net.ipv4.conf.default.accept_source_route = 0"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf"
echo "printf '"
echo "net.ipv6.conf.all.accept_source_route = 0"
echo "net.ipv6.conf.default.accept_source_route = 0"
echo "' >> /etc/sysctl.d/60-netipv6_sysctl.conf${default}${normal}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightblue}${bold}{sysctl -w net.ipv4.conf.all.accept_source_route=0"
echo "sysctl -w net.ipv4.conf.default.accept_source_route=0"
echo "sysctl -w net.ipv4.route.flush=1"
echo "sysctl -w net.ipv6.conf.all.accept_source_route=0"
echo "sysctl -w net.ipv6.conf.default.accept_source_route=0"
echo "sysctl -w net.ipv6.route.flush=1}${default}"
}

{
echo " "
}

{
echo "3.3.2 Ensure ICMP redirects are not accepted"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightblue}${bold}printf '"
echo "net.ipv4.conf.all.accept_redirects = 0"
echo "net.ipv4.conf.default.accept_redirects = 0"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf"
echo "printf '"
echo "net.ipv6.conf.all.accept_redirects = 0"
echo "net.ipv6.conf.default.accept_redirects = 0"
echo "' >> /etc/sysctl.d/60-netipv6_sysctl.conf${default}${normal}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightblue}${bold}{sysctl -w net.ipv4.conf.all.accept_redirects=0"
echo "sysctl -w net.ipv4.conf.default.accept_redirects=0"
echo "sysctl -w net.ipv4.route.flush=1"
echo "sysctl -w net.ipv6.conf.all.accept_redirects=0"
echo "sysctl -w net.ipv6.conf.default.accept_redirects=0"
echo "sysctl -w net.ipv6.route.flush=1}${default}${normal}"
}

{
echo " "
}

{
echo "3.3.3 Ensure secure ICMP redirects are not accepted"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightblue}${bold}printf '"
echo "net.ipv4.conf.all.secure_redirects = 0"
echo "net.ipv4.conf.default.secure_redirects = 0"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}${normal}"
echo "Run the following commands to set the active kernel parameters:"
echo "${lightblue}${bold}{sysctl -w net.ipv4.conf.all.secure_redirects=0"
echo "sysctl -w net.ipv4.conf.default.secure_redirects=0"
echo "sysctl -w net.ipv4.route.flush=1}${default}${normal}"
}

{
echo " "
}

{
echo "3.3.4 Ensure suspicious packets are logged"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightblue}${bold}printf '"
echo "net.ipv4.conf.all.log_martians = 1"
echo "net.ipv4.conf.default.log_martians = 1"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}${normal}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightblue}${bold}{sysctl -w net.ipv4.conf.all.log_martians=1"
echo "sysctl -w net.ipv4.conf.default.log_martians=1"
echo "sysctl -w net.ipv4.route.flush=1}${default}${normal}"
}

{
echo " "
}

{
echo "3.3.5 Ensure broadcast ICMP requests are ignored"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightblue}${bold}printf '"
echo "net.ipv4.icmp_echo_ignore_broadcasts = 1"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}${normal}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightblue}${bold}{sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1"
echo "sysctl -w net.ipv4.route.flush=1}${default}${normal}"
}

{
echo " "
}

{
echo "3.3.6 Ensure bogus ICMP responses are ignored"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightblue}${bold}printf '"
echo "net.ipv4.icmp_ignore_bogus_error_responses = 1"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}${normal}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightblue}${bold}{sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1"
echo "sysctl -w net.ipv4.route.flush=1}${default}${normal}"
}

{
echo " "
}

{
echo "3.3.7 Ensure Reverse Path Filtering is enabled"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightblue}${bold}printf '"
echo "net.ipv4.conf.all.rp_filter = 1"
echo "net.ipv4.conf.default.rp_filter = 1"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}${normal}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightblue}${bold}{sysctl -w net.ipv4.conf.all.rp_filter=1"
echo "sysctl -w net.ipv4.conf.default.rp_filter=1"
echo "sysctl -w net.ipv4.route.flush=1}${default}${normal}"
}

{
echo " "
}

{
echo "3.3.8 Ensure TCP SYN Cookies is enabled"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightblue}${bold}printf '"
echo "net.ipv4.tcp_syncookies = 1"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}${normal}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightblue}${bold}{sysctl -w net.ipv4.tcp_syncookies=1"
echo "sysctl -w net.ipv4.route.flush=1}${default}${normal}"
}

{
echo " "
}

{
echo "3.3.9 Ensure IPv6 router advertisements are not accepted"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightblue}${bold}printf '"
echo "net.ipv6.conf.all.accept_ra = 1"
echo "net.ipv6.conf.default.accept_ra = 1"
echo "' >> /etc/sysctl.d/60-netipv6_sysctl.conf${default}${normal}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightblue}${bold}{sysctl -w net.ipv6.conf.all.accept_ra=1"
echo "sysctl -w net.ipv6.conf.default.accept_ra=1"
echo "sysctl -w net.ipv6.route.flush=1}${default}${normal}"
}

{
echo " "
}

{
echo "${lightpurple}${bold}3.4 Firewall Configuration${normal}${default}"
}

{
echo "${YELLOW}[+]	3.4.1 Configure firewalld${normal}${default}"
}

{
echo "3.4.1.1 Ensure firewalld is installed"
echo "Run the following command to install FirewallD and iptables :"
echo "${lightblue}${bold}dnf install firewalld iptables${default}${normal}"
}

{
echo " "
}

{
echo "3.4.1.2 Ensure iptables-services not installed with firewalld"
echo "Run the following commands to stop the services included in the iptables-services package and remove the iptables-services package"
echo "${lightblue}${bold}systemctl stop iptables"
echo "systemctl stop ip6tables"
echo "dnf remove iptables-services${default}${normal}"
}

{
echo " "
}

{
echo "3.4.1.3 Ensure nftables either not installed or masked with firewalld"
echo "Run the following command to remove nftables :"
echo "${lightblue}${bold}dnf remove nftables${default}${normal}"
echo "OR"
echo "Run the following command to stop and mask nftables "
echo "${lightblue}${bold}systemctl --now mask nftables${default}${normal}"
}

{
echo " "
}

{
echo "3.4.1.4 Ensure firewalld service enabled and running"
echo "Run the following command to unmask firewalld"
echo "${lightblue}${bold}systemctl unmask firewalld${default}${normal}"
echo "Run the following command to enable and start firewalld"
echo "${lightblue}${bold}systemctl --now enable firewalld${default}${normal}"
}

{
echo " "
}

{
echo "3.4.1.5 Ensure firewalld default zone is set"
echo "Run the following command to set the default zone:"
echo "${lightblue}${bold}firewall-cmd --set-default-zone=<NAME_OF_ZONE>${default}${normal}"
echo "Example:"
echo "${lightblue}${bold}firewall-cmd --set-default-zone=public${default}${normal}"
}

{
echo " "
}

{
echo "3.4.1.6 Ensure network interfaces are assigned to appropriate zone"
echo "Run the following command to assign an interface to the approprate zone."
echo "${lightblue}${bold}firewall-cmd --zone=<Zone NAME> --change-interface=<INTERFACE NAME>${default}${normal}"
echo "Example:"
echo "${lightblue}${bold}firewall-cmd --zone=customezone --change-interface=eth0${default}${normal}"
}

{
echo " "
}

{
echo "3.4.1.7 Ensure firewalld drops unnecessary services and ports"
echo "Run the following command to remove an unnecessary service:"
echo "${lightblue}${bold}firewall-cmd --remove-service=<service>${default}${normal}"
echo "Example:"
echo "${lightblue}${bold}firewall-cmd --remove-service=cockpit${default}${normal}"
echo "Run the following command to remove an unnecessary port:"
echo "${lightblue}${bold}firewall-cmd --remove-port=<port-number>/<port-type>${default}${normal}"
echo "Example:"
echo "${lightblue}${bold}firewall-cmd --remove-port=25/tcp${default}${normal}"
echo "Run the following command to make new settings persistent:"
echo "${lightblue}${bold}firewall-cmd --runtime-to-permanent${default}${normal}"
}

{
echo " "
}

{
echo "${YELLOW}[+]	3.4.2 Configure nftables${default}${normal}"
}

{
echo "3.4.2.1 Ensure nftables is installed"
echo "Run the following command to install nftables"
echo "${lightblue}${bold}dnf install nftables${default}${normal}"
}

{
echo "3.4.2.2 Ensure firewalld is either not installed or masked with nftables"
echo "Run the following command to remove firewalld"
echo "${lightblue}${bold}dnf remove firewalld${default}${normal}"
echo "OR"
echo "Run the following command to stop and mask firewalld"
echo "${lightblue}${bold}systemctl --now mask firewalld${default}${normal}"
}

{
echo " "
}

{
echo "3.4.2.3 Ensure iptables-services not installed with nftables"
echo "Run the following commands to stop the services included in the iptables-services package and remove the iptables-services package"
echo "${lightblue}${bold}systemctl stop iptables"
echo "systemctl stop ip6tables"
echo "dnf remove iptables-services${default}${normal}"
}

{
echo " "
}

{
echo "3.4.2.4 Ensure iptables are flushed with nftables"
echo "Run the following commands to flush iptables:"
echo "For iptables:"
echo "${lightblue}${bold}iptables -F${default}${normal}"
echo "For ip6tables:"
echo "${lightblue}${bold}ip6tables -F${default}${normal}"
}

{
echo " "
}

{
echo "3.4.2.5 Ensure an nftables table exists"
echo "Run the following command to create a table in nftables"
echo "${lightblue}${bold}nft create table inet <table name>${default}${normal}"
echo "Example:"
echo "${lightblue}${bold}nft create table inet filter${default}${normal}"
}

{
echo " "
}

{
echo "3.4.2.6 Ensure nftables base chains exist"
echo "Run the following command to create the base chains:"
echo "${lightblue}${bold}nft create chain inet <table name> <base chain name> { type filter hook <(input|forward|output)> priority 0 \; }${default}${normal}"
echo "Example:"
echo "${lightblue}${bold}nft create chain inet filter input { type filter hook input priority 0 \; }"
echo "nft create chain inet filter forward { type filter hook forward priority 0 \; }"
echo "nft create chain inet filter output { type filter hook output priority 0 \; }${default}${normal}"
}

{
echo " "
}

{
echo "3.4.2.7 Ensure nftables loopback traffic is configured"
echo "Run the following commands to implement the loopback rules:"
echo "${lightblue}${bold}nft add rule inet filter input iif lo accept"
echo "nft create rule inet filter input ip saddr 127.0.0.0/8 counter drop${default}${normal}"
echo "IF IPv6 is enabled:"
echo "Run the following command to implement the IPv6 loopback rules:"
echo "${lightblue}${bold}nft add rule inet filter input ip6 saddr ::1 counter drop${default}${normal}"
}

{
echo " "
}

{
echo "3.4.2.8 Ensure nftables outbound and established connections are configured"
echo "Configure nftables in accordance with site policy. The following commands will implement a policy to allow all outbound connections and all established connections:"
echo "${lightblue}${bold}nft add rule inet filter input ip protocol tcp ct state established accept"
echo "nft add rule inet filter input ip protocol udp ct state established accept"
echo "nft add rule inet filter input ip protocol icmp ct state established accept"
echo "nft add rule inet filter output ip protocol tcp ct state new,related,established accept"
echo "nft add rule inet filter output ip protocol udp ct state new,related,established accept"
echo "nft add rule inet filter output ip protocol icmp ct state new,related,established accept${default}${normal}"
}

{
echo " "
}

{
echo "3.4.2.9 Ensure nftables default deny firewall policy"
echo "Run the following command for the base chains with the input, forward, and output hooks to implement a default DROP policy:"
echo "${lightblue}${bold}nft chain <table family> <table name> <chain name> { policy drop \; }${default}${normal}"
echo "Example:"
echo "${lightblue}${bold}nft chain inet filter input { policy drop \; }"
echo "nft chain inet filter forward { policy drop \; }"
echo "nft chain inet filter output { policy drop \; }${default}${normal}"
}

{
echo " "
}

{
echo "3.4.2.10 Ensure nftables service is enabled"
echo "Run the following command to enable the nftables service:"
echo "${lightblue}${bold}systemctl enable nftables${default}${normal}"
}

{
echo " "
}

{
echo "3.4.2.11 Ensure nftables rules are permanent"
echo "Edit the /etc/sysconfig/nftables.conf file and un-comment or add a line with include <Absolute path to nftables rules file> for each nftables file you want included in the nftables ruleset on boot:"
echo "${lightblue}${bold}include '/etc/nftables/nftables.rules'${default}${normal}"
}

{
echo " "
}

{
echo "${YELLOW}[+]	3.4.3 Configure iptables${default}"
}

{
echo "3.4.3.1.1 Ensure iptables packages are installed"
echo "Run the following command to install iptables and iptables-services"
echo "${lightblue}${bold}dnf install iptables iptables-services${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.1.2 Ensure nftables is not installed with iptables"
echo "Run the following command to remove nftables :"
echo "${lightblue}${bold}dnf remove nftables${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.1.3 Ensure firewalld is either not installed or masked with iptables"
echo "Run the following command to remove firewalld"
echo "${lightblue}${bold}yum remove firewalld${default}${normal}"
echo "OR"
echo "Run the following command to stop and mask firewalld"
echo "${lightblue}${bold}systemctl --now mask firewalld${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.2.1 Ensure iptables loopback traffic is configured"
echo "Run the following commands to implement the loopback rules:"
echo "${lightblue}${bold}iptables -A INPUT -i lo -j ACCEPT"
echo "iptables -A OUTPUT -o lo -j ACCEPT"
echo "iptables -A INPUT -s 127.0.0.0/8 -j DROP${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.2.2 Ensure iptables outbound and established connections are configured"
echo "Configure iptables in accordance with site policy. The following commands will implement a policy to allow all outbound connections and all established connections:"
echo "${lightblue}${bold}iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "iptables -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "iptables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT"
echo "iptables -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT"
echo "iptables -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.2.3 Ensure iptables rules exist for all open ports"
echo "For each port identified in the audit which does not have a firewall rule establish a proper rule for accepting inbound connections:"
echo "${lightblue}${bold}iptables -A INPUT -p <protocol> --dport <port> -m state --state NEW -j ACCEPT${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.2.4 Ensure iptables default deny firewall policy"
echo "Run the following commands to implement a default DROP policy:"
echo "${lightblue}${bold}iptables -P INPUT DROP"
echo "iptables -P OUTPUT DROP"
echo "iptables -P FORWARD DROP${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.2.5 Ensure iptables rules are saved"
echo "Run the following commands to create or update the /etc/sysconfig/iptables file:"
echo "Run the following command to review the current running iptables configuration:"
echo "${lightblue}${bold}iptables -L${default}${normal}"
echo "Run the following command to save the verified running configuration to the file /etc/sysconfig/iptables :"
echo "${lightblue}${bold}service iptables save"
echo "iptables: Saving firewall rules to /etc/sysconfig/iptables:[OK]${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.2.6 Ensure iptables is enabled and active"
echo "Run the following command to enable and start iptables:"
echo "${lightblue}${bold}systemctl --now enable iptables${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.3.1 Ensure ip6tables loopback traffic is configured"
echo "Run the following commands to implement the loopback rules:"
echo "${lightblue}${bold}ip6tables -A INPUT -i lo -j ACCEPT"
echo "ip6tables -A OUTPUT -o lo -j ACCEPT"
echo "ip6tables -A INPUT -s ::1 -j DROP${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.3.2 Ensure ip6tables outbound and established connections are configured"
echo "Configure iptables in accordance with site policy. The following commands will implement a policy to allow all  outbound connections and all established connections:"
echo "${lightblue}${bold}ip6tables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "ip6tables -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "ip6tables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "ip6tables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT"
echo "ip6tables -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT"
echo "ip6tables -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.3.3 Ensure ip6tables rules exist for all open ports"
echo "For each port identified in the audit which does not have a firewall rule establish a proper rule for accepting inbound connections:"
echo "${lightblue}${bold}ip6tables -A INPUT -p <protocol> --dport <port> -m state --state NEW -j ACCEPT${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.3.4 Ensure ip6tables default deny firewall policy"
echo "Run the following commands to implement a default DROP policy:"
echo "${lightblue}${bold}ip6tables -P INPUT DROP"
echo "ip6tables -P OUTPUT DROP"
echo "ip6tables -P FORWARD DROP${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.3.5 Ensure ip6tables rules are saved"
echo "Run the following commands to create or update the /etc/sysconfig/iptables file:"
echo "Run the following command to review the current running iptables configuration:"
echo "${lightblue}${bold}iptables -L${default}${normal}"
echo "Run the following command to save the verified running configuration to the file /etc/sysconfig/ip6tables :"
echo "${lightblue}${bold}service ip6tables save"
echo "iptables: Saving firewall rules to /etc/sysconfig/ip6tables:[OK]${default}${normal}"
}

{
echo " "
}

{
echo "3.4.3.3.6 Ensure ip6tables is enabled and active"
echo "Run the following command to enable and start ip6tables:"
echo "${lightblue}${bold}systemctl --now enable ip6tables${default}${normal}"
}

echo
echo ---------------------------------------------------------------------------------------
echo $'\e[1;33m'4 Logging and Auditing$'\e[0m'
echo ---------------------------------------------------------------------------------------
echo -e "\e[1;35m4.1 Configure System Accounting \e[0m"
echo -e "\e[0;33m[+]	4.1.1 Ensure auditing is enabled \e[0m"
#4.1.1.1
echo "4.1.1.1 Ensure auditd is installed"
echo "Run the following command to Install auditd:"
echo -e "\e[1;34mdnf install audit \e[0m"
echo""

#4.1.1.2
echo "4.1.1.2 Ensure auditd service is enabled"
echo "Run the following command to enable auditd :"
echo -e "\e[1;34msystemctl --now enable auditd \e[0m"
echo""

#4.1.1.3
echo "4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled"
echo "Run the following command to add audit=1 to GRUB_CMDLINE_LINUX :"
echo -e "\e[1;34mgrubby --update-kernel ALL --args 'audit=1' \e[0m"
echo""

#4.1.1.4
echo "4.1.1.4 Ensure audit_backlog_limit is sufficient"
echo "Run the following command to add audit_backlog_limit=<BACKLOG SIZE> to GRUB_CMDLINE_LINUX:"
echo -e "\e[1;34mgrubby --update-kernel ALL --args 'audit_backlog_limit=<BACKLOG SIZE>' \e[0m"
echo "Example:"
echo -e "\e[1;34mgrubby --update-kernel ALL --args 'audit_backlog_limit=8192' \e[0m"
echo""

echo -e "\e[0;33m[+]	4.1.2 Configure Data Retention \e[0m"

#4.1.2.1
echo "4.1.2.1 Ensure audit log storage size is configured"
echo "Set the following parameter in /etc/audit/auditd.conf in accordance with site policy:"
echo -e "\e[1;34mmax_log_file = <MB> \e[0m"
echo ""

#4.1.2.2
echo "4.1.2.2 Ensure audit logs are not automatically deleted"
echo "Set the following parameter in /etc/audit/auditd.conf:"
echo -e "\e[1;34mmax_log_file_action = keep_logs \e[0m"
echo ""

#4.1.2.3
echo "4.1.2.3 Ensure system is disabled when audit logs are full"
echo "Set the following parameters in /etc/audit/auditd.conf:"
echo -e "\e[1;34mspace_left_action = email \naction_mail_acct = root \e[0m"
echo ""

echo -e "\e[0;33m[+]	4.1.3 Configure auditd rules \e[0m"

#4.1.3.1
echo "4.1.3.1 Ensure changes to system administration scope (sudoers) is collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor scope changes for system administrators. Example:"
echo -e "\e[1;34mprintf ' \n-w /etc/sudoers -p wa -k scope \n-w /etc/sudoers.d -p wa -k scope' \n>> /etc/audit/rules.d/50-scope.rules \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo""

#4.1.3.2
echo "4.1.3.2 Ensure actions as another user are always logged"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor elevated privileges."
echo "64 Bit systems:"
echo -e "\e[1;34mprintf ' \n-a always,exit -F arch=b64 -C euid!=uid -F auid!=unset -S execve -k user_emulation \n-a always,exit -F arch=b32 -C euid!=uid -F auid!=unset -S execve -k user_emulation' \n >> /etc/audit/rules.d/50-user_emulation.rules  \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;35maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo""


#4.1.3.3
echo "4.1.3.3 Ensure events that modify the sudo log file are collected"
echo -e "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor events that modify the sudo log file. \nExample:"
echo""

#4.1.3.4
echo "4.1.3.4 Ensure events that modify date and time information are collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor events that modify the sudo log file. \nExample:"
echo -e "\e[1;34mprintf '-a always,exit -F arch=b64 -S adjtimex,settimeofday,clock_settime -k time-change \n-a always,exit -F arch=b32 -S adjtimex,settimeofday,clock_settime -k time-change \n-w /etc/localtime -p wa -k time-change \n' >> /etc/audit/rules.d/50-time-change.rules \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo ""

#4.1.3.5
echo "4.1.3.5 Ensure events that modify the system's network environment are collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor events that modify the system's network environment"
echo "Example:"
echo -e "\e[1;34mprintf '-a always,exit -F arch=b64 -S sethostname,setdomainname -k system-locale \n-a always,exit -F arch=b32 -S sethostname,setdomainname -k system-locale \n-w /etc/issue -p wa -k system-locale \n-w /etc/issue.net -p wa -k system-locale \n-w /etc/hosts -p wa -k system-locale \n-w /etc/sysconfig/network -p wa -k system-locale \n-w /etc/sysconfig/network-scripts/ -p wa -k system-locale \n' >> /etc/audit/rules.d/50-system_local.rules \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo""

#4.1.3.6
echo "4.1.3.6 Ensure use of privileged commands are collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor the use of privileged commands. \nExample:"
echo -e "\e[1;34mbuild_audit_rules() ( \nUID_MIN=\$(awk '/^\s*UID_MIN/{print \$2}' /etc/login.defs) \nAUDIT_RULE_FILE='/etc/audit/rules.d/50-privileged.rules' \nNEW_DATA=() \nfor PARTITION in \$(findmnt -n -l -k -it \$(awk '/nodev/ { print \$2 }' \n/proc/filesystems | paste -sd,) | grep -Pv 'noexec|nosuid' | awk '{print \$1}'); do"
echo -e "readarray -t DATA < <(find '\${PARTITION}' -xdev -perm /6000 -type f | awk"
echo -e "-v UID_MIN=\${UID_MIN} '{print '-a always,exit -F path=' \$1 ' -F perm=x -F"
echo -e "auid>='UID_MIN' -F auid!=unset -k privileged' }')"
echo -e "for ENTRY in '\${DATA[@]}'; do"
echo -e "NEW_DATA+=('\${ENTRY}') \ndone \ndone"
echo -e "readarray &> /dev/null -t OLD_DATA < '\${AUDIT_RULE_FILE}' COMBINED_DATA=( '\${OLD_DATA[@]}' '\${NEW_DATA[@]}' )"
echo -e "printf '%s\n' '\${COMBINED_DATA[@]}' | sort -u > '\${AUDIT_RULE_FILE}' \n) \nbuild_audit_rules \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo""

#4.1.3.7
echo "4.1.3.7 Ensure unsuccessful file access ateempts are collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor unsuccessful file access attempts."
echo "Example:"
echo -e "\e[1;34mUID_MIN=\$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"
echo -e "[ -n \"\${UID_MIN}\" ] && printf \""
echo -e "-a always,exit -F arch=b64 -S creat,open,openat,truncate,ftruncate \nEACCES -F auid>=\${UID_MIN} -F auid!=unset -k access"
echo -e "-a always,exit -F arch=b64 -S creat,open,openat,truncate,ftruncate \nEPERM -F auid>=\${UID_MIN} -F auid!=unset -k access"
echo -e "-a always,exit -F arch=b32 -S creat,open,openat,truncate,ftruncate \nEACCES -F auid>=\${UID_MIN} -F auid!=unset -k access"
echo -e "-a always,exit -F arch=b32 -S creat,open,openat,truncate,ftruncate \nEPERM -F auid>=\${UID_MIN} -F auid!=unset -k access"
echo -e "\" >> /etc/audit/rules.d/50-access.rules \""
echo -e "|| printf \"ERROR: Variable 'UID_MIN' is unset.\"\e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo""


#4.1.3.8
echo "4.1.3.8 Ensure events that modify user/group information are collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor events that modify user/group information."
echo "Example:"
echo -e "\e[1;34mprintf \"\n-w /etc/group -p wa -k identity \n-w /etc/passwd -p wa -k identity \n-w /etc/gshadow -p wa -k identity \n-w /etc/shadow -p wa -k identity \n-w /etc/security/opasswd -p wa -k identity"
echo -e "\" >> /etc/audit/rules.d/50-identity.rules \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo""

#4.1.3.9
echo "4.1.3.9 Ensure events that modify user/group information are collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor discretionary access control permission modification events."
echo "Example:"
echo -e "\e[1;34mUID_MIN=\$(awk '/^\s*UID_MIN/{print \$2}' /etc/login.defs)"
echo -e "[ -n \"\${UID_MIN}\" ] && printf \" \n-a always,exit -F arch=b64 -S chmod,fchmod,fchmodat -F auid>=\${UID_MIN} -F auid!=unset -F key=perm_mod"
echo -e "-a always,exit -F arch=b64 -S chown,fchown,lchown,fchownat -F auid>=\${UID_MIN} -F auid!=unset -F key=perm_mod"
echo -e "-a always,exit -F arch=b32 -S chmod,fchmod,fchmodat -F auid>=\${UID_MIN} -F auid!=unset -F key=perm_mod"
echo -e "-a always,exit -F arch=b32 -S lchown,fchown,chown,fchownat -F auid>=\${UID_MIN} -F auid!=unset -F key=perm_mod"
echo -e "-a always,exit -F arch=b64 -S setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F auid>=\${UID_MIN} -F auid!=unset -F key=perm_mod"
echo -e "-a always,exit -F arch=b32 -S setxattr,lsetxattr,fsetxattr,removexattr,lremovexattr,fremovexattr -F auid>=\${UID_MIN} -F auid!=unset -F key=perm_mod"
echo -e "\" >> /etc/audit/rules.d/50-perm_mod.rules \ " 
echo -e "|| printf \"ERROR: Variable 'UID_MIN' is unset.\" \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo"" 

#4.1.3.10
echo "4.1.3.10 Ensure successful file system mounts are collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor successful file system mounts."
echo "Example"
echo -e "\e[1;34mUID_MIN=\$(awk '/^\s*UID_MIN/{print \$2}' /etc/login.defs)"
echo -e " [ -n \"\${UID_MIN}\" ] && printf \""
echo -e "-a always,exit -F arch=b32 -S mount -F auid>=1000 -F auid!=unset -k mounts"
echo -e "-a always,exit -F arch=b64 -S mount -F auid>=1000 -F auid!=unset -k mounts"
echo -e "\" >> /etc/audit/rules.d/50-perm_mod.rules \ \n|| printf \"ERROR: Variable 'UID_MIN' is unset.\" \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo""

#4.1.3.11
echo "4.1.3.11 Ensure session initiation information is collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor session initiation information."
echo "Example:"
echo -e "\e[1;34mprintf \" \n-w /var/run/utmp -p wa -k session"
echo -e "-w /var/log/wtmp -p wa -k session"
echo -e "-w /var/log/btmp -p wa -k session"
echo -e "\" >> /etc/audit/rules.d/50-session.rules \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo ""

#4.1.3.12
echo "4.1.3.12 Ensure login and logout events are collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor login and logout events."
echo "Example:"
echo -e "\e[1;34mprintf \""
echo -e "-w /var/log/lastlog -p wa -k logins"
echo -e "-w /var/run/faillock -p wa -k logins"
echo -e "\" >> /etc/audit/rules.d/50-login.rules \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo ""

#4.1.3.13
echo "4.1.3.13 Ensure file deletion events by users are collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor file deletion events by users."
echo "Example:"
echo -e "\e[1;34mUID_MIN=\$(awk '/^\s*UID_MIN/{print \$2}' /etc/login.defs)"
echo -e "[ -n \"\${UID_MIN}\" ] && printf \""
echo -e "-a always,exit -F arch=b64 -S rename,unlink,unlinkat,renameat -F auid>=\${UID_MIN} -F auid!=unset -F key=delete"
echo -e "-a always,exit -F arch=b32 -S rename,unlink,unlinkat,renameat -F auid>=\${UID_MIN} -F auid!=unset -F key=delete"
echo -e "\" >> /etc/audit/rules.d/50-delete.rules \""
echo -e "|| printf \"ERROR: Variable 'UID_MIN' is unset.\" \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo ""

#4.1.3.14
echo "4.1.3.14 Ensure events that modify the system's Mandatory Access Controls are collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor events that modify the system's Mandatory Access Controls."
echo "Example:"
echo -e "\e[1;34mprintf \""
echo -e "-w /etc/selinux -p wa -k MAC-policy"
echo -e "-w /usr/share/selinux -p wa -k MAC-policy"
echo -e "\" >> /etc/audit/rules.d/50-MAC-policy.rules \e[0m"  
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo ""

#4.1.3.15
echo "4.1.3.15 Ensure events that modify the system's Mandatory Access Controls are collected"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor successful and unsuccessful attempts to use the chcon command"
echo "Example:"
echo -e "\e[1;34mUID_MIN=\$(awk '/^\s*UID_MIN/{print \$2}' /etc/login.defs)"
echo -e "[ -n \"\${UID_MIN}\" ] && printf \""
echo -e "-a always,exit -F path=/usr/bin/chcon -F perm=x -F auid>=\${UID_MIN} -F auid!=unset -k perm_chng"
echo -e "\" >> /etc/audit/rules.d/50-perm_chng.rules \""
echo -e "|| printf \"ERROR: Variable 'UID_MIN' is unset.\" \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo ""

#4.1.3.16
echo "4.1.3.16 Ensure successful and unsuccessful attempts to use the setfacl command are recorded"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor successful and unsuccessful attempts to use the setfacl command."
echo "Example:"
echo -e "\e[1;34mUID_MIN=\$(awk '/^\s*UID_MIN/{print \$2}' /etc/login.defs)"
echo -e "[ -n \"\${UID_MIN}\" ] && printf \""
echo -e "-a always,exit -F path=/usr/bin/setfacl -F perm=x -F auid>=\${UID_MIN} -F auid!=unset -k perm_chng"
echo -e "\" >> /etc/audit/rules.d/50-priv_cmd.rules \""
echo -e "|| printf \"ERROR: Variable 'UID_MIN' is unset.\" \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo ""

#4.1.3.17
echo "4.1.3.17 Ensure successful and unsuccessful attempts to use the chacl command are recorded"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor successful and unsuccessful attempts to use the chacl command."
echo "Example:"
echo -e "\e[1;34mUID_MIN=\$(awk '/^\s*UID_MIN/{print \$2}' /etc/login.defs)"
echo -e "[ -n \"\${UID_MIN}\" ] && printf \""
echo -e "-a always,exit -F path=/usr/bin/chacl -F perm=x -F auid>=\${UID_MIN} -F auid!=unset -k perm_chng"
echo -e "\" >> /etc/audit/rules.d/50-perm_chng.rules \""
echo -e "|| printf \"ERROR: Variable 'UID_MIN' is unset.\" \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo ""

#4.1.3.18
echo "4.1.3.18 Ensure successful and unsuccessful attempts to use the usermod command are recorded"
echo "Edit or create a file in the /etc/audit/rules.d/ directory, ending in .rules extension, with the relevant rules to monitor successful and unsuccessful attempts to use the usermod command"
echo "Example:"
echo -e "\e[1;34mUID_MIN=\$(awk '/^\s*UID_MIN/{print \$2}' /etc/login.defs)"
echo -e "[ -n \"\${UID_MIN}\" ] && printf \""
echo -e "-a always,exit -F path=/usr/sbin/usermod -F perm=x -F auid>=\${UID_MIN} -F auid!=unset -k usermod"
echo -e "\" >> /etc/audit/rules.d/50-usermod.rules \""
echo -e "|| printf \"ERROR: Variable 'UID_MIN' is unset.\" \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo ""

#4.1.3.19
echo "4.1.3.19 Ensure kernel module loading unloading and modification is collected"
echo -e "\e[1;34mUID_MIN=\$(awk '/^\s*UID_MIN/{print \$2}' /etc/login.defs)"
echo -e "[ -n \"\${UID_MIN}\" ] && printf \""
echo -e "-a always,exit -F arch=b64 -S init_module,finit_module,delete_module,create_module,query_module -F auid>=\${UID_MIN} -F auid!=unset -k kernel_modules"
echo -e "-a always,exit -F path=/usr/bin/kmod -F perm=x -F auid>=\${UID_MIN} -F auid!=unset -k kernel_modules"
echo -e "\" >> /etc/audit/rules.d/50-kernel_modules.rules \""
echo -e "|| printf \"ERROR: Variable 'UID_MIN' is unset.\" \e[0m"
echo "Merge and load the rules into active configuration:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo ""

#4.1.3.20
echo "4.1.3.20 Ensure the audit configuration is immutable"
echo -e "Edit or create the file /etc/audit/rules.d/99-finalize.rules and add the following line at the end of the file:"
echo -e "\e[1;34m-e 2 \e[0m"
echo ""

#4.1.3.21
echo "4.1.3.21 Ensure the running and on disk configuration is the same"
echo "If the rules are not aligned across all three () areas, run the following command to merge and load all rules:"
echo -e "\e[1;34maugenrules --load \e[0m"
echo "Check if reboot is required"
echo -e "\e[1;34mif [[ \$(auditctl -s | grep \"enabled\") =~ \"2\" ]]; then printf \"Reboot required to load rules\"; fi \e[0m"
echo ""

echo -e "\e[1;35m4.2 Configure Logging \e[0m"
echo -e "\e[0;33m[+]	4.2.1 Configure rsyslog \e[0m"

#4.2.1.1
echo "4.2.1.1 Ensure rsyslog is installed (Automated)"
echo -e "Run the following command to install rsyslog :"
echo -e "\e[1;34mdnf install rsyslog \e[0m"
echo ""

#4.2.1.2
echo "4.2.1.2 Ensure rsyslog service is enabled"
echo -e "Run the following command to enable rsyslog :"
echo -e "\e[1;34msystemctl --now enable rsyslog \e[0m"
echo ""

#4.2.1.3
echo "4.2.1.3 Ensure journald is configured to send logs to rsyslog"
echo -e "Edit the /etc/systemd/journald.conf file and add the following line:"
echo -e "\e[1;34mForwardToSyslog=yes \e[0m"
echo "Restart the service:"
echo -e "\e[1;34msystemctl restart rsyslog \e[0m"
echo ""

#4.2.1.4
echo "4.2.1.4 Ensure rsyslog default file permissions are configured"
echo "Edit either /etc/rsyslog.conf or a dedicated .conf file in /etc/rsyslog.d/ and set $FileCreateMode to 0640 or more restrictive:"
echo -e "\e[1;34m$FileCreateMode 0640 \e[0m"
echo "Restart the service:"
echo -e "\e[1;34msystemctl restart rsyslog \e[0m"
echo ""

#4.2.1.5
echo "4.2.1.5 Ensure logging is configured"
echo "Edit the following lines in the /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files as appropriate for your environment."
echo -e "\e[0;31mNOTE\e[0m: The below configuration is shown for example purposes only. Due care should be given to how the organization wish to store log data"
echo -e "\e[1;34m*.emerg                :omusrmsg:*"
echo -e "auth,authpriv.*          /var/log/secure"
echo -e "mail.*                   -/var/log/mail"                        
echo -e "mail.info                /var/log/mail.info"
echo -e "mail.warning             /var/log/mail.warn"
echo -e "mail.err                 /var/log/mail.err"
echo -e "cron.*                   /var/log/cron"
echo -e "*.=warning;*.=err        -/var/log/warn"
echo -e "*.crit                   /var/log/warn"
echo -e "*.*;mail.none;news.none  -/var/log/messages"
echo -e "local0,local1.* \t -/var/log/localmessages"
echo -e "local2,local3.* \t -/var/log/localmessages"
echo -e "local4,local5.* \t -/var/log/localmessages"
echo -e "local6,local7.* \t -/var/log/localmessages \e[0m"
echo "Run the following command to reload the rsyslogd configuration:"
echo -e "\e[1;34msystemctl restart rsyslog \e[0m"
echo ""

#4.2.1.6
echo "4.2.1.6 Ensure rsyslog is configured to send logs to a remote log host"
echo "Edit the /etc/rsyslog.conf and /etc/rsyslog.d/*.conf files and add the following line (where loghost.example.com is the name of your central log host). The target directive may either be a fully qualified domain name or an IP address."
echo -e "\e[1;34m*.* action(type=\"omfwd\" target=\"192.168.2.100\" port=\"514\" protocol=\"tcp\""
echo -e "action.resumeRetryCount=\"100\""
echo -e "queue.type=\"LinkedList\" queue.size=\"1000\") \e[0m"
echo "Run the following command to reload the rsyslogd configuration:"
echo -e "\e[1;34msystemctl restart rsyslog \e[0m"
echo ""

#4.2.1.7
echo "4.2.1.7 Ensure rsyslog is not configured to recieve logs from a remote client"
echo "Should there be any active log server configuration found in the auditing section, modify those file and remove the specific lines highlighted by the audit. Ensure none of the following entries are present in any of /etc/rsyslog.conf or /etc/rsyslog.d/*.conf ."
echo "Old Format:"
echo -e "\e[1;34m\$ModLoad imtcp \n\$InputTCPServerRun \e[0m"
echo "New Format"
echo -e "\e[1;34mmodule(load=\"imtcp\") \ninput(type=\"imtcp\" port=\"514\") \e[0m"
echo "Restart the service:"
echo -e "\e[1;34msystemctl restart rsyslog \e[0m"
echo ""


echo -e "\e[0;33m[+]	4.2.2 Configure journald \e[0m"

#4.2.2.1.1
echo "4.2.2.1.1 Ensure systemd-journal-remote is installed"
echo "Run the following command to install systemd-journal-remote :"
echo -e "\e[1;34mdnf install systemd-journal-remote \e[0m"
echo ""

#4.2.2.1.2
echo "4.2.2.1.2 Ensure systemd-journal-remote is configured"
echo "Edit the /etc/systemd/journal-upload.conf file and ensure the following lines are set per your environment:"
echo -e "\e[1;34mURL=192.168.50.42"
echo -e "ServerKeyFile=/etc/ssl/private/journal-upload.pem"
echo -e "ServerCertificateFile=/etc/ssl/certs/journal-upload.pem"
echo -e "TrustedCertificateFile=/etc/ssl/ca/trusted.pem \e[0m"
echo "Restart the Service"
echo -e "\e[1;34msystemctl restart systemd-journal-upload \e[0m"
echo ""

#4.2.2.1.3
echo "4.2.2.1.3 Ensure systemd-journal-remote is enabled"
echo "Run the following command to enable systemd-journal-remote :"
echo -e "\e[1;34msystemctl --now enable systemd-journal-upload.service \e[0m"
echo ""

#4.2.2.1.4
echo "4.2.2.1.4 Ensure journald is not configured to recieve logs from a remote client"
echo "Run the following command to disable systemd-journal-remote.socket :"
echo -e "\e[1;34msystemctl --now mask systemd-journal-remote.socket \e[0m"
echo ""

#4.2.2.2
echo "4.2.2.2 Ensure journald service is enabled"
echo "By default the systemd-journald service does not have an [Install] section and thus cannot be enabled / disabled. It is meant to be referenced as Requires or Wants by other unit files. As such, if the status of systemd-journald is not static , investigate why."
echo ""

#4.2.2.3
echo "4.2.2.3 Ensure journald is configured to compress large log files"
echo "Edit the /etc/systemd/journald.conf file and add the following line:"
echo -e "\e[1;34mCompress=yes \e[0m"
echo "Restart the service:"
echo -e "\e[1;34msystemctl restart systemd-journal-upload \e[0m"
echo ""

#4.2.2.4
echo "4.2.2.4 Ensure journald is configured to write logfiles to persistent disk"
echo "Edit the /etc/systemd/journald.conf file and add the following line:"
echo -e "\e[1;34mStorage=persistent \e[0m"
echo "Restart the service:"
echo -e "\e[1;34msystemctl restart systemd-journal-upload \e[0m"
echo ""

#4.2.2.5
echo "4.2.2.5 Ensure journald is not configured to send logs to rsyslog"
echo "Edit the /etc/systemd/journald.conf file and ensure that ForwardToSyslog=yes is removed"
echo "Restart the service:"
echo -e "\e[1;34msystemctl restart systemd-journal-upload \e[0m"
echo ""

#4.2.2.6
echo "4.2.2.6 Ensure journald log rotation is configured per site policy"
echo "Review /etc/systemd/journald.conf and verify logs are rotated according to site policy. The settings should be carefully understood as there are specific edge cases and prioritisation of parameters."
echo "The specific parameters for log rotation are:"
echo -e "\e[1;34mSystemMaxUse= \nSystemKeepFree= \nRuntimeMaxUse= \nRuntimeKeepFree= \nMaxFileSec= \e[0m"
echo ""

#4.2.2.7
echo "4.2.2.7 Ensure journald default file permissions configured"
echo "If the default configuration is not appropriate for the site specific requirements, copy /usr/lib/tmpfiles.d/systemd.conf to /etc/tmpfiles.d/systemd.conf and modify as required. Requirements is either 0640 or site policy if that is less restrictive."
echo -e "\e[0;31mAdditional Information \e[0m"
echo -e "See man 5 tmpfiles.d for detailed information on the permission sets for the relevant log files. Further information with examples can be found at \e[3;36mhttps://www.freedesktop.org/software/systemd/man/tmpfiles.d.html \e[0m"
echo ""

#4.2.3
echo "4.2.3 Ensure permissions on all logfiles are configured"
echo "Run the following command to set permissions on all existing log files in /var/log."
echo "Although the command is not destructive, ensure that the output of the audit procedure is captured in the event that the remediation causes issues."
echo -e "\e[1;34mfind /var/log/ -type f -perm /g+wx,o+rwx -exec chmod --changes g-wx,o-rwx "{}" +\e[0m"
echo "If there are services that logs to other locations, ensure that those log files have the appropriate permissions."
echo -e "\e[0;31mAdditional Information \e[0m"
echo "You may also need to change the configuration for your logging software or services for any logs that had incorrect permissions."
echo ""

#4.3
echo "4.3 Ensure logrotate is configured"
echo "Edit /etc/logrotate.conf and /etc/logrotate.d/* to ensure logs are rotated according to site policy."
echo -e "\e[0;31mAdditional Information \e[0m"
echo "If no maxage setting is set for logrotate a situation can occur where logrotate is interrupted and fails to delete rotated log files. It is recommended to set this to a value greater than the longest any log file should exist on your system to ensure that any such log file is removed but standard rotation settings are not overridden"
echo ""

{
echo "---------------------------------------------------------------------------------------"
}

echo $'\e[1;33m'5 Access, Authentication and Authorization$'\e[0m'


{
echo "---------------------------------------------------------------------------------------"
}

echo "${MG}5.1Configure time-based job schedulers${NC}"

echo "5.1.1 To enable cron, run:"
echo "${BLUE}systemctl --now enable crond${NC}"
echo
echo "5.1.2 Run the following commands to set ownership and permission on /etc/crontab:"
echo "${BLUE}chown root:root /etc/crontab, chmod og-rwx /etc/crontab${NC}"
echo
echo "5.1.3 Run the following commands to set ownership and permission on /etc/cron.hourly:"
echo "${BLUE}chown root:root /etc/cron.hourly, chmod og-rwx /etc/cron.hourly${NC}"
echo
echo "5.1.4 Run the following commands to set owndership and permission on /etc/cron.daily:"
echo "${BLUE}chown root:root /etc/cron.daily, chmod og-rwx /etc/cron.daily${NC}"
echo
echo "5.1.5 Run the following commands to set ownership and permission on /etc/cron.weekly:"
echo "${BLUE}chown root:root /etc/cron.weekly, chmod og-rwx /etc/cron.weekly${NC}"
echo
echo "5.1.6 Run the follwing commands to set ownership and permission on /etc/cron.monthly:"
echo "${BLUE}chown root:root /etc/cron.monthly, chmod og-rwx /etc/cron.monthly${NC}"
echo
echo "5.1.7 Run the following commands to set ownership and permission on /etc/cron.d"
echo "${BLUE}chown root:root /etc/cron.d, chmod og-rwx /etc/cron.d${NC}"
echo
echo "5.1.8 Run the following command to remove cron:"
echo "${BLUE}dnf remove cronie${NC}"
echo
echo "5.1.9 Run the following command to remove at:"
echo "${BLUE}dnf remove at${NC}"
echo
echo "${MG}5.2 Configure SSH Server${NC}"
echo "5.2.1 Run the following commands to set ownership and permissions on /etc/sshd/sshd_config:"
echo "${BLUE}chown root:root /etc/ssh/sshd_config, chmod og-rwx /etc/ssh/sshd_config${NC}"
echo
echo "5.2.2 Run the following to set permissions, ownership and group on private SSH host key files:"
echo "${BLUE}find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chmod u-x, g-wx, o-rwx {} \;${NC}"
echo "{BLUE} find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chown root:ssh_keys {} \;"
echo
echo "5.2.3 Run the following to set permissions, ownership and group on the SSH public key:"
echo "${BLUE}find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chmod u-x, go-wx {} \;"
echo "{BLUE} find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec chown root:root {} \;"
echo
echo "5.2.4 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}AllowUsers <userlist>${NC}"
echo "OR"
echo "${BLUE}AllowGroups <grouplist>${NC}"
echo
echo "5.2.5 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}LogLevel VERBOSE${NC}"
echo "OR"
echo "${BLUE}LogLevel INFO${NC}"
echo
echo "5.2.6 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}UsePAM yes${NC}"
echo
echo "5.2.7 Edit the /etc/ssh/sshd_config filw with:"
echo "${BLUE}PermitRootLogin no${NC}"
echo
echo "5.2.8 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}HostBasedAuthentication no${NC}"
echo
echo "5.2.9 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}PermitEmptyPasswords no${NC}"
echo
echo "5.2.10 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}PermitUserEnvironment no${NC}"
echo
echo "5.2.11 Edit the /etc/ssh/sshd_confg file with:"
echo "${BLUE}IgnoreRhosts yes${NC}"
echo
echo "5.2.12 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}X11Forwarding no${NC}"
echo
echo "5.2.13 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}AllowTCPForwarding no${NC}"
echo
echo "5.2.14 Run the following commands:"
echo "${BLUE}sed -ri 's/^\s*(CRYPTO_POLICY\s*=.*) \1/' /etc/sysconfig/ssh${NC}"
echo "${BLUE}systemctl reload sshd${NC}"
echo
echo "5.2.15 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}Banner /etc/issue.net${NC}"
echo
echo "5.2.16 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}MaxAuthTries 4${NC}"
echo
echo "5.2.17 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}maxstartups 10:30:60${NC}"
echo
echo "5.2.18 Edit the /etc/ssh/sshd_config file with:"
echo "${BLUE}MaxSessions 10${NC}"
echo
echo "5.2.19 Edit the /etc/ssh/shhd_config file with:"
echo "${BLUE}LoginGraceTime 60${NC}"
echo
echo "5.2.20 Edit the /etc/ssh/sshd_config file to include:"
echo "${BLUE}ClientAliveInterval 900, ClientAliveMaxCount 0${NC}"
echo
echo "${MG}5.3 Configure priviledge escalation${NC}"
echo "5.3.1 Run the following to install sudo:"
echo "${BLUE}dnf install sudo${NC}"
echo
echo "5.3.2 Edit the /etc/sudoers file with:"
echo "${BLUE}Defaults use_pty${NC}"
echo
echo "5.3.3 Edit the /etc/sudoers file and add the following line:"
echo "${BLUE}Defaults logfile='<PATH TO CUSTOM LOG FILE>'${NC}"
echo
echo "5.3.4 Based on the outcome of the audit, edit to the relevant sudoers"
echo "Remove any line occurence with:"
echo "${BLUE}NOPASSWD${NC}"
echo
echo "5.3.5 Based on the outcome of the audit, edit to the relevant sudoers"
echo "Remove any line occurence with:"
echo "${BLUE}!authenticate${NC}"
echo
echo "5.3.6 Edit the file listed in the audit to be:"
echo "${BLUE}timestamp_timeout= 15minutes or lesser${NC}"
echo
echo "5.3.7 Create and empty group to specify the su command"
echo "Add the following line in /etc/pam.d/su file:"
echo "${BLUE}auth required pam_wheel.so use_uid group=sugroup${NC}"
echo
echo "${MG}5.4 Configure Authselect${NC}"
echo "5.4.1 Run the following command to custom authselect profile:"
echo "${BLUE}authselect create-profile custom-profile -b ssd --symlink-meta${NC}"
echo "Run the following command to select custom authselect profile:"
echo "${BLUE}authselect select custom/<CUSTOM PROFILE NAME> {with-<OPTIONS>}${NC}"
echo
echo "5.4.2 Run the following to include the with-faillock:"
echo "${BLUE}authselect enable-feature with-faillock${NC}"
echo "${BLUE}authselect apply-chaneges${NC}"
echo
echo "${MG}5.5 Configure PAM${NC}"
echo "5.5.1 Edit the /etc/security/pwquality.conf file with:"
echo "${BLUE}minlen=14${NC}"
echo "${BLUE}minclass=4${NC}"
echo
echo "5.5.2 Edit the /etc/security/faillock.conf file with:"
echo "${BLUE}deny = 5${NC}"
echo "${BLUE}unlock_time = 900${NC}"
echo
echo "5.5.3 Edit the /etc/authselect/pam_pwhistory file to include the remember option${NC}"
echo
echo "5.5.4 Edit the /etc/libuser.conf file with:"
echo "${BLUE}crypt_style = sha512${NC}"
echo "${BLUE}ENCRYPT_METHOD SHA512${NC}"
echo
echo "${MG}5.6 User Accounts and Environment${NC}"
echo "${YELLOW}[+]	5.6.1 Set Shadow Password Suite Parameters${NC}"
echo "5.6.1.1 Set the PASS_MAX_DAYS in /etc/login.defs to:"
echo "${BLUE}365${NC}"
echo "Modify the user parameters used for all password to match:"
echo "${BLUE}chage --maxdays 365 <user>${NC}"
echo
echo "5.6.1.2 Set the PASS_MIN_DAYS in /etc/login.defs to:"
echo "${BLUE}7${NC}"
echo "Modify the user parameters used for all password to match:"
echo "${BLUE}chage --mindays 7 <user>${NC}"
echo
echo "5.6.1.3 Set the PASS_WARN_AGE in /etc/login.defs to:"
echo "${BLUE}7${NC}"
echo "Modify the user parameters used for all password to match:"
echo "${BLUE}chage --warndays 7 <user>${NC}"
echo
echo "5.6.1.4 Run the command to set default password to inactivity to 30 days:"
echo "${BLUE}useradd -D -f 30${NC}"
echo "Modify the user parameters used for all password to match:"
echo "${BLUE}chage --inactive 30 <user>${NC}"
echo
echo "5.6.1.5 Investigate any users with a password change date in the future and correct them"
echo
echo "5.6.2 Run the command to set the shell for any accounts returned by audit to nologin:"
echo "${BLUE}usermod -s $(which nologin) <user>${NC}"
echo "Lock any non root accounts returned by audit:"
echo "${BLUE}usermod -L <user>${NC}"
echo
echo "5.6.3 Review the /etc/bashrc, /etc/profile and all files ending with *.sh in the /etc/profile.d/ to not exceed TMOUT=900 or equals to"
echo
echo "5.6.4 Run the following command to set the root account:"
echo "${BLUE}usermod -g 0 root${NC}"
echo
echo "5.6.5 Edit the file of /etc/profile.d/set umask.sh:"
echo "${BLUE}umask 027${NC}"
echo "To set the default user unmask:"
echo "${BLUE}UMASK 027${NC}"
echo "${BLUE}USERGROUP_ENAB no${NC}"
echo "Edit the files /etc/pam.d/password-auth and /etc/pam.d/system-auth with this:"
echo "${BLUE}session	optional	pam_umask.so${NC}"
echo

{
echo "---------------------------------------------------------------------------------------"
}

{
echo "${lightyellow}${bold}6 System Maintenance${normal}${default}"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo "${lightpurple}${bold}6.1 System File Permissions${normal}${default}"
}

{
echo "6.1.1 Audit system file permissions"
echo "Correct any discrepancies found and rerun the audit until output is clean or risk is" 
echo "mitigated or accepted."
echo "${lightblue}${bold}rpm -Va --nomtime --nosize --nomd5 --nolinkto > <filename>${default}${normal}"
}

{
echo " "
}

{
echo "6.1.2 Ensure sticky bit is set on all world-writable directories"
echo "Run the following command to set the sticky bit on all world writable directories:"
echo "${lightblue}${bold}df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev"
echo "-type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null | xargs -I '{}' chmod"
echo "a+t '{}'${default}${normal}"
}

{
echo " "
}

{
echo "6.1.3 Ensure permissions on /etc/passwd are configured"
echo "Run the following command to set permissions on /etc/passwd :"
echo "${lightblue}${bold}chown root:root /etc/passwd"
echo "chmod 644 /etc/passwd${default}${normal}"
}

{
echo " "
}

{
echo "6.1.4 Ensure permissions on /etc/shadow are configured"
echo "Run the following commands to set owner, group, and permissions on /etc/shadow :"
echo "${lightblue}${bold}chown root:root /etc/shadow"
echo "chmod 0000 /etc/shadow${default}${normal}"
}

{
echo " "
}

{
echo "6.1.5 Ensure permissions on /etc/group are configured"
echo "Run the following commands to set owner, group, and permissions on /etc/group :"
echo "${lightblue}${bold}chown root:root /etc/group"
echo "chmod u-x,g-wx,o-wx /etc/group${default}${normal}"
}

{
echo " "
}

{
echo "6.1.6 Ensure permissions on /etc/gshadow are configured"
echo "Run the following commands to set owner, group, and permissions on /etc/gshadow"
echo "${lightblue}${bold}chown root:root /etc/gshadow"
echo "chmod 0000 /etc/gshadow${default}${normal}"
}

{
echo " "
}

{
echo "6.1.7 Ensure permissions on /etc/passwd- are configured"
echo "Run the following commands to set owner, group, and permissions on /etc/passwd- :"
echo "${lightblue}${bold}chown root:root /etc/passwd-"
echo "chmod chmod u-x,go-wx /etc/passwd-${default}${normal}"
}

{
echo " "
}

{
echo "6.1.8 Ensure permissions on /etc/shadow- are configured"
echo "Run the following commands to set owner, group, and permissions on /etc/shadow- :"
echo "${lightblue}${bold}chown root:root /etc/shadow-"
echo "chmod 0000 /etc/shadow-${default}${normal}"
}

{
echo " "
}

{
echo "6.1.9 Ensure permissions on /etc/group- are configured"
echo "Run the following commands to set owner, group, and permissions on /etc/group- :"
echo "${lightblue}${bold}chown root:root /etc/group-"
echo "chmod u-x,go-wx /etc/group-${default}${normal}"
}

{
echo " "
}

{
echo "6.1.10 Ensure permissions on /etc/gshadow- are configured"
echo "Run the following commands to set owner, group, and permissions on /etc/gshadow- :"
echo "${lightblue}${bold}chown root:root /etc/gshadow-"
echo "chmod 0000 /etc/gshadow-${default}${normal}"
}

{
echo " "
}

{
echo "6.1.11 Ensure no world writable files exist"
echo "Removing write access for the 'other' category ( chmod o-w <filename> ) is advisable," 
echo "but always consult relevant vendor documentation to avoid breaking any application"
echo "dependencies on a given file."
}

{
echo " "
}

{
echo "6.1.12 Ensure no unowned files or directories exist"
echo "Locate files that are owned by users or groups not listed in the system configuration" 
echo "files, and reset the ownership of these files to some active user on the system as" 
echo "appropriate."
}

{
echo " "
}

{
echo "6.1.13 Ensure no ungrouped files or directories exist"
echo "Locate files that are owned by users or groups not listed in the system configuration" 
echo "files, and reset the ownership of these files to some active user on the system as" 
echo "appropriate."
}

{
echo " "
}

{
echo "6.1.14 Audit SUID executables"
echo "Ensure that no rogue SUID programs have been introduced into the system. Review the"
echo "files returned by the action in the Audit section and confirm the integrity of these" 
echo "binaries."
}

{
echo " "
}

{
echo "6.1.15 Audit SGID executables"
echo "Ensure that no rogue SGID programs have been introduced into the system. Review the"
echo "files returned by the action in the Audit section and confirm the integrity of these" 
echo "binaries."
}

{
echo " "
}

{
echo "${lightpurple}${bold}6.2 User and Group Settings${normal}${default}"
}

{
echo "6.2.1 Ensure password fields are not empty"
echo "If any accounts in the /etc/shadow file do not have a password, run the following" 
echo "command to lock the account until it can be determined why it does not have a password:"
echo "${lightblue}${bold}passwd -l <username>${default}${normal}"
echo "Also, check to see if the account is logged in and investigate what it is being used" 
echo "for to determine if it needs to be forced off."
}

{
echo " "
}

{
echo "6.2.2 Ensure all groups in /etc/passwd exist in /etc/group"
echo "Analyze the output of the Audit step above and perform the appropriate action to"
echo "correct any discrepancies found."
}

{
echo " "
}

{
echo "6.2.3 Ensure no duplicate UIDs exist"
echo "Based on the results of the audit script, establish unique UIDs and review all files"
echo "owned by the shared UIDs to determine which UID they are supposed to belong to."
}

{
echo " "
}

{
echo "6.2.4 Ensure no duplicate GIDs exist"
echo "Based on the results of the audit script, establish unique GIDs and review all files"
echo "owned by the shared GID to determine which group they are supposed to belong to."
}

{
echo " "
}

{
echo "6.2.5 Ensure no duplicate user names exist"
echo "Based on the results of the audit script, establish unique user names for the users." 
echo "File ownerships will automatically reflect the change as long as the users have"
echo "unique UIDs."
}

{
echo " "
}

{
echo "6.2.6 Ensure no duplicate group names exist"
echo "Based on the results of the audit script, establish unique names for the user groups."
echo "File group ownerships will automatically reflect the change as long as the groups"
echo "have unique GIDs."
}

{
echo " "
}

{
echo "6.2.7 Ensure root PATH Integrity"
echo "Correct or justify any items discovered in the Audit step."
}

{
echo " "
}

{
echo "6.2.8 Ensure root is the only UID 0 account"
echo "Remove any users other than root with UID 0 or assign them a new UID if appropriate."
}

{
echo " "
}

{
echo "6.2.9 Ensure all users' home directories exist"
echo "If any users' home directories do not exist, create them and make sure the"
echo "respective user owns the directory. Users without an assigned home directory should"
echo "be removed or assigned a home directory as appropriate."
echo "The following script will create a home directory for users with an interactive"
echo "shell whose home directory doesn't exist:"
echo "${lightred}Convert (#) to ($) except for first line of script. ${default}"
echo "${lightblue}${bold}#!/bin/bash"
echo "awk -F: '(#1!~/(halt|sync|shutdown|nfsnobody)/ &&"
echo "#7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && #7!~/(\/usr)?\/bin\/false(\/)?$/)"
echo "{ print #1 ' ' #6 }' /etc/passwd | while read -r user dir;" 
echo "do"
echo "	if [ ! -d '#dir' ];" 
echo "	then"
echo "		mkdir '#dir'"
echo "		chmod g-w,o-wrx '#dir'"
echo "		chown '#user' '#dir'"
echo "	fi"
echo "done${default}${normal}"
}

{
echo " "
}

{
echo "6.2.10 Ensure users own their home directories"
echo "Change the ownership of any home directories that are not owned by the"
echo "defined user to the correct user."
echo "The following script will create missing home directories, set the owner, and set the"
echo "permissions for interactive users' home directories:"
echo "${lightred}Convert (#) to ($) except for first line of script. ${default}"
echo "${lightblue}${bold}#!/bin/bash"
echo "awk -F: '(#1!~/(halt|sync|shutdown|nfsnobody)/ &&"
echo "#7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && #7!~/(\/usr)?\/bin\/false(\/)?$/)"
echo "{ print #1 " " #6 }' /etc/passwd | while read -r user dir;"
echo "do"
echo "	if [ ! -d '#dir' ];"
echo "	then"
echo "		echo 'User: \'#user\' home directory: \'#dir\' does not exist, creating "
echo "home directory'"
echo "		mkdir '#dir'"
echo "		chmod g-w,o-rwx '#dir'"
echo "		chown '#user' '#dir'"
echo "	else"
echo "		owner=#(stat -L -c '%U' '#dir')"
echo "		if [ '#owner' != '#user' ];"
echo "		then"
echo "			chmod g-w,o-rwx '#dir'"
echo "			chown '$user' '#dir'"
echo "		fi"
echo "	fi"
echo "done${default}${normal}"
}

{
echo " "
}

{
echo "6.2.11 Ensure users' home directories permissions are 750 / more restrictive"
echo "Making global modifications to user home directories without alerting user community"
echo "can result in unexpected outages and unhappy users. Therefore, it is recommended"
echo "that a monitoring policy be established to report user file permissions and determine"
echo "the action to be taken in accordance with site policy."
echo "The following script can be used to remove permissions is excess of 750 from users'"
echo "home directories:"
echo "${lightred}Convert (#) to ($) except for first line of script. ${default}"
echo "${lightblue}${bold}#!/bin/bash"
echo "awk -F: '(#1!~/(halt|sync|shutdown|nfsnobody)/ &&"
echo "#7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && #7!~/(\/usr)?\/bin\/false(\/)?$/)"
echo "{print #6}' /etc/passwd | while read -r dir;"
echo "do"
echo "	if [ -d '#dir' ];"
echo "	then"
echo "		dirperm=#(stat -L -c '%A' '#dir')"
echo "		if [ '#(echo '#dirperm' | cut -c6)' != '-' ] || [ '#(echo '#dirperm' |"
echo "cut -c8)' != '-' ] || [ '#(echo '#dirperm' | cut -c9)' != '-' ] || [ '#(echo"
echo "'#dirperm' | cut -c10)' != '-' ];"
echo "		then"
echo "			chmod g-w,o-rwx '#dir'"
echo "		fi"
echo "	fi"
echo "done${default}${normal}"
}

{
echo ""
}

{
echo "6.2.12 Ensure users' dot files are not group or world writable"
echo "Making global modifications to user home directories without alerting user community"
echo "can result in unexpected outages and unhappy users. Therefore, it is recommended"
echo "that a monitoring policy be established to report user file permissions and determine"
echo "the action to be taken in accordance with site policy."
echo "The following script will remove excessive permissions on dot files within"
echo "interactive users' home directories."
echo "${lightred}Convert (#) to ($) except for first line of script. ${default}"
echo "${lightblue}${bold}#!/bin/bash"
echo "awk -F: '(#1!~/(halt|sync|shutdown|nfsnobody)/ &&"
echo "#7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && #7!~/(\/usr)?\/bin\/false(\/)?$/) {"
echo "print #6 }' /etc/passwd | while read -r dir;"
echo "do"
echo "	if [ -d '#dir' ];"
echo "	then"
echo "		for file in '#dir'/.*;"
echo "		do"
echo "			if [ ! -h '#file' ] && [ -f '#file' ];"
echo "			then"
echo "				fileperm=#(stat -L -c '%A' '#file')"
echo "				if [ '#(echo '#fileperm' | cut -c6)' != '-' ] ||"
echo "[ '#(echo'#fileperm' | cut -c9)' != '-' ];"
echo "				then"
echo "					chmod go-w '#file'"
echo "				fi"
echo "			fi"
echo "		done"
echo "	fi"
echo "done${default}${normal}"
}

{
echo " "
}

{
echo "6.2.13 Ensure users' .netrc Files are not group or world accessible"
echo "Making global modifications to users' files without alerting the user community"
echo "can result in unexpected outages and unhappy users. Therefore, it is recommended"
echo "that a monitoring policy be established to report user .netrc files and determine"
echo "the action to be taken in accordance with site policy."
echo "The following script will remove .netrc files from interactive users' home directories"
echo "${lightred}Convert (#) to ($) except for first line of script. ${default}"
echo "${lightblue}${bold}#!/bin/bash"
echo "awk -F: '(#1!~/(halt|sync|shutdown|nfsnobody)/ &&"
echo "#7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && #7!~/(\/usr)?\/bin\/false(\/)?$/) {"
echo "print #6 }' /etc/passwd | while read -r dir;"
echo "do"
echo "	if [ -d '#dir' ];"
echo "	then"
echo "		file='#dir/.netrc'"
echo "		[ ! -h '#file' ] && [ -f '#file' ] && rm -f '#file'"
echo "	fi"
echo "done${default}${normal}"
}

{
echo " "
}

{
echo "6.2.14 Ensure no users have .forward files"
echo "Making global modifications to users' files without alerting the user community"
echo "can result in unexpected outages and unhappy users. Therefore, it is recommended"
echo "that a monitoring policy be established to report user .forward files and determine"
echo "the action to be taken in accordance with site policy."
echo "The following script will remove .forward files from interactive users' home"
echo "directories"
echo "${lightred}Convert (#) to ($) except for first line of script. ${default}"
echo "${lightblue}${bold}#!/bin/bash"
echo "awk -F: '(#1!~/(halt|sync|shutdown|nfsnobody)/ &&"
echo "#7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && #7!~/(\/usr)?\/bin\/false(\/)?$/) {"
echo "print #6 }' /etc/passwd | while read -r dir; do"
echo "	if [ -d '#dir' ];"
echo "	then"
echo "		file='#dir/.forward'"
echo "		[ ! -h '#file' ] && [ -f '#file' ] && rm -r '#file'"
echo "	fi"
echo "done${default}${normal}"
}

{
echo " "
}

{
echo "6.2.15 Ensure no users have .netrc files"
echo "Making global modifications to users' files without alerting the user community"
echo "can result in unexpected outages and unhappy users. Therefore, it is recommended"
echo "that a monitoring policy be established to report user .netrc files and determine"
echo "the action to be taken in accordance with site policy."
echo "The following script will remove .netrc files from interactive users' home directories"
echo "${lightred}Convert (#) to ($) except for first line of script. ${default}"
echo "${lightblue}${bold}#!/bin/bash"
echo "awk -F: '(#1!~/(halt|sync|shutdown|nfsnobody)/ &&"
echo "#7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && #7!~/(\/usr)?\/bin\/false(\/)?$/) {"
echo "print #6 }' /etc/passwd | while read -r dir;"
echo "do"
echo "	if [ -d '#dir' ];"
echo "	then"
echo "		file='#dir/.netrc'"
echo "		[ ! -h '#file' ] && [ -f '#file' ] && rm -f '#file'"
echo "	fi"
echo "done${default}${normal}"
}

{
echo " "
}

{
echo "6.2.16 Ensure no users have .rhosts files"
echo "Making global modifications to users' files without alerting the user community"
echo "can result in unexpected outages and unhappy users. Therefore, it is recommended"
echo "that a monitoring policy be established to report user .rhosts files and determine"
echo "the action to be taken in accordance with site policy."
echo "The following script will remove .rhosts files from interactive users' home directories"
echo "${lightred}Convert (#) to ($) except for first line of script. ${default}"
echo "${lightblue}${bold}#!/bin/bash"
echo "awk -F: '(#1!~/(halt|sync|shutdown|nfsnobody)/ &&"
echo "#7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && #7!~/(\/usr)?\/bin\/false(\/)?$/) {"
echo "print #6 }' /etc/passwd | while read -r dir;"
echo "do"
echo "	if [ -d '#dir' ];"
echo "	then"
echo "		file='#dir/.rhosts'"
echo "		[ ! -h '#file' ] && [ -f '#file' ] && rm -r '#file'"
echo "	fi"
echo "done${default}${normal}"
}

