#!/bin/bash
fail=FAIL
pass=PASS
warning=WARNING
danger=DANGER
safe=SAFE
na=("[N/A]")

orange=`echo -en`
lightaqua=`echo -en`
lightpurple=`echo -en`
lightred=`echo -en`
lightgreen=`echo -en`
default=`echo -en`
lightblue=`echo -en`
bold=$()
normal=$()
lightyellow=`echo -en`

WCOUNTER=0
NCOUNTER=0

echo

function trans1() {
echo $''1 Initial Setup$''
echo ------------------------------------------------------------------------------------------------
printf "%-110s %s\n" "Title" "Status"
echo ------------------------------------------------------------------------------------------------
echo $''1.1 Filesystem Configuration$''
echo $''\[+\]	1.1.1 Disable unused filesystems$''
#1.1.1.1
result= `modprobe -n -v cramfs | grep "^install /bin/false"`
if [ "$result" != "install /bin/true" ] ; then
	printf "%-77s %s\n" "1.1.1.1 Ensure mounting of cramfs filesystem is disabled" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.1.1 Ensure mounting of cramfs filesystem is disabled" "[pass]"
	echo "" 
fi
#1.1.1.2
result= `modprobe -n -v squashfs | grep "^install /bin/false"`
if [ "$result" != "install /bin/true" ] ; then
	printf "%-77s %s\n" "1.1.1.2 Ensure mounting of squashfs filesystem is disabled" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.1.2 Ensure mounting of squashfs filesystem is disabled" "[pass]"
	echo "" 
fi

#1.1.1.3
result= `modprobe -n -v udf | grep "^install /bin/false"`
if [ "$result" != "install /bin/true" ] ; then
	printf "%-77s %s\n" "1.1.1.3 Ensure mounting of udf filesystems is disabled" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.1.3 Ensure mounting of udf filesystems is disabled" "[pass]"
	echo "" 
fi

echo $''\[+\]	1.1.2 Configure /tmp$''

#1.1.2.1
result= `findmnt /etc/fstab /tmp`
if [ "$result" == "/tmp" ] ; then
	printf "%-77s %s\n" "1.1.2.1 Ensure /tmp is a separate partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.2.1 Ensure /tmp is a separate partition" "[pass]"
	echo "" 
fi

#1.1.2.2 
result= `findmnt /etc/fstab /tmp | grep nodev`
if [ "$result" != "nodev" ] ; then
	printf "%-77s %s\n" "1.1.2.2 Ensure nodev option set on /tmp partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.2.2 Ensure nodev option set on /tmp partition" "[pass]"
	echo "" 
fi

#1.1.2.3
result= `findmnt /etc/fstab /tmp | grep noexec`
if [ "$result" != "noexec" ] ; then
	printf "%-77s %s\n" "1.1.2.3 Ensure noexec option set on /tmp partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.2.3 Ensure noexec option set on /tmp partition" "[pass]"
	echo "" 
fi

#1.1.2.4
result= `findmnt /etc/fstab /tmp | grep nosuid`
if [ "$result" != "nosuid" ] ; then
	printf "%-77s %s\n" "1.1.2.4 Ensure nosuid option set on /tmp partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.2.4 Ensure nousid option set on /tmp partition" "[pass]"
	echo "" 
fi

echo $''\[+\]	1.1.3 /Configure /var$''

#1.1.3.1
result= `findmnt /etc/fstab /var`
if [ "$result" == "/var" ] ; then
	printf "%-77s %s\n" "1.1.3.1 Ensure separate partition exists for /var" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.3.1 Ensure separate partition exists for /var" "[pass]"
	echo "" 
fi

#1.1.3.2
result= `findmnt /etc/fstab /var | grep nodev`
if [ "$result" != "nodev" ] ; then
	printf "%-77s %s\n" "1.1.3.2 Ensure nodev option set on /var partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.3.2 Ensure nodev option set on /var partition" "[pass]"
	echo "" 
fi

#1.1.3.3
result= `findmnt /etc/fstab /var | grep noexec`
if [ "$result" != "noexec" ] ; then
	printf "%-77s %s\n" "1.1.3.3 Ensure noexec option set on /var partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.3.3 Ensure noxec option set on /var partition" "[pass]"
	echo "" 
fi

#1.1.3.4
result= `findmnt /etc/fstab /var | grep nosuid`
if [ "$result" != "nosuid" ] ; then
	printf "%-77s %s\n" "1.1.3.4 Ensure nosuid option set on /var partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.3.4 Ensure nosuid option set on /var partition" "[pass]"
	echo "" 
fi


echo $''\[+\]	1.1.4 /var/tmp$''

#1.1.4.1
result= `findmnt /etc/fstab /var/tmp`
if [ "$result" != "/var/tmp" ] ; then
	printf "%-77s %s\n" "1.1.4.1 Ensure separate partition exists for /var/tmp" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.4.1 Ensure separate partition exists for /var/tmp" "[pass]"
	echo "" 
fi

#1.1.4.2
result= `findmnt /etc/fstab /var/tmp | grep noexec`
if [ "$result" != "noexec" ] ; then
	printf "%-77s %s\n" "1.1.4.2 Ensure noexec option set on /var/tmp partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.4.2 Ensure noexec option set on /var/tmp partition" "[pass]"
	echo "" 
fi

#1.1.4.3
result= `findmnt /etc/fstab /var/tmp | grep nosuid`
if [ "$result" != "nosuid" ] ; then
	printf "%-77s %s\n" "1.1.4.3 Ensure nosuid option set on /var/tmp partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.4.3 Ensure nosuid option set on /var/tmp partition" "[pass]"
	echo "" 
fi

#1.1.4.4
result= `findmnt /etc/fstab /var/tmp | grep nodev`
if [ "$result" != "nodev" ] ; then
	printf "%-77s %s\n" "1.1.4.4 Ensure nodev option set on /var/tmp partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.4.4 Ensure nodev option set on /var/tmp partition" "[pass]"
	echo "" 
fi


echo $''\[+\]	1.1.5 Configure /var/log$''

#1.1.5.1
result= `findmnt /etc/fstab /var/log`
if [ "$result" == "/var/log" ] ; then
	printf "%-77s %s\n" "1.1.5.1 Ensure separate partition exists for /var/log" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.5.1 Ensure separate partition exists for /var/log" "[pass]"
	echo "" 
fi

#1.1.5.2
result= `findmnt /etc/fstab /var/log | grep nodev`
if [ "$result" != "nodev" ] ; then
	printf "%-77s %s\n" "1.1.5.2 Ensure nodev option set on /var/log partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.5.2 Ensure nodev option set on /var/log partition" "[pass]"
	echo "" 
fi

#1.1.5.3
result= `findmnt /etc/fstab /var/log | grep noexec`
if [ "$result" != "noexec" ] ; then
	printf "%-77s %s\n" "1.1.5.3 Ensure noexec option set on /var/log partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.5.3 Ensure noexec option set on /var/log partition" "[pass]"
	echo "" 
fi

#1.1.5.4
result= `findmnt /etc/fstab /var/log | grep nosuid`
if [ "$result" != "nosuid" ] ; then
	printf "%-77s %s\n" "1.1.5.4 Ensure nosuid option set on /var/log partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.5.4 Ensure nosuid option set on /var/log partition" "[pass]"
	echo "" 
fi


echo $''\[+\]	1.1.6 Configure /var/log/audit$''

#1.1.6.1
result= `findmnt /etc/fstab /var/log/audit`
if [ "$result" != "/var/log/audit" ] ; then
	printf "%-77s %s\n" "1.1.6.1 Ensure separate partition exists for /var/log/audit" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.6.1 Ensure separate partition exists for /var/log/audit" "[pass]"
	echo "" 
fi

#1.1.6.2
result=`findmnt /etc/fstab /var/log/audit | grep noexec`
if [ "$result" != "noexec" ] ; then
	printf "%-77s %s\n" "1.1.6.2 Ensure noexec option set on /var/log/audit partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.6.2 Ensure noexec option set on /var/log/audit partition" "[pass]"
	echo "" 
fi

#1.1.6.3
result= `findmnt /etc/fstab /var/log/audit | grep nodev`
if [ "$result" != "nodev" ] ; then
	printf "%-77s %s\n" "1.1.6.3 Ensure nodev option set on /var/log/audit partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.6.3 Ensure nodev option set on /var/log/audit partition" "[pass]"
	echo "" 
fi

#1.1.6.4
result= `findmnt /etc/fstab /var/log/audit | grep nosuid`
if [ "$result" != "nosuid" ] ; then
	printf "%-77s %s\n" "1.1.6.4 Ensure nosuid option set on /var/log/audit partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.6.4 Ensure nosuid option set on /var/log/audit partition" "[pass]"
	echo "" 
fi


echo $''\[+\]	1.1.7 Configure /home$''

#1.1.7.1
result= `findmnt /etc/stab /home`
if [ "$result" == "/home" ] ; then
	printf "%-77s %s\n" "1.1.7.1 Ensure separate partition exists for /home" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.7.1 Ensure separate partition exists for /home" "[pass]"
	echo "" 
fi

#1.1.7.2
result= `findmnt /etc/fstab /home | grep nodev`
if [ "$result" != "nodev" ] ; then
	printf "%-77s %s\n" "1.1.7.2 Ensure nodev option set on /home partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.7.2 Ensure nodev option set on /home partition" "[pass]"
	echo "" 
fi

#1.1.7.3
result= `findmnt /etc/fstab /home | grep nosuid`
if [ "$result" != "nosuid" ] ; then
	printf "%-77s %s\n" "1.1.7.3 Ensure nosuid option set on /home partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.7.3 Ensure nosuid option set on /home partition" "[pass]"
	echo "" 
fi

#1.1.7.4
result= `findmnt /etc/fstab /home | grep ursquota`
if [ "$result" != "ursquota" ] ; then
	printf "%-77s %s\n" "1.1.7.4 Ensure usrquota option set on /home partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.7.4 Ensure usrquota option set on /home partition" "[pass]"
	echo "" 
fi

#1.1.7.5
result= `findmnt /etc/fstab /home | grep grpquota`
if [ "$result" != "grpquota" ] ; then
	printf "%-77s %s\n" "1.1.7.5 Ensure grpquota option set on /home partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.7.5 Ensure grpquota option set on /home partition" "[pass]"
	echo "" 
fi

echo $''\[+\]	1.1.8 Configure /dev/shm$''

#1.1.8.1
result= mount | grep -E '\s/dev/shm\s' | grep -v nodev
if [ "$result" == "/dev/shm" ] ; then
	printf "%-77s %s\n" "1.1.8.1 Ensure nodev option set on /dev/shm partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.8.1 Ensure nodev option set on /dev/shm partition" "[pass]"
	echo "" 

fi
#1.1.8.2
result= `findmnt | grep -E '\s/dev/shm\s' | grep -v noexec`
if [ "$result" != "/dev/shm" ] ; then
	printf "%-77s %s\n" "1.1.8.2 Ensure noexec option set on /dev/shm partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.8.2 Ensure noexec option set on /dev/shm partition" "[pass]"
	echo "" 
fi
#1.1.8.3
result= mount | grep -E '\s/dev/shm\s' | grep -v nosuid
if [ "$result" == "nosuid" ] ; then
	printf "%-77s %s\n" "1.1.8.3 Ensure nosuid option set on /dev/shm partition" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.8.3 Ensure nosuid option set on /dev/shm partition" "[pass]"
	echo "" 
fi

#1.1.9
result= dnf | grep  autofs.service
if [ "$result" != "enabled" ] ; then
	printf "%-77s %s\n" "1.1.9 Disable Automounting" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.9 Disable Automounting" "[pass]"
	echo "" 
fi

#1.1.10
result= `modprobe -n -v usb-storage | grep "^install /bin/false"`
if [ "$result" != "install /bin/true" ] ; then
	printf "%-77s %s\n" "1.1.10 Disable USB Storage" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.1.10 Disable USB Storage" "[pass]"
	echo "" 
fi


echo $''1.2 Configure Software Updates$''

#1.2.1
printf "%-77s %s\n" "1.2.1 Ensure GPG Keys are configured" "$na"
echo ""

#1.2.2
result=$(grep gpgcheck /etc/dnf/dnf.conf)
if [ "$result" == "1" ]
then
        printf "%-77s %s\n" "1.2.2 Ensure gpgcheck is globally activated" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "1.2.2 Ensure gpgcheck is globally activated" "[fail]"
	echo "" 
fi


#1.2.3
printf "%-77s %s\n" "1.2.3 Ensure package manager repositories are configured" "$na"
echo ""

echo $''1.3 Filesystem Integrity Checking$''

#1.3.1
if [ "rpm -q aide" == "package studio is not installed" ] ; then
	printf "%-77s %s\n" "1.3.1 Ensure AIDE is installed" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.3.1 Ensure AIDE is installed" "[pass]"
	echo "" 
fi

#1.3.2
result=`grep /usr/sbin/aide /etc/crontab`
if [ "$result" == "/usr/sbin/aide" ] ; then
	printf "%-77s %s\n" "1.3.2 Ensure filesystem integrity is regularly checked" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.3.2 Ensure filesystem integrity is regularly checked" "[pass]"
	echo "" 
fi


echo $''1.4 Secure Boot Settings$''
#1.4.1
result= `cat /etc/grub.d/01_users | grep "grub2-setpassword"`
if [ "$result" != "grub2-setpassword" ] ; then
	printf "%-77s %s\n" "1.4.1 Ensure bootloader password is set" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.4.1 Ensure bootloader password is set" "[pass]"
	echo "" 
fi

#1.4.2
result= `ls -l /boot/grub2/* | grep 'root:root'`
if [ "$result" == "root:root" ]  
then
	printf "%-77s %s\n" "1.4.2 Ensure permissions on bootloader config are configured" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.4.2 Ensure permissions on bootloader config are configured" "[pass]"
	echo "" 
fi

#1.4.3
result=`grep -r /systemd-sulogin-shell /usr/lib/systemd/system/rescue.service`
if [ "$result" == "-/usr/lib/systemd/systemd-sulogin-shell rescue" ] ; then
	printf "%-77s %s\n" "1.4.3 Ensure authentication is required when booting into rescue mode" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.4.3 Ensure authentication is required when booting into rescue mode" "[pass]"
	echo "" 
fi

echo $''1.5 Additional Process Hardening$''
#1.5.1
core_dump=$(grep -i '^\s*storage\s*=\s*none' /etc/systemd/coredump.conf) 
if [ "$core_dump" == "Storage=none" ]
then
	printf "%-77s %s\n" "1.5.1 Ensure core dump storage is disabled" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.5.1 Ensure core dump storage is disabled" "[pass]"
	echo "" 
fi

#1.5.2
result=$(grep -i '^\s*ProcessSizeMax\s*=\s*0' /etc/systemd/coredump.conf)
if [ "$result" == "ProcessSizeMax=0" ] ; then
	printf "%-77s %s\n" "1.5.2 Ensure core dump backtraces are disabled" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.5.2 Ensure core dump backtraces are disabled" "[pass]"
	echo "" 
fi

#1.5.3
result= grep -i '^\s*kernel.randomize_va_space\s*=\s*2' /etc/sysctl.conf
if [ "$result" != "2" ] ; then
	printf "%-77s %s\n" "1.5.3 Ensure address space layout randomization (ASLR) is enabled" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.5.3 Ensure address space layout randomization (ASLR) is enabled" "[pass]"
	echo "" 
fi

}

#translation 1 end !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

function trans1.2() {

echo $''1.6 Mandatory Access Control$''
echo $''\[+\]	1.6.1 Configure SELinux$''
#1.6.1.1
if [ "rpm -q libselinux" == "libselinux" ] ; then
	printf "%-77s %s\n" "1.6.1.1 Ensure SELinux is installed" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.6.1.1 Ensure SELinux is installed" "[pass]"
	echo "" 
fi

#1.6.1.2
result= grep '^\s*selinux\s*=\s*0\b' /etc/default/grub
if [ "$result" == "selinux=0|enforcing=0" ] ; then
	printf "%-77s %s\n" "1.6.1.2 Ensure SELinux is not disabled in bootloader configuration" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.6.1.2 Ensure SELinux is not disabled in bootloader configuration" "[pass]"
	echo "" 
fi

#1.6.1.3
result= grep '^\s*SELINUXTYPE=(targeted|mls)\b' /etc/selinux/config
if [ "$result" == "targeted|mls" ] ; then
	printf "%-77s %s\n" "1.6.1.3 Ensure SELinux policy is configured" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.6.1.3 Ensure SELinux policy is configured" "[pass]"
	echo "" 
fi

#1.6.1.4
result=`grep -E '^\s*SELINUX=(enforcing|permissive)' /etc/selinux/config`
if [ "$result" == "disabled" ] ; then
	printf "%-77s %s\n" "1.6.1.4 Ensure the SELinux mode is not disabled" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.6.1.4 Ensure the SELinux mode is not disabled" "[pass]"
	echo "" 
fi

#1.6.1.5
result= grep '^\s*SELINUX=(enforcing)\b' /etc/selinux/config
if [ "$result" != "enforcing" ] ; then
	printf "%-77s %s\n" "1.6.1.5 Ensure the SELinux mode is enforcing" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.6.1.5 Ensure the SELinux mode is enforcing" "[pass]"
	echo "" 
fi

#1.6.1.6
result=`ps -eZ | grep unconfined_service_t`
if [ "$result" == "0" ] ; then
	printf "%-77s %s\n" "1.6.1.6 Ensure no unconfined services exist" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.6.1.6 Ensure no unconfined services exist" "[pass]"
	echo "" 
fi

#1.6.1.7
result=`rpm -q setroubleshoot`
if [ "$result" != "package setroubleshoot is not installed" ] ; then
	printf "%-77s %s\n" "1.6.1.7 Ensure SETroubleshoot is not installed" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.6.1.7 Ensure SETroubleshoot is not installed" "[pass]"
	echo "" 
fi

#1.6.1.8
result=`rpm -q mcstrans`
if [ "$result" != "package mcstrans is not installed" ] ; then
	printf "%-77s %s\n" "1.6.1.8 Ensure the MCS Translation Service (mcstrans) is not installed" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.6.1.8 Ensure the MCS Translation Service (mcstrans) is not installed" "[pass]"
	echo "" 
fi

echo $''1.7 Command Line Warning Banners$''
#1.7.1
result=`cat /etc/motd`
if [ -z "$motd_check" ]
then
        printf "%-77s %s\n" "1.7.1 Ensure message of the day is configured properly" "[fail]"
	echo "" 
else
        printf "%-77s %s\n" "1.7.1 Ensure message of the day is configured properly" "[pass]"
	echo "" 
fi

#1.7.2
result=`cat /etc/issue`
if [ -z "$result" ]
then
	printf "%-77s %s\n" "1.7.2 Ensure local login warning banner is configured properly" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.7.2 Ensure local login warning banner is configured properly" "[pass]"
	echo "" 
fi

#1.7.3
result=`cat /etc/issue.net`
if [ -z "$result" ]
then
	printf "%-77s %s\n" "1.7.3 Ensure remote login warning banner is configured properly" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.7.3 Ensure remote login warning banner is configured properly" "[pass]"
	echo "" 
fi

#1.7.4
result= grep -E '^\s*UID|GID=(0/root)\s*Access=0644' /etc/motd
if [ "$result" == "0/root|0644" ]  ; then
	printf "%-77s %s\n" "1.7.4 Ensure permissions on /etc/motd are configured" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.7.4 Ensure permissions on /etc/motd are configured" "[pass]"
	echo "" 
fi

#1.7.5
result= grep -E '^\s*UID|GID=(0/root)\s*Access=0644' /etc/issue
if [ "$result" == "0/root|0644" ] ; then
	printf "%-77s %s\n" "1.7.5 Ensure permissions on /etc/issue are configured" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.7.5 Ensure permissions on /etc/issue are configured"  "[pass]"
	echo "" 
fi

#1.7.6
result= grep -E '^\s*UID|GID=(0/root)\s*Access=0644' /etc/issue.net
if [ "$result" != "0/root|0644" ] ; then
	printf "%-77s %s\n" "1.7.6 Ensure permissions on /etc/issue.net are configured" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.7.6 Ensure permissions on /etc/issue.net are configured" "[pass]"
	echo "" 
fi

echo $''1.8 GNOME Display Manager$''
#1.8.1
printf "%-77s %s\n" "1.8.1 Ensure GNOME Display Manager is removed" "$na"
echo ""

#1.8.2
result=`grep -Eis '^\s*banner-message-enable\s*=\s*enable' /etc/dconf/db/gdm.d/`
if [ "$result" == "enable" ] ; then
	printf "%-77s %s\n" "1.8.2 Ensure GDM login banner is configured" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.8.2 Ensure GDM login banner is configured" "[pass]"
	echo "" 
fi

#1.8.3
result=`grep -Eis '^\s*disable-user-list\s*=\s*true' /etc/dconf/db/gdm.d/`
if [ "$result" == "true" ] ; then
	printf "%-77s %s\n" "1.8.3 Ensure last logged in user display is disabled" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.8.3 Ensure last logged in user display is disabled" "[pass]"
	echo "" 
fi

#1.8.4
result= `grep '^\s*Enable\s*=\s*true' /etc/gdm/custom.conf`
if [ "$result" == "true" ] 
then
	printf "%-77s %s\n" "1.8.4 Ensure XDMCP is not enabled" "[fail]"
        echo "" 
else
	printf "%-77s %s\n" "1.8.4 Ensure XDMCP is not enabled" "[pass]"
	echo "" 
fi

#1.8.5
result=`gsettings get org.gnome.desktop.media-handling automount`
if [ "$result" != "false" ]  
then
	printf "%-77s %s\n" "1.8.5 Ensure automatic mounting of removable media is disabled" "[fail]"
       	echo "" 
else
	printf "%-77s %s\n" "1.8.5 Ensure automatic mounting of removable media is disbaled" "[pass]"
	echo "" 
fi

#1.9
printf "%-77s %s\n" "1.9 Ensure updates, patches, and additional security software are installed" "$na"
echo ""

#1.10
result= grep '^\s*LEGACY\s*(\s+#.*)?$' /etc/crypto-policies/config
if [ "$result" !=  "LEGACY" ] 
then
	printf "%-77s %s\n" "1.10 Ensure system-wide crypto policy is not legacy" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "1.10 Ensure system-wide crypto policy is not legacy" "[pass]"
	echo "" 
fi

}

function trans2() {

echo
echo $''2 Services$''
echo --------------------------------------------------------------------------------------
printf "%-77s %s\n" "Title" "Status"
echo --------------------------------------------------------------------------------------

#2.1.1
echo $''2.1 Time Synchronization$''
chrony=$(rpm -q chrony)
if [[ "$chrony" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.1.1 Ensure time synchronization is in use" "[fail]"
	echo "" 
else
        printf "%-77s %s\n" "2.1.1 Ensure time synchronization is in use" "[pass]"
	echo "" 
fi

#2.1.2
remote_server=$(grep -E "^(server|pool)" /etc/chrony.conf)
multiple_servers=$(grep ^OPTIONS /etc/sysconfig/chronyd)
if [[ ( -n "$remote_server" ) && ("$multiple_servers" == 'OPTIONS="-u chrony"') ]]
then
        printf "%-77s %s\n" "2.1.2 Ensure chrony is configured" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.1.2 Ensure chrony is configured" "[fail]"
	echo "" 
fi


#2.2.1
echo $''2.2 Special Purpose Services$''
xinetd=$(rpm -q xinetd)
if [[ "$xinetd" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.1 Ensure xinetd is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.1 Ensure xinetd is not installed" "$warning"
	echo "" WCOUNTER=WCOUNTER+1

fi

#2.2.2
xorg=$(rpm -q xorg-x11-server-common)
if [[ "$xorg" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.2 Ensure xorg-x11-server-common is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.2 Ensure xorg-x11-server-common is not installed" "[fail]"
	echo "" 
fi

#2.2.3
autoipd=$(rpm -q avahi-autoipd avahi | head -n 1)
avahi=$(rpm -q avahi-autoipd avahi | tail -n 1)
if [[ ("$autoipd" =~ "not installed") && ("$avahi" =~ "not installed") ]]
then
        printf "%-77s %s\n" "2.2.3 Ensure Avahi Server is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.3 Ensure Avahi Server is not installed" "[fail]"
	echo "" 
fi

#2.2.4
cups=$(rpm -q cups)
if [[ "$cups" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.4 Ensure CUPS is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.4 Ensure CUPS is not installed" "[fail]"
	echo "" 
fi

#2.2.5
dhcp=$(rpm -q dhcp-server)
if [[ "$dhcp" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.5 Ensure DHCP Server is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.5 Ensure DHCP Server is not installed" "[fail]"
	echo "" 
fi

#2.2.6
dns=$(rpm -q bind)
if [[ "$dns" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.6 Ensure DNS Server is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.6 Ensure DNS Server is not installed" "[fail]"
	echo "" 
fi

#2.2.7
ftp=$(rpm -q ftp)
if [[ "$ftp" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.7 Ensure FTP Server is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.7 Ensure FTP Server is not installed" "[fail]"
	echo "" 
fi

#2.2.8
vsftpd=$(rpm -q vsftpd)
if [[ "$vsftpd" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.8 Ensure VSFTP Server is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.8 Ensure VSFTP Server is not installed" "[fail]"
	echo "" 
fi

#2.2.9
tftp_server=$(rpm -q tftp-server)
if [[ "$tftp_server" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.9 Ensure TFTP Server is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.9 Ensure TFTP Server is not installed" "[fail]"
	echo "" 
fi

#2.2.10
httpd=$(rpm -q httpd)
nginx=$(rpm -q nginx)
if [[ ("$httpd" =~ "not installed") && ("$nginx" =~ "not installed") ]]
then
        printf "%-77s %s\n" "2.2.10 Ensure a web server is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.10 Ensure a web server is not installed" "[fail]"
	echo "" 
fi

#2.2.11
imap=$(rpm -q cyrus-imapd)
pop3=$(rpm -q dovecot)
if [[ ("$imap" =~ "not installed") && ("$pop3" =~ "not installed") ]]
then
        printf "%-77s %s\n" "2.2.11 Ensure IMAP and POP3 server is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.11 Ensure IMAP and POP3 server is not installed" "[fail]"
	echo "" 
fi

#2.2.12
samba=$(rpm -q samba)
if [[ "$samba" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.12 Ensure Samba is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.12 Ensure Samba is not installed" "[fail]"
	echo "" 
fi

#2.2.13
squid=$(rpm -q squid)
if [[ "$squid" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.13 Ensure HTTP Proxy Server is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.13 Ensure HTTP Proxy Server is not installed" "[fail]"
	echo "" 
fi

#2.2.14
net_snmp=$(rpm -q net-snmp)
if [[ "$net_snmp" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.14 Ensure net-snmp is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.14 Ensure net-snmp is not installed" "$warning"
	echo "" WCOUNTER=WCOUNTER+1
fi

#2.2.15
ypserv=$(rpm -q ypserv)
if [[ "$ypserv" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.15 Ensure NIS Server is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.15 Ensure NIS Server is not installed" "$warning"
	echo "" WCOUNTER=WCOUNTER+1
fi

#2.2.16
telnet_server=$(rpm -q telnet-server)
if [[ "$telnet_server" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.2.16 Ensure telnet-server is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.16 Ensure telnet-server is not installed" "$warning"
	echo "" WCOUNTER=WCOUNTER+1
fi

#2.2.17
MTA=$(ss -lntu | grep -E ':25\s' | grep -E -v '\s(127.0.0.1|\[?::1\]?):25\s')
if [ -z "$MTA" ]
then
        printf "%-77s %s\n" "2.2.17 Ensure mail transfer agent is configured for local-only mode" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.17 Ensure mail transfer agent is configured for local-only mode" "[fail]"
	echo "" 
fi

#2.2.18
nfs_utils=$(rpm -q nfs-utils)
nfs_server=$(systemctl is-enabled nfs-server)
if [[ ("$nfs_utils" =~ "not installed") || ("$nfs_server" == "masked") ]]
then
        printf "%-77s %s\n" "2.2.18 Ensure nfs-utils is not installed or the nfs-server service is masked" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.18 Ensure nfs-utils is not installed or the nfs-server service is masked" "[fail]"
	echo "" 
fi

#2.2.19
rpcbind=$(rpm -q rpcbind)
rpc_services=$(systemctl is-enabled rpcbind)
rpc_socket=$(systemctl is-enabled rpcbind.socket)
if [[ ("$rpcbind" =~ "not installed") || (("$rpc_services" == "masked") && ("$rpc_socket" == "masked")) ]]
then
        printf "%-77s %s\n" "2.2.19 Ensure rpcbind is not installed or the rpcbind services are masked" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.19 Ensure rpcbind is not installed or the rpcbind services are masked" "[fail]"
	echo "" 
fi

#2.2.20
rsync=$(rpm -q rsync)
rsyncd_service=$(systemctl is-enabled rsyncd)
if [[ ("$rsync" =~ "not installed") || ("$rsyncd_service" == "masked") ]]
then
        printf "%-77s %s\n" "2.2.20 Ensure rsync is not installed or the rsyncd service is masked" "[pass]"
	echo "" 
else
        printf "%-77s %s\n" "2.2.20 Ensure rsync is not installed or the rsyncd service is masked" "[fail]"
	echo "" 
fi

#2.3.1
echo $''2.3 Service Clients$''
ypbind=$(rpm -q ypbind)
if [[ "$ypbind" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.3.1 Ensure NIS Client is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n"  "2.3.1 Ensure NIS Client is not installed" "$warning"
	echo "" WCOUNTER=WCOUNTER+1
fi

#2.3.2
rsh=$(rpm -q rsh)
if [[ "$rsh" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.3.2 Ensure rsh client is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n"  "2.3.2 Ensure rsh client is not installed" "$warning"
	echo "" WCOUNTER=WCOUNTER+1
fi

#2.3.3
talk=$(rpm -q talk)
if [[ "$talk" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.3.3 Ensure talk client is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n"  "2.3.3 Ensure talk client is not installed" "$warning"
	echo "" WCOUNTER=WCOUNTER+1
fi

#2.3.4
telnet=$(rpm -q telnet)
if [[ "$telnet" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.3.4 Ensure telnet client is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n"  "2.3.4 Ensure telnet client is not installed" "$warning"
	echo "" WCOUNTER=WCOUNTER+1
fi

#2.3.5
ldap=$(rpm -q openldap-clients)
if [[ "$ldap" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.3.5 Ensure LDAP client is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n"  "2.3.5 Ensure LDAP client is not installed" "$warning"
	echo "" WCOUNTER=WCOUNTER+1
fi

#2.3.6
tftp=$(rpm -q tftp)
if [[ "$tftp" =~ "not installed" ]]
then
        printf "%-77s %s\n" "2.3.6 Ensure TFTP client is not installed" "[pass]"
	echo "" 
else
        printf "%-77s %s\n"  "2.3.6 Ensure TFTP client is not installed" "[fail]"
	echo "" 
fi

#2.4
non=$(lsof -i -P -n | grep -v "(ESTABLISHED)")
printf "%-77s %s\n" "2.4 Ensure nonessential services are removed or masked" "$na"
let NCOUNTER=NCOUNTER+1

}

function trans3() {

{
echo " "
}

{
echo "${lightyellow}${bold}3 Network Configurations:${normal}${default}"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
printf "%-77s %s\n" "Title" "Status"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo "${lightpurple}${bold}3.1 Disable unused network protocols and devices:${normal}${default}"
}

{
check_ipv6()
{
output=""
grubfile=$(find /boot -type f \( -name 'grubenv' -o -name 'grub.conf' -o -name 'grub.cfg' \) -exec grep -Pl -- '^\h*(kernelopts=|linux|kernel)' {} \;)
searchloc="/run/sysctl.d/*.conf /etc/sysctl.d/*.conf /usr/local/lib/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /lib/sysctl.d/*.conf /etc/sysctl.conf"

if [ -s "$grubfile" ];
then
	! grep -P -- "^\h*(kernelopts=|linux|kernel)" "$grubfile" | grep -vq -- ipv6.disable=1 && output="IPv6 Disabled in \"$grubfile\""
fi

if grep -Pqs -- "^\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\h*(#.*)?$" $searchloc && \ grep -Pqs -- "^\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\h*(#.*)?$" $searchloc && \ sysctl net.ipv6.conf.all.disable_ipv6 | grep -Pqs -- "^\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\h*(#.*)?$" && \ sysctl net.ipv6.conf.default.disable_ipv6 | grep -Pqs -- "^\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\h*(#.*)?$";
then
	[ -n "$output" ] && output="$output, and in sysctl config" || output="ipv6 disabled in sysctl config"
fi
[ -n "$output" ] && echo "[${lightred}FAIL${normal}]" || echo "[${lightgreen}PASS${normal}]"
}
printf "%-77s %s\n" "3.1.1 Verify if IPv6 is enabled on the system" "$na"
}

{
output=""
if lsmod | grep sctp
then
        output=$( echo  "[${lightred}FAIL${normal}]" )
	echo "" 
else
    	output=$( echo  "[${lightgreen}PASS${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.1.2 Ensure SCTP is disabled" "$output"
}

{
output=""
if lsmod | grep dccp
then
        output=$( echo  "[${lightred}FAIL${normal}]" )
	echo "" 

else
        output=$( echo  "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.1.3 Ensure DCCP is disabled" "$output"
}

{
output=""
if command -v nmcli >/dev/null 2>&1 ;
then
        if nmcli radio all | grep -Eq '\s*\S+\s+disabled\s+\S+\s+disabled\b';
                then
                        output=$( echo "[${lightgreen}PASS${normal}]" )
			echo "" 

                else
                        output=$( echo "[${lightred}FAIL${normal}]" )
			echo "" 

        fi
        printf "%-77s %s\n" "3.1.4 Ensure wireless interfaces are disabled" "$output"
fi
}

{
echo "${lightpurple}${bold}3.2 Network Parameters (Host Only):${normal}${default}"
}

{
krp=""
krp2=""
kpname="net.ipv4.ip_forward"
kpname2="net.ipv6.conf.all.forwarding"
kpvalue="1"
krp="$(sysctl "$kpname" | awk -F= '{print $2}' | xargs)"
krp2="$(sysctl "$kpname2" | awk -F= '{print $2}' | xargs)"
output=""
if [ "$krp" = "$kpvalue" ] || [ "$krp2" = "$kpvalue" ];
then
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.2.1 Ensure IP forwarding is disabled" "$output"
}

{
krp=""
krp2=""
kpname="net.ipv4.conf.all.send_redirects"
kpname2="net.ipv4.conf.default.send_redirects"
kpvalue="1"
krp="$(sysctl "$kpname" | awk -F= '{print $2}' | xargs)"
krp2="$(sysctl "$kpname2" | awk -F= '{print $2}' | xargs)"
output=""
if [ "$krp" = "$kpvalue" ] || [ "$krp2" = "$kpvalue" ];
then
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.2.2 Ensure packet redirect sending is disabled" "$output"
}

{
echo "${lightpurple}${bold}3.3 Network Parameters (Host and Router):${normal}${default}"
}


{
krp=""
krp2=""
krp3=""
krp4=""
kpname="net.ipv4.conf.all.accept_source_route"
kpname2="net.ipv4.conf.default.accept_source_route"
kpname3="net.ipv6.conf.all.accept_source_route"
kpname4="net.ipv6.conf.default.accept_source_route"
kpvalue="1"
krp="$(sysctl "$kpname" | awk -F= '{print $2}' | xargs)"
krp2="$(sysctl "$kpname2" | awk -F= '{print $2}' | xargs)"
krp3="$(sysctl "$kpname3" | awk -F= '{print $2}' | xargs)"
krp4="$(sysctl "$kpname4" | awk -F= '{print $2}' | xargs)"
output=""
if [ "$krp" = "$kpvalue" ] || [ "$krp2" = "$kpvalue" ] || [ "$krp3" = "$kpvalue" ] || [ "$krp4" = "$kpvalue" ];
then
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$output"
}

{
krp=""
krp2=""
krp3=""
krp4=""
kpname="net.ipv4.conf.all.accept_redirects"
kpname2="net.ipv4.conf.default.accept_redirects"
kpname3="net.ipv6.conf.all.accept_redirects"
kpname4="net.ipv6.conf.default.accept_redirects"
kpvalue="1"
krp="$(sysctl "$kpname" | awk -F= '{print $2}' | xargs)"
krp2="$(sysctl "$kpname2" | awk -F= '{print $2}' | xargs)"
krp3="$(sysctl "$kpname3" | awk -F= '{print $2}' | xargs)"
krp4="$(sysctl "$kpname4" | awk -F= '{print $2}' | xargs)"
output=""
if [ "$krp" = "$kpvalue" ] || [ "$krp2" = "$kpvalue" ] || [ "$krp3" = "$kpvalue" ] || [ "$krp4" = "$kpvalue" ];
then
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$output"
}

{
krp=""
krp2=""
kpname="net.ipv4.conf.all.secure_redirects"
kpname2="net.ipv4.conf.default.secure_redirects"
kpvalue="1"
krp="$(sysctl "$kpname" | awk -F= '{print $2}' | xargs)"
krp2="$(sysctl "$kpname2" | awk -F= '{print $2}' | xargs)"
output=""
if [ "$krp" = "$kpvalue" ] || [ "$krp2" = "$kpvalue" ];
then
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.3.3 Ensure secure ICMP redirects are not accepted" "$output"
}

{
krp=""
krp2=""
kpname="net.ipv4.conf.all.log_martians"
kpname2="net.ipv4.conf.default.log_martians"
kpvalue="0"
krp="$(sysctl "$kpname" | awk -F= '{print $2}' | xargs)"
krp2="$(sysctl "$kpname2" | awk -F= '{print $2}' | xargs)"
output=""
if [ "$krp" = "$kpvalue" ] || [ "$krp2" = "$kpvalue" ];
then
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.3.4 Ensure suspicious packets are logged" "$output"
}

{
krp=""
kpname="net.ipv4.icmp_echo_ignore_broadcasts"
kpvalue="0"
krp="$(sysctl "$kpname" | awk -F= '{print $2}' | xargs)"
output=""
if [ "$krp" = "$kpvalue" ];
then
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.3.5 Ensure broadcast ICMP requests are ignored" "$output"
}

{
krp=""
kpname="net.ipv4.icmp_ignore_bogus_error_responses"
kpvalue="0"
krp="$(sysctl "$kpname" | awk -F= '{print $2}' | xargs)"
output=""
if [ "$krp" = "$kpvalue" ];
then
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.3.6 Ensure bogus ICMP responses are ignored" "$output"
}

{
krp=""
krp2=""
kpname="net.ipv4.conf.all.rp_filter"
kpname2="net.ipv4.conf.default.rp_filter"
kpvalue="0"
krp="$(sysctl "$kpname" | awk -F= '{print $2}' | xargs)"
krp2="$(sysctl "$kpname2" | awk -F= '{print $2}' | xargs)"
output=""
if [ "$krp" = "$kpvalue" ] || [ "$krp2" = "$kpvalue" ];
then
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.3.7 Ensure Reverse Path Filtering is enabled" "$output"
}

{
krp=""
kpname="net.ipv4.tcp_syncookies"
kpvalue="0"
krp="$(sysctl "$kpname" | awk -F= '{print $2}' | xargs)"
output=""
if [ "$krp" = "$kpvalue" ];
then
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.3.8 Ensure TCP SYN Cookies is enabled" "$output"
}

{
krp=""
krp2=""
kpname="net.ipv6.conf.all.accept_ra"
kpname2="net.ipv6.conf.default.accept_ra"
kpvalue="1"
krp="$(sysctl "$kpname" | awk -F= '{print $2}' | xargs)"
krp2="$(sysctl "$kpname2" | awk -F= '{print $2}' | xargs)"
output=""
if [ "$krp" = "$kpvalue" ] || [ "$krp2" = "$kpvalue" ];
then
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.3.9 Ensure IPv6 router advertisements are not accepted" "$output"
}


{
echo "${lightpurple}${bold}3.4 Firewall Configuration${normal}${default}"
}

{
	echo $''\[+\]   3.4.1 Configure firewalld$''
}

{
output=""
if rpm -q firewalld iptables | grep "firewalld-" &> /dev/null
then
    	if rpm -q firewalld iptables | grep "iptables-" &> /dev/null
        then
            	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "3.4.1.1 Ensure firewalld is installed" "$output"
}

{
output=""
if rpm -q iptables-services | grep "not installed" &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.1.2 Ensure iptables-services not installed with firewalld" "$output"
}

{
output=""
if rpm -q nftables | grep "not installed" &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	if systemctl is-enabled nftables | grep "masked" &> /dev/null
        then
            	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
	fi
fi
printf "%-77s %s\n" "3.4.1.3 Ensure nftables either not installed / masked with firewalld" "$output"
}

{
output=""
if systemctl is-enabled firewalld | grep "enabled" &> /dev/null
then
        if firewall-cmd --state | grep "running" &> /dev/null
        then
                output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.1.4 Ensure firewalld service enabled and running" "$output"
}

{
output=""
command_output=$(firewall-cmd --get-default-zone &> /dev/null)
if [ -n "$command_output" ] 
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.1.5 Ensure firewalld default zone is set" "$output"
}

{
#output=""
#command_output=$(find /sys/class/net/* -maxdepth 1 | awk -F"/" '{print $NF}' | while read -r netint; do [ "$netint" != "lo" ] && firewall-cmd --get-active-zones | grep -B1 $netint; done)
#if [ ! -z "$command_output" ]
#then
#        output=$( echo -e " [${lightgreen}PASS${normal}]" )
#else
#        output=$( echo -e " [${lightred}FAIL${normal}]" )
#fi
printf "%-77s %s\n" "3.4.1.6 Ensure network interfaces are assigned to appropriate zone" "$na"
echo ""
}

{
#output=""
#command_output=$(find /sys/class/net/* -maxdepth 1 | awk -F"/" '{print $NF}' | while read -r netint; do [ "$netint" != "lo" ] && firewall-cmd --get-active-zones | grep -B1 $netint; done)
#if [ ! -z "$command_output" ]
#then
#        output=$( echo -e " [${lightgreen}PASS${normal}]" )
#else
#        output=$( echo -e " [${lightred}FAIL${normal}]" )
#fi
printf "%-77s %s\n" "3.4.1.7 Ensure firewalld drops unnecessary services and ports" "$na"
echo ""

}

{
	echo $''\[+\]   3.4.2 Configure nftables$''
}

{
output=""
if rpm -q nftables | grep "nftables-" &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.2.1 Ensure nftables is installed" "$output"
}

{
output=""
if rpm -q firewalld | grep "not installed" &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	if systemctl is-enabled firewalld | grep "masked"
        then
                output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
	fi
fi
printf "%-77s %s\n" "3.4.2.2 Ensure firewalld either not installed / masked with nftables" "$output"
}

{
output=""
if rpm -q iptables-services | grep "not installed" &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi

printf "%-77s %s\n" "3.4.2.3 Ensure iptables-services not installed with nftables" "$output"
}

{
#output=""
#command_output=$( iptables -L | grep -iv chain | grep -vi "target" | tr -d '\n' )
#command_output2=$( ip6tables -L | grep -iv chain | grep -vi "target" | tr -d '\n' )
#if [ -z "$command_output"  ] && [ -z "$command_output2"  ]
#then
#        output=$( echo -e " [${lightgreen}PASS${normal}]" )
#else
#        output=$( echo -e " [${lightred}FAIL${normal}]" )
#fi
printf "%-77s %s\n" "3.4.2.4 Ensure iptables are flushed with nftables" "$na"
echo ""
}

{
output=""
if nft list tables | grep "table" &> /dev/null
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.2.5 Ensure a nftables table exists" "$output"
}

{
output=""
if nft list ruleset | grep 'hook input' &> /dev/null
then
        if nft list ruleset | grep 'hook forward' &> /dev/null
    	then
                if nft list ruleset | grep 'hook input' &> /dev/null
                then
                        output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 
                else
                        output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 
                fi
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
        fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.2.6 Ensure nftables base chains exist" "$output"
}

{
output=""
command_output=$( ./ip6check.sh )
if nft list ruleset | awk '/hook input/,/}/' | grep 'iif "lo" accept'; then
        if nft list ruleset | awk '/hook input/,/}/' | grep 'ip saddr' | grep '127';
        then
            	if nft list ruleset | awk '/hook input/,/}/' | grep 'ip6 saddr';
                then
                        output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 
                elif echo "$command_output" | grep "disabled";
		then
                        output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 
                else
                    	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 
                fi
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
        fi
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.2.7 Ensure nftables loopback traffic is configured" "$output"
}

{
#output=""
#command_output=$(nft list ruleset | awk '/hook input/,/}/' | grep -E 'ip protocol (tcp|udp|icmp) ct state')
#command_output2=$(nft list ruleset | awk '/hook output/,/}/' | grep -E 'ip protocol (tcp|udp|icmp) ct state')
#if [ ! -z "$command_output" ] && [ ! -z "$command_output2" ]
#then
#    	output=$( echo -e " [${lightgreen}PASS${normal}]" )
#else
#    	output=$( echo -e " [${lightred}FAIL${normal}]" )
#fi
printf "%-77s %s\n" "3.4.2.8 Ensure firewalld drops unnecessary services and ports" "$na"
echo ""
}

{
output=""
if [[ -z $( nft list ruleset | grep 'hook input' | grep 'policy drop' ) ]]
then
    	if [[ -z $( nft list ruleset | grep 'hook forward' | grep 'policy drop' ) ]]
        then
		if [[ -z $( nft list ruleset | grep 'hook output' | grep 'policy drop' ) ]]
                then
                    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 
                else
                    	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 
                fi
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
        fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.2.9 Ensure nftables default deny firewall policy" "$output"
}

{
output=""
if systemctl is-enabled nftables | grep 'enabled'
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.2.10 Ensure nftables service is enabled" "$output"
}

{
output=""
command_output=$(nft list ruleset | awk '/hook input/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print $2 }' /etc/sysconfig/nftables.conf))
command_output2=$(nft list ruleset | awk '/hook forward/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print $2 }' /etc/sysconfig/nftables.conf))
command_output3=$(nft list ruleset | awk '/hook output/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print $2 }' /etc/sysconfig/nftables.conf))
if [ ! -z "$command_output" ] && [ ! -z "$command_output2" ] && [ ! -z "$command_output3" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.2.11 Ensure nftables rules are permanent" "$output"
}

{
	echo $''\[+\]   3.4.3 Configure iptables$''
}


{
output=""
if rpm -q iptables iptables-services | grep "iptables-" &> /dev/null
then
    	if rpm -q iptables iptables-services | grep "iptables-services-" &> /dev/null
        then
            	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 
	else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.1.1 Ensure iptables packages are installed" "$output"
}

{
output=""
if rpm -q nftables | grep "not installed"
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.1.2 Ensure nftables is not installed with iptables" "$output"
}

{
output=""
if rpm -q firewalld | grep "not installed"
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

elif [ -z $( systemctl status firewalld | grep "Active: " | grep -v "active (running) "&> /dev/null ) ]
then
    	if systemctl is-enabled firewalld | grep "masked"
        then
            	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
        fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.1.3 Ensure firewalld is either not installed or masked with iptables" "$output"
}

{
echo " "
}

{
output=""
if iptables -L INPUT -v -n | grep "ACCEPT" &> /dev/null
then
    	if iptables -L INPUT -v -n | grep "DROP" &> /dev/null
        then
            	if iptables -L OUTPUT -v -n | grep "ACCEPT" &> /dev/null
                then
                    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 
                else
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 
                fi
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
        fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.2.1 Ensure iptables loopback traffic is configured" "$output"
}

{
#output=""
#command_output=$( iptables -L -v -n )
#if [ ! -z "$command_output"  ]
#then
#        output=$( echo -e " [${lightgreen}PASS${normal}]" )
#else
#    	output=$( echo -e " [${lightred}FAIL${normal}]" )
#fi
printf "%-77s %s\n" "3.4.3.2.2 Ensure iptables outbound and established connections are configured" "$na"
echo ""
}

{
output=""
if (iptables -L INPUT -v -n | grep "tcp dpt:" &> /dev/null) || (iptables -L INPUT -v -n | grep "udp dpt:")
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.2.3 Ensure iptables rules exist for all open ports" "$output"
}

{
output=""
if iptables -L | grep "Chain INPUT (policy DROP)"
then
        if iptables -L | grep "Chain FORWARD (policy DROP)"
    	then
                if iptables -L | grep "Chain OUTPUT (policy DROP)"
                then
                        output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 
                else
                    	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 
                fi
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
        fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.2.4 Ensure iptables default deny firewall policy" "$output"
}

{
FILE=/etc/sysconfig/iptables
if test -f "$FILE";
then
    output=$( echo -e "[${lightgreen}PASS${normal}]" )
    echo "" 

else
    output=$( echo -e "[${lightred}FAIL${normal}]" )
    echo "" 
fi
printf "%-77s %s\n" "3.4.3.2.5 Ensure iptables rules are saved" "$output"
}

{
output=""
if systemctl is-enabled iptables | grep "enabled" &> /dev/null
then
    	if systemctl is-active iptables.service | grep "active" &> /dev/null
        then
                output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
        fi
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.2.6 Ensure iptables is enabled and active" "$output"
}

{
output=""
command_output=$( ./ip6check.sh )
if echo "$command_output" | grep "disabled"
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

elif ip6tables -L INPUT -v -n | grep "ACCEPT" &> /dev/null
then
    	if ip6tables -L INPUT -v -n | grep "DROP" &> /dev/null
        then
            	if ip6tables -L OUTPUT -v -n | grep "ACCEPT" &> /dev/null
                then
                    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 
                else
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 
                fi
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.3.1 Ensure ip6tables loopback traffic is configured" "$output"
}

{
#output=""
#command_output=$( ip6tables -L -v -n )
#if [ ! -z "$command_output"  ]
#then
#        output=$( echo -e " [${lightgreen}PASS${normal}]" )
#else
#    	output=$( echo -e " [${lightred}FAIL${normal}]" )
#fi
printf "%-77s %s\n" "3.4.3.3.2 Ensure ip6tables outbound and established connections are configured" "$na"
echo ""
}

{
output=""
command_output=$( ./ip6check.sh )
if echo "$command_output" | grep "disabled"
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

elif (ip6tables -L INPUT -v -n | grep "tcp dpt:") &> /dev/null || (ip6tables -L INPUT -v -n | grep "udp dpt:") &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.3.3 Ensure iptables rules exist for all open ports" "$output"
}

{
output=""
command_output=$( ./ip6check.sh )
if echo "$command_output" | grep "disabled"
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

elif iptables -L | grep "Chain INPUT (policy DROP)"
then
    	if iptables -L | grep "Chain FORWARD (policy DROP)"
        then
            	if iptables -L | grep "Chain OUTPUT (policy DROP)"
                then
                    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 
                else
                    	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 
                fi
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
        fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.3.4 Ensure ip6tables default deny firewall policy" "$output"
}

{
FILE=/etc/sysconfig/ip6tables
command_output=$( ./ip6check.sh )
if echo "$command_output" | grep "disabled"
then
	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

elif test -f "$FILE";
then
	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.3.5 Ensure ip6tables rules are saved" "$output"
}

{
output=""
command_output=$( ./ip6check.sh )
if echo "$command_output" | grep "disabled"
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

elif systemctl is-enabled ip6tables 2> /dev/null | grep "enabled"
then
        if systemctl is-active ip6tables.service | grep "active"
        then
            	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
        fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "3.4.3.3.6 Ensure ip6tables is enabled and active" "$output"
}

}

function trans4() {

#global variables
UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)

echo
echo -e "4 Logging and Auditing"
echo --------------------------------------------------------------------------------------
printf "%-77s %s\n" "Title" "Status"
echo --------------------------------------------------------------------------------------
echo -e "4.1 Configure System Accounting (auditd)"
echo -e "[+]   4.1.1 Ensure auditing is enabled"

#4.1.1.1
check=$(rpm -q audit)
if [[ $check == *"not installed"* ]]; 
then
	printf "%-77s %s\n" "4.1.1.1 Ensure auditd is installed" "[fail]"
	echo "" 

else
	printf "%-77s %s\n" "4.1.1.1 Ensure auditd is installed" "[pass]"
	echo "" 
fi

#4.1.1.2
if [[ $(systemctl is-enabled auditd | grep enabled | wc -l) -ne 1 ]]; 
then
	printf "%-77s %s\n" "4.1.1.2 Ensure auditd is enabled" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "4.1.1.2 Ensure auditd is enabled" "[pass]"
        echo "" 

fi

#4.1.1.3
if [ $(find /boot -type f -name 'grubenv' -exec grep -P 'kernelopts=([^#\n\r]+\h+)?(audit=1)' {} \; | wc -l ) -ne 1 ]; 
then
	printf "%-77s %s\n" "4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled" "[pass]"
        echo "" 

fi

#4.1.1.4
if [ $(find /boot -type f -name 'grubenv' -exec grep -P 'kernelopts=([^#\n\r]+\h+)?(audit_backlog_limit=\S+\b)' {} \; | wc -l ) -ne 1 ];
then
	printf "%-77s %s\n" "4.1.1.4 Ensure audit_backlog_limit is sufficient" "[fail]"
	echo "" 
else
	printf "%-77s %s\n" "4.1.1.4 Ensure audit_backlog_limit is sufficient" "[pass]"
	echo "" 

fi

echo -e "[+]   4.1.2 Configure Data Retention"

#4.1.2.1
if [ $(grep -w "^\s*max_log_file\s*=" /etc/audit/auditd.conf | wc -l) -eq 0 ]; 
then
	printf "%-77s %s\n" "4.1.2.1 Ensure audit log storage size is configured" "[fail]"
	echo "" 

else
	printf "%-77s %s\n" "4.1.2.1 Ensure audit log storage size is configured" "[pass]"
        echo "" 
fi

#4.1.2.2
if [ $(grep max_log_file_action /etc/audit/auditd.conf | grep keep_logs | wc -l) -eq 0 ]; 
then
	printf "%-77s %s\n" "4.1.2.2 Ensure audit logs are not automatically deecho ""ed" "[fail]"
	echo "" 

else
	printf "%-77s %s\n" "4.1.2.2 Ensure audit logs are not automatically deecho ""ed" "[pass]"
	echo "" 
fi

#4.1.2.3
if [ $(grep -E 'space_left_action|action_mail_acct =' /etc/audit/auditd.conf | wc -l) -eq 3 ] &&
[ $(grep -E 'admin_space_left_action\s*=\s*(halt|single)' /etc/audit/auditd.conf | grep -E 'halt|single' | wc -l) -ne 0 ]; 
then
	printf "%-77s %s\n" "4.1.2.3 Ensure system is disabled when audit logs are full" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.1.2.3 Ensure system is disabled when audit logs are full" "[fail]"
	echo "" 
fi

echo -e "[+]  4.1.3 Configure auditd rules"

#4.1.3.1
if [ $(awk '/^ *-w/ \
&&/\/etc\/sudoers/ \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -eq 2 ];
  
then
	printf "%-77s %s\n" "4.1.3.1 Ensure changes to system administration scope (sudoers) is collected" "[pass]"
	echo "" 
else
	printf "%-77s %s\n" "4.1.3.1 Ensure changes to system administration scope (sudoers) is collected" "[fail]"
	echo "" 
fi

#4.1.3.2
if [ $(awk '/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&(/ -C *euid!=uid/||/ -C *uid!=euid/) \
&&/ -S *execve/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -eq 2 ] &&
[ $(auditctl -l | awk '/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&(/ -C *euid!=uid/||/ -C *uid!=euid/) \
&&/ -S *execve/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l) -eq 2 ];  
then
	printf "%-77s %s\n" "4.1.3.2 Ensure actions as another user are always logged" "[pass]"
	echo "" 

else
	printf "%-77s %s\n" "4.1.3.2 Ensure actions as another user are always logged" "[fail]"
	echo "" 
fi

#4.1.3.3
SUDO_LOG_FILE_ESCAPED=$(grep -r logfile /etc/sudoers* | sed -e 's/.*logfile=//;s/,? .*//' -e 's/"//g' -e 's|/|\\/|g')
if [ $([ -n "${SUDO_LOG_FILE_ESCAPED}" ] && awk "/^ *-w/ \
&&/"${SUDO_LOG_FILE_ESCAPED}"/ \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules | wc -l) -eq 1 ] &&

[ $([ -n "${SUDO_LOG_FILE_ESCAPED}" ] && auditctl -l | awk "/^ *-w/ \
&&/"${SUDO_LOG_FILE_ESCAPED}"/ \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" | wc -l) -eq 1 ]; 
then
	printf "%-77s %s\n" "4.1.3.3 Ensure events that modify the sudo log file are collected" "[pass]"
	echo "" 

else
	printf "%-77s %s\n" "4.1.3.3 Ensure events that modify the sudo log file are collected" "[fail]"
	echo "" 
fi

#4.1.3.4
if [ $(awk '/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&/ -S/ \
&&(/adjtimex/ \
||/settimeofday/ \
||/clock_settime/ ) \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -ge 2  ] &&
 [ $(awk '/^ *-w/ \
&&/\/etc\/localtime/ \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l ) -eq 1 ] &&
[ $(auditctl -l | awk '/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&/ -S/ \
&&(/adjtimex/ \
||/settimeofday/ \
||/clock_settime/ ) \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l) -ge 2 ] &&
[ $(auditctl -l | awk '/^ *-w/ \
&&/\/etc\/localtime/ \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l) -eq 1 ];    
then
	printf "%-77s %s\n" "4.1.3.4 Ensure events that modify date and time information are collected" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.1.3.4 Ensure events that modify date and time information are collected" "[fail]"
	echo "" 
fi

#4.1.3.5
if [ $(awk '/^ *-w/ \
&&(/\/etc\/issue/ \
||/\/etc\/issue.net/ \
||/\/etc\/hosts/ \
||/\/etc\/sysconfig\/network/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -eq 2 ] &&

[ $(awk '/^ *-w/ \
&&(/\/etc\/issue/ \
||/\/etc\/issue.net/ \
||/\/etc\/hosts/ \
||/\/etc\/sysconfig\/network/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -eq 5 ] &&

[ $(auditctl -l | awk '/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&/ -S/ \
&&(/sethostname/ \
||/setdomainname/) \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l) -eq 2 ] &&

[ $(auditctl -l | awk '/^ *-w/ \
&&(/\/etc\/issue/ \
||/\/etc\/issue.net/ \
||/\/etc\/hosts/ \
||/\/etc\/sysconfig\/network/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l) -eq 5 ];


then
	printf "%-77s %s\n" "4.1.3.5 Ensure events that modify the system's network environment are" "[pass]"
	echo "	collected"
        echo "" 
else
	printf "%-77s %s\n" "4.1.3.5 Ensure events that modify the system's network environment are" "[fail]"
	echo "	collected"
	echo "" 
fi

#4.1.3.6
printf "%-77s %s\n" "4.1.3.6 Ensure use of privileged commands are collected" "$na"
echo ""
echo


#4.1.3.7
if [ $([ -n "${UID_MIN}" ] && awk "/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&(/ -F *exit=-EACCES/||/ -F *exit=-EPERM/) \
&&/ -S/ \
&&/creat/ \
&&/open/ \
&&/truncate/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules | wc -l) -eq 4 ] &&

[ $([ -n "${UID_MIN}" ] && auditctl -l | awk "/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&(/ -F *exit=-EACCES/||/ -F *exit=-EPERM/) \
&&/ -S/ \
&&/creat/ \
&&/open/ \
&&/truncate/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" | wc -l) -eq 4 ]; 
then
	printf "%-77s %s\n" "4.1.3.7 Ensure unsuccessful file access attempts are collected" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.1.3.7 Ensure unsuccessful file access attempts are collected" "[fail]"
	echo "" 
fi

#4.1.3.8
if [ $(awk '/^ *-w/ \
&&(/\/etc\/group/ \
||/\/etc\/passwd/ \
||/\/etc\/gshadow/ \
||/\/etc\/shadow/ \
||/\/etc\/security\/opasswd/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -eq 5 ] &&

[ $(auditctl -l | awk '/^ *-w/ \
&&(/\/etc\/group/ \
||/\/etc\/passwd/ \
||/\/etc\/gshadow/ \
||/\/etc\/shadow/ \
||/\/etc\/security\/opasswd/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l) -eq 5 ];

then
	printf "%-77s %s\n" "4.1.3.8 Ensure events that modify user/group information are collected" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.1.3.8 Ensure events that modify user/group information are collected" "[fail]"
	echo "" 
fi


#4.1.3.9
if [ $([ -n "${UID_MIN}" ] && awk "/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -S/ \
&&/ -F *auid>=${UID_MIN}/ \
&&(/chmod/||/fchmod/||/fchmodat/ \
||/chown/||/fchown/||/fchownat/||/lchown/ \
||/setxattr/||/lsetxattr/||/fsetxattr/ \
||/removexattr/||/lremovexattr/||/fremovexattr/) \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules | wc -l) -eq 6 ];

[ $([ -n "${UID_MIN}" ] && auditctl -l | awk "/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -S/ \
&&/ -F *auid>=${UID_MIN}/ \
&&(/chmod/||/fchmod/||/fchmodat/ \
||/chown/||/fchown/||/fchownat/||/lchown/ \
||/setxattr/||/lsetxattr/||/fsetxattr/ \
||/removexattr/||/lremovexattr/||/fremovexattr/) \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" | wc -l) -eq 6 ];
then
	printf "%-77s %s\n" "4.1.3.9 Ensure discretionary access control permission modification events" "[pass]"
        echo "	are collected"
	echo "" 
else
	printf "%-77s %s\n" "4.1.3.9 Ensure discretionary access control permission modification events" "[fail]"
	echo "" 
	echo "	are collected"
fi

#4.1.3.10
if [ $([ -n "${UID_MIN}" ] && awk "/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -S/ \
&&/mount/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules | wc -l) -eq 2 ] &&

[ $([ -n "${UID_MIN}" ] && auditctl -l | awk "/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -S/ \
&&/mount/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" | wc -l) -eq 2 ];
then
	printf "%-77s %s\n" "4.1.3.10 Ensure successful file system mounts are collected" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.1.3.10 Ensure successful file system mounts are collected" "[fail]"
	echo "" 
fi
  

#4.1.3.11
if [ $(awk '/^ *-w/ \
&&(/\/var\/run\/utmp/ \
||/\/var\/log\/wtmp/ \
||/\/var\/log\/btmp/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -eq 3 ] &&

[ $(auditctl -l | awk '/^ *-w/ \
&&(/\/var\/run\/utmp/ \
||/\/var\/log\/wtmp/ \
||/\/var\/log\/btmp/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l) -eq 3 ];

then
	printf "%-77s %s\n" "4.1.3.11 Ensure session initiation information is collected" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.1.3.11 Ensure session initiation information is collected" "[fail]"
	echo "" 
fi
  
#4.1.3.12
if [ $(awk '/^ *-w/ \
&&(/\/var\/log\/lastlog/ \
||/\/var\/run\/faillock/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -eq 2 ] &&

[ $(auditctl -l | awk '/^ *-w/ \
&&(/\/var\/log\/lastlog/ \
||/\/var\/run\/faillock/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l) -eq 2 ];

then
	printf "%-77s %s\n" "4.1.3.12 Ensure login and logout events are collected" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.1.3.12 Ensure login and logout events are collected" "[fail]"
	echo "" 
fi

#4.1.3.13
if [ $([ -n "${UID_MIN}" ] && awk "/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -S/ \
&&(/unlink/||/rename/||/unlinkat/||/renameat/) \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules | wc -l) -eq 2 ] &&

[ $([ -n "${UID_MIN}" ] && auditctl -l | awk "/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -S/ \
&&(/unlink/||/rename/||/unlinkat/||/renameat/) \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" | wc -l) -eq 2 ];

then
	printf "%-77s %s\n" "4.1.3.13 Ensure file deecho ""ion events by users are collected" "[pass]"
	echo "" 
else
	printf "%-77s %s\n" "4.1.3.13 Ensure file deecho ""ion events by users are collected" "[fail]"
	echo "" 
fi

#4.1.3.14
if [ $(awk '/^ *-w/ \
&&(/\/etc\/selinux/ \
||/\/usr\/share\/selinux/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -eq 2 ] &&

[ $(auditctl -l | awk '/^ *-w/ \
&&(/\/etc\/selinux/ \
||/\/usr\/share\/selinux/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l) -eq 2 ];

then
	printf "%-77s %s\n" "4.1.3.14 Ensure events that modify the system's Mandatory Access Controls" "[pass]"
	echo "	are collected"
	echo "" 

else
	printf "%-77s %s\n" "4.1.3.14 Ensure events that modify the system's Mandatory Access Controls" "[fail]"
	echo "	are collected"
	echo "" 
fi

#4.1.3.15
if [ $([ -n "${UID_MIN}" ] && awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/bin\/chcon/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules | wc -l ) -eq 1 ] &&

[ $([ -n "${UID_MIN}" ] && auditctl -l | awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/bin\/chcon/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" | wc -l ) -eq 1 ]; 

then
	printf "%-77s %s\n" "4.1.3.15 Ensure successful and unsuccessful attempts to use the chcon" "[pass]"
        echo "	command are recorded"
	echo "" 

else
	printf "%-77s %s\n" "4.1.3.15 Ensure successful and unsuccessful attempts to use the chcon" "[fail]"
	echo "  command are recorded"
	echo "" 

fi

#4.1.3.16
if [ $([ -n "${UID_MIN}" ] && awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/bin\/setfacl/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules | wc -l ) -eq 1 ] &&

[ $([ -n "${UID_MIN}" ] && auditctl -l | awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/bin\/setfacl/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" | wc -l ) -eq 1 ];

then
	printf "%-77s %s\n" "4.1.3.16 Ensure successful and unsuccessful attempts to use the setfacl" "[pass]"
	echo "  command are recorded"
	echo "" 
else
	printf "%-77s %s\n" "4.1.3.16 Ensure successful and unsuccessful attempts to use the setfacl" "[fail]"
	echo "  command are recorded"
	echo "" 
fi
 
#4.1.3.17
if [ $([ -n "${UID_MIN}" ] && awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/bin\/chacl/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules | wc -l) -eq 1 ] &&

[ $([ -n "${UID_MIN}" ] && auditctl -l | awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/bin\/chacl/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" | wc -l) -eq 1 ];

then
	printf "%-77s %s\n" "4.1.3.17 Ensure successful and unsuccessful attempts to use the chacl" "[pass]"
        echo "  command are recorded"
	echo "" 
else
	printf "%-77s %s\n" "4.1.3.17 Ensure successful and unsuccessful attempts to use the chacl" "[fail]"
	echo "  command are recorded"

	echo "" 
fi
 
#4.1.3.18
if [ $([ -n "${UID_MIN}" ] && awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/sbin\/usermod/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules | wc -l) -eq 1 ] && 

[ $([ -n "${UID_MIN}" ] && auditctl -l | awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/sbin\/usermod/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" | wc -l) -eq 1 ];

then
	printf "%-77s %s\n" "4.1.3.18 Ensure successful and unsuccessful attempts to use the usermod" "[pass]"
        echo "  command are recorded"
	echo "" 
else
	printf "%-77s %s\n" "4.1.3.18 Ensure successful and unsuccessful attempts to use the usermod" "[fail]"
	echo "  command are recorded"
	echo "" 
fi

#4.1.3.19
if [ $(awk '/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F auid!=unset/||/ -F auid!=-1/||/ -F auid!=4294967295/) \
&&/ -S/ \
&&(/init_module/ \
||/finit_module/ \
||/deecho ""e_module/ \
||/create_module/ \
||/query_module/) \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l ) -eq 1 ] &&

[ $([ -n "${UID_MIN}" ] && awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/bin\/kmod/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules | wc -l ) -eq 1 ] &&

[ $(auditctl -l | awk '/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F auid!=unset/||/ -F auid!=-1/||/ -F auid!=4294967295/) \
&&/ -S/ \
&&(/init_module/ \
||/finit_module/ \
||/deecho ""e_module/ \
||/create_module/ \
||/query_module/) \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l ) -eq 1 ] &&

[ $([ -n "${UID_MIN}" ] && auditctl -l | awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/bin\/kmod/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" | wc -l ) -eq 1 ];

then
	printf "%-77s %s\n" "4.1.3.19 Ensure kernel module loading unloading and modification is collected" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.1.3.19 Ensure kernel module loading unloading and modification is collected" "[fail]"
	echo "" 
fi

#4.1.3.20
if [ $(grep "^\s*[^#]" /etc/audit/rules.d/*.rules | tail -1 | grep -e '-e 2' | wc -l ) -eq 1 ];

then
	printf "%-77s %s\n" "4.1.3.20 Ensure the audit configuration is immutable" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.1.3.20 Ensure the audit configuration is immutable" "[fail]"
	echo "" 
fi

#4.1.3.21
printf "%-77s %s\n" "4.1.3.21 Ensure the running and on disk configuration is the same" "$na"
echo ""

echo -e "4.2 Configure Logging"
echo -e "[+]   4.2.1 Configure rsyslog"

#4.2.1.1
if [ $(rpm -q rsyslog | grep 'not installed' | wc -l ) -eq 0 ];  
then
	printf "%-77s %s\n" "4.2.1.1 Ensure rsyslog is installed" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.2.1.1 Ensure rsyslog is installed" "[fail]"
	echo "" 
fi

#4.2.1.2
if [[ $(systemctl is-enabled rsyslog | grep enabled | wc -l) -eq 1 ]]; 
then
	printf "%-77s %s\n" "4.2.1.2 Ensure rsyslog service is enabled" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.2.1.2 Ensure rsyslog service is enabled" "[fail]"
	echo "" 
fi

#4.2.1.3
if [[ $(grep -e ^\s*ForwardToSyslog /etc/systemd/journald.conf 2> /dev/null | grep 'yes' | wc -l) -eq 1 ]]; 
then
	printf "%-77s %s\n" "4.2.1.3 Ensure journald is configured to send logs to rsyslog" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.2.1.3 Ensure journald is configured to send logs to rsyslog" "[fail]"
	echo "" 
fi

#4.2.1.4
if [[ $(grep ^\$FileCreateMode /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null | grep '0640\|0600' | wc -l) -ne 0 ]];
then
	printf "%-77s %s\n" "4.2.1.4 Ensure rsyslog default file permissions configured" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.2.1.4 Ensure rsyslog default file permissions configured" "[fail]"
	echo "" 
fi

#4.2.1.5
printf "%-77s %s\n" "4.2.1.5 Ensure logging is configured" "$na"
echo ""

#4.2.1.6
printf "%-77s %s\n" "4.2.1.6 Ensure rsyslog is configured to send logs to a remote log host" "$na"
echo ""

#4.2.1.7
if [ $(grep '$ModLoad imtcp' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null | wc -l ) -eq 0 ] &&

[ $(grep '$InputTCPServerRun' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null | wc -l ) -eq 0 ] && 

[ $(grep -P -- '^\h*module\(load="imtcp"\)' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null | wc -l ) -eq 0 ] && 

[ $(grep -P -- '^\h*input\(type="imtcp" port="514"\)' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null | wc -l ) -eq 0 ];
 
then
	printf "%-77s %s\n" "4.2.1.7 Ensure rsyslog is not configured to recieve logs from a remote client" "[pass]"
        echo "" 
else
	printf "%-77s %s\n" "4.2.1.7 Ensure rsyslog is not configured to recieve logs from a remote client" "[fail]"
	echo "" 
fi


echo -e "[+]   4.2.2 Configure journald"

#4.2.2.1.1
if [ $(rpm -q systemd-journal-remote | grep 'not installed' | wc -l ) -eq 0 ]; 
then
	printf "%-77s %s\n" "4.2.2.1.1 Ensure systemd-journal-remote is installed" "[pass]"
        echo "" 

else
	printf "%-77s %s\n" "4.2.2.1.1 Ensure systemd-journal-remote is installed" "[fail]"
	echo "" 
fi

#4.2.2.1.2
printf "%-77s %s\n" "4.2.2.1.2 Ensure systemd-journal-remote is configured" "$na"
echo ""


#4.2.2.1.3
if [ $(systemctl is-enabled systemd-journal-upload.service 2> /dev/null | wc -l ) -eq 1 ]
then
	printf "%-77s %s\n" "4.2.2.1.3 Ensure systemd-journal-remote is enabled" "[pass]"
	echo "" 
else
	printf "%-77s %s\n" "4.2.2.1.3 Ensure systemd-journal-remote is enabled" "[fail]"
	echo "" 
fi

#4.2.2.1.4
if [ $(systemctl is-enabled systemd-journal-remote.socket 2> /dev/null | grep 'masked' | wc -l) -eq 1 ];
then
	printf "%-77s %s\n" "4.2.2.1.4 Ensure journald is not configured to recieve logs from a remote" "[pass]"
	echo "	client"
	echo "" 

else
	printf "%-77s %s\n" "4.2.2.1.4 Ensure journald is not configured to recieve logs from a remote" "[fail]"
	echo "	client"
	echo "" 
fi

#4.2.2.2
if [ $(systemctl is-enabled systemd-journald.service 2> /dev/null | grep 'static' | wc -l) -eq 1 ];
then
	printf "%-77s %s\n" "4.2.2.2 Ensure journald service is enabled" "[pass]"
	echo "" 
else
	printf "%-77s %s\n" "4.2.2.2 Ensure journald service is enabled" "[fail]"
	echo "" 
fi

#4.2.2.3
if [ $(grep ^\s*Compress /etc/systemd/journald.conf 2> /dev/null | wc -l) -eq 1 ];
then
	printf "%-77s %s\n" "4.2.2.3 Ensure journald is configured to compress large log files" "[pass]"
	echo "" 
else
	printf "%-77s %s\n" "4.2.2.3 Ensure journald is configured to compress large log files" "[fail]"
	echo "" 
fi

#4.2.2.4
if [ $(grep ^\s*Storage /etc/systemd/journald.conf 2> /dev/null | wc -l) -eq 1 ];
then
	printf "%-77s %s\n" "4.2.2.4 Ensure journald is configured to write logfiles to persistent disk" "[pass]"
	echo "" 
else
	printf "%-77s %s\n" "4.2.2.4 Ensure journald is configured to write logfiles to persistent disk" "[fail]"
	echo "" 	
fi

#4.2.2.5
if [ $(grep ^\s*ForwardToSyslog /etc/systemd/journald.conf 2> /dev/null | wc -l) -eq 0 ];
then
	printf "%-77s %s\n" "4.2.2.5 Ensure journald is not configured to send logs to rsyslog" "[pass]"
	echo "" 
else
	printf "%-77s %s\n" "4.2.2.5 Ensure journald is not configured to send logs to rsyslog" "[fail]"
	echo "" 
fi

#4.2.2.6
printf "%-77s %s\n" "4.2.2.6 Ensure journald log rotation is configured per site policy" "$na"
echo ""

#4.2.2.7
printf "%-77s %s\n" "4.2.2.7 Ensure journald default file permissions configured" "$na"
echo ""

#4.2.3
if [ $(find /var/log/ -type f -perm /g+wx,o+rwx -exec ls -l "{}" + | wc -l) -eq 0 ]; 
then
	printf "%-77s %s\n" "4.2.3 Ensure permissions on all logfiles are configured" "[pass]"
	echo "" 

else
	printf "%-77s %s\n" "4.2.3 Ensure permissions on all logfiles are configured" "[fail]"
	echo "" 
fi

#4.3
printf "%-77s %s\n" "4.3 Ensure logrotate is configured" "$na"
echo ""
echo

}

function trans5() {


{
echo "${lightyellow}${bold}5 Access, Authentication and Authorization:${normal}${default}"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
printf "%-77s %s\n" "Title" "Status"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo "${lightpurple}${bold}5.1 Configure time-based job schedulers:${normal}${default}"
}

{
output=""
if systemctl is-enabled crond | grep "enabled" &> /dev/null
then
	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "5.1.1 Ensure cron daemon is enabled" "$output"
}

{
output=""
if stat /etc/crontab | grep "Access: (0700/drwx------)" &> /dev/null 
then
    	if stat /etc/crontab | grep "Uid: (    0/    root)" &> /dev/null
        then
            	if stat /etc/crontab | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 

		else 
                        output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 

		fi
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.1.2 Ensure permissions on /etc/crontab are configured" "$output"
}

{
output=""
if stat /etc/cron.hourly | grep "Access: (0700/drwx------)" &> /dev/null 
then
    	if stat /etc/cron.hourly | grep "Uid: (    0/    root)" &> /dev/null
        then
                if stat /etc/cron.hourly | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 

		else 
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 
		fi
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.1.3 Ensure permissions on /etc/cron.hourly are configured" "$output"
}

{
output=""
if stat /etc/cron.daily | grep "Access: (0700/drwx------)" &> /dev/null 
then
    	if stat /etc/cron.daily | grep "Uid: (    0/    root)" &> /dev/null
        then
            	if stat /etc/cron.daily | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 

		else 
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 
		fi
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.1.4 Ensure permissions on /etc/cron.daily are configured" "$output"
}

{
output=""
if stat /etc/cron.weekly | grep "Access: (0700/drwx------)" &> /dev/null 
then
    	if stat /etc/cron.weekly | grep "Uid: (    0/    root)" &> /dev/null
        then
            	if stat /etc/cron.weekly | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 

		else 
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 

		fi
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.1.5 Ensure permissions on /etc/cron.weekly are configured" "$output"
}

{
output=""
if stat /etc/cron.monthly | grep "Access: (0700/drwx------)" &> /dev/null 
then
    	if stat /etc/cron.monthly | grep "Uid: (    0/    root)" &> /dev/null
        then
            	if stat /etc/cron.monthly | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 

		else 
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 
		fi
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.1.6 Ensure permissions on /etc/cron.monthly are configured" "$output"
}

{
output=""
if stat /etc/cron.d | grep "Access: (0700/drwx------)" &> /dev/null 
then
    	if stat /etc/cron.d | grep "Uid: (    0/    root)" &> /dev/null
        then
            	if stat /etc/cron.d | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 

		else 
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 
		fi
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.1.7 Ensure permissions on /etc/cron.d are configured" "$output"
}

{
output=""
if [ ! -e /etc/cron.deny ] &> /dev/null
then
    	if [ -e /etc/cron.allow ] &> /dev/null
        then
            	if stat /etc/cron.allow | grep "Access: (0600/-rw-------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
                        echo "" 
                else 
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
                        echo "" 
                fi
        else
            	output=$( echo -e " [${lightred}FAIL${normal}]" )
                echo "" 
        fi
else
        output=$( echo -e " [${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "5.1.8 Ensure cron is restricted to authorized users" "$output"
}

{
if [ ! -e /etc/at.deny ] &> /dev/null
then
    	if [ -e /etc/at.allow ] &> /dev/null
        then
            	if stat /etc/at.allow | grep "grep Access: (0600/-rw-------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
                        echo "" 
                else 
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
                        echo "" 
                fi
        else
            	output=$( echo -e " [${lightred}FAIL${normal}]" )
                echo "" 
        fi
else
        output=$( echo -e " [${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "5.1.9 Ensure at is restricted to authorized users" "$output"
}

{
echo "${lightpurple}${bold}5.2 Configure SSH Server:${normal}${default}"
}

{
output=""
if stat /etc/ssh/sshd_config | grep "Access: (0700/drwx------)" &> /dev/null 
then
        if stat /etc/ssh/sshd_config.rpmasave | grep "Uid: (    0/    root)" &> /dev/null
        then
                if stat /etc/ssh/sshd_config.rpmsave | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 

		else 
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 

		fi
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured" "$output"
}

{
output=""
if find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec stat {} \; | grep "Access: (0640/-rw-r-----)" &> /dev/null 
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	if find /etc/ssh -xdev -type f -name 'ssh_host_*_key'  -exec stat {} \; | grep "Access: (0600/-rw-------)" &> /dev/null
        then 
             	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	else 
             	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
fi
printf "%-77s %s\n" "5.2.2 Ensure permissions on SSH private host key files are configured" "$output"
}

{
output=""
if find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec stat {} \;  | grep "Access: (0644/-rw-r--r--)" &> /dev/null 
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.3 Ensure permissions on SSH public host key files are configured" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Pi '^\h*(allow|deny)(users|groups)\h+\H+(\h+.*)?$' &> /dev/null 
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	if grep -Pi '^\h*(allow|deny)(users|groups)\h+\H+(\h+.*)?$' /etc/ssh/sshd_config &> /dev/null
        then 
             	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	else 
             	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
fi
printf "%-77s %s\n" "5.2.4 Ensure SSH access is limited" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep loglevel &> /dev/null 
then
	if grep -i 'loglevel' /etc/ssh/sshd_config | grep -Evi  '(VERBOSE|INFO)' &> /dev/null
        then 
		output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	else 
		output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	fi
else 
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.5 Ensure SSH LogLevel is appropriate" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i usepam | grep "usepam yes" &> /dev/null 
then
    	if grep -Ei '^\s*UsePAM\s+no' /etc/ssh/sshd_config &> /dev/null
        then 
             	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	else 
             	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	fi
else 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.6 Ensure SSH PAM is enabled" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitrootlogin | grep "permitrootlogin no"  &> /dev/null 
then
    	if grep -Ei '^\s*PermitRootLogin\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
             	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	else 
             	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	fi
else 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.7 Ensure SSH root login is disabled" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep hostbasedauthentication | grep "hostbasedauthentication no" &> /dev/null 
then
    	if grep -Ei '^\s*HostBasedAuthentication\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
             	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	else 
             	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	fi
else 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.8 Ensure SSH HostbasedAuthentication is disabled" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitemptypasswords | grep "permitemptypasswords no" &> /dev/null 
then
    	if grep -Ei '^\s*PermitEmptyPasswords\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
             	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	else 
             	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	fi
else 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.9 Ensure SSH PermitEmptyPasswords is disabled" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permituserenvironment | grep "permituserenvironment no" &> /dev/null 
then
    	if grep -Ei '^\s*PermitUserEnvironment\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
             	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	else 
             	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	fi
else 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.10 Ensure SSH PermitUserEnvironment is disabled" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep ignorerhosts | grep "ignorerhosts yes" &> /dev/null 
then
    	if grep -Ei '^\s*ignorerhosts\s+no' /etc/ssh/sshd_config &> /dev/null
        then 
             	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	else 
             	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	fi
else 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.11 Ensure SSH IgnoreRhosts is enabled" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i x11forwarding | grep "x11forwarding no" &> /dev/null 
then
    	if grep -Ei '^\s*x11forwarding\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
             	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	else 
             	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	fi
else 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.12 Ensure SSH X11 forwarding is disabled" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i allowtcpforwarding | grep "allowtcpforwarding no" &> /dev/null 
then
    	if grep -Ei '^\s*AllowTcpForwarding\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
             	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	else 
             	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	fi
else 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.13 Ensure SSH AllowTcpForwarding is disabled" "$output"
}

{
output=""
if grep -i '^\s*CRYPTO_POLICY=' /etc/sysconfig/sshd &> /dev/null
then 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else 
     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.14 Ensure system-wide crypto policy is not over-ridden" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep banner | grep "banner /etc/issue.net" &> /dev/null
then 
     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.15 Ensure SSH warning banner is configured" "$output"
}

{
output=""
command_output=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep maxauthtries | awk '{print $2}')
if [ $command_output -le 4 ] &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.16 Ensure SSH MaxAuthTries is set to 4 or less" "$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxstartups | grep "maxstartups 10:30:60" &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.17 Ensure SSH MaxStartups is configured" "$output"
}

{
output=""
command_output=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxsessions | awk '{print $2}')
if [ $command_output -le 10 ] &> /dev/null
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.18 Ensure SSH MaxSessions is set to 10 or less" "$output"
}

{
output=""
command_output=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep logingracetime | awk '{print $2}')
if [ $command_output -ge 1 ] && [ $command_output -le 60 ] &> /dev/null
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.19 Ensure SSH LoginGraceTime is set to one minute or less" "$output"
}

{
output=""
command_output=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientaliveinterval | awk '{print $2}')
command_output2=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientalivecountmax | awk '{print $2}')
if [ $command_output -ge 1 ] && [ $command_output -le 900 ] && [ $command_output2 == 0 ] &> /dev/null
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.2.20 Ensure SSH Idle Timeout Interval is configured" "$output"
}

{
echo "${lightpurple}${bold}5.3 Configure privilege escalation:${normal}${default}"
}

{
output=""
if dnf list sudo | grep "sudo.x" &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.3.1 Ensure sudo is installed" "$output"
}

{
output=""
if grep -rPi '^\h*Defaults\h+([^#\n\r]+,)?use_pty(,\h*\h+\h*)*\h*(#.*)?$' /etc/sudoers* | grep "/etc/sudoers:Defaults use_pty" &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.3.2 Ensure sudo commands use pty" "$output"
}

{
output=""
if grep -rPsi "^\h*Defaults\h+([^#]+,\h*)?logfile\h*=\h*(\"|\')?\H+(\"|\')?(,\h*\H+\h*)*\h*(#.*)?$" /etc/sudoers* | grep "/etc/sudoers:Defaults" &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.3.3 Ensure sudo log file exists" "$output"
}

{
output=""
if grep -r "^[^#].*NOPASSWD" /etc/sudoers* &> /dev/null
then 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else 
     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.3.4 Ensure users must provide password for escalation" "$output"
}

{
output=""
if grep -r "^[^#].*\!authenticate" /etc/sudoers* &> /dev/null
then 
     	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

else 
     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.3.5 Ensure re-authentication for privilege escalation is not disabled" "$output"
echo "	globally"
}

{
output=""
if grep -roP "timestamp_timeout=\K[0-9]*" /etc/sudoers*
then
	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
	if sudo -V | grep "Authentication timestamp timeout:" | grep "Authentication timestamp timeout:5.0 minutes"
	then
		output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	else
		output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
fi
printf "%-77s %s\n" "5.3.6 Ensure sudo authentication timeout is configured correctly" "$output"
}

{
output=""
command_output=$( grep -Pi '^\h*auth\h+(?:required|requisite)\h+pam_wheel\.so\h+(?:[^#\n\r]+\h+)?((?!\2)(use_uid\b|group=\H+\b))\h+(?:[^#\n\r]+\h+)?((?!\1)(use_uid\b|group=\H+\b))(\h+.*)?$' /etc/pam.d/su)
if [ -z "$command_output" ]
then
	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 
else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.3.7 Ensure access to the su command is restricted" "$output"
}

{
echo "${lightpurple}${bold}5.4 Configure authselect:${default}${normal}"
}

{
#output=""
#command_output=$(authselect list | grep '^-\s*custom')
#if [ ! -z "$command_output" ]
#then
#    	output=$( echo -e "$na" )
#else
#    	output=$( echo -e "$na" )
#fi
printf "%-77s %s\n" "5.4.1 Ensure custom authselect profile is used" "$na"
echo ""
}

{
output=""
command_output=$(grep pam_faillock.so /etc/pam.d/password-auth /etc/pam.d/system-auth)
if [ ! -z "$command_output" ]
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.4.2 Ensure authselect includes with-faillock" "$output"
}

{
echo "${lightpurple}${bold}5.5 Configure PAM:${default}${normal}"
}

{
output=""
command_output=$(grep ^minlen /etc/security/pwquality.conf | awk '{print $3}')
command_output2=$(grep ^minclass /etc/security/pwquality.conf | awk '{print $3}')
if [ $command_output -ge 14 ] &> /dev/null
then
	if [ $command_output2 == 4 ] &> /dev/null
	then
		output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 
	else
		output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.5.1 Ensure password creation requirements are configured" "$output"
}

{
output=""
command_output=$(grep -E -s '^\s*deny\s*=\s*[1-5]\b' /etc/security/faillock.conf | awk '{print $3}')
command_output2=$(grep -E -s '^\s*unlock_time\s*=\s*(0|9[0-9][0-9]|[1-9][0-9][0-9][0-9]+)\b' /etc/security/faillock.conf | awk '{print $3}')
if [ $command_output -gt 0 ] &> /dev/null
then
    	if [ $command_output -le 5 ] &> /dev/null
        then
		if [ $command_output2 -eq 0 ] || [ $command_output2 -ge 900 ] &> /dev/null
		then
	                output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 
		else
	            	output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 

		fi
	else
	    	output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.5.2 Ensure lockout for failed password attempts is configured" "$output"
}

{
output=""
command_output=$(grep -P '^\h*password\h+(requisite|sufficient)\h+(pam_pwhistory\.so|pam_unix\.so)\h+([^#\n\r]+\h+)?remember=(5)\h*(\h+.*)?$' /etc/pam.d/system-auth)
if [ ! -z "$command_output" ]
then
	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.5.3 Ensure password reuse is limited" "$output"
}

{
output=""
command_output=$(grep -P -- '^\h*password\h+(requisite|required|sufficient)\h+pam_unix\.so(\h+[^#\n\r]+)?\h+sha512\b.*$' /etc/pam.d/password-auth /etc/pam.d/system-auth)
if grep -Ei '^\s*crypt_style\s*=\s*sha512\b' /etc/libuser.conf | grep "crypt_style = sha512" &> /dev/null
then
	if grep -Ei '^\s*ENCRYPT_METHOD\s+SHA512\b' /etc/login.defs | grep "ENCRYPT_METHOD SHA512" &> /dev/null
	then
		if [ ! -z "$command_output" ]
		then
			output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 
		else
			output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 

		fi
	else
		output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.5.4 Ensure password hashing algorithm is SHA-512" "$output"
}

{
echo "${lightpurple}${bold}5.6 User Accounts and Environment:${default}${normal}"
}

{
echo "${orange}[+]	5.6.1 Set Shadow Password Suite Parameters:${normal}"
}

{
output=""
command_output=$(grep PASS_MAX_DAYS /etc/login.defs | awk '{print $2}')
if [ $command_output -gt 0 ] &> /dev/null
then
	if [ $command_output -le 365 ] &> /dev/null
	then
		output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	else
		output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.6.1.1 Ensure password expiration is 365 days or less" "$output"
}

{
output=""
command_output=$(grep ^\s*PASS_MIN_DAYS /etc/login.defs | awk '{print $2}')
if [ $command_output -ge 7 ] &> /dev/null
then
	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.6.1.2 Ensure minimum days between password changes is 7 or more" "$output"
}

{
output=""
command_output=$(grep PASS_WARN_AGE /etc/login.defs | awk '{print $2}')
if [ $command_output -ge 7 ] &> /dev/null
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.6.1.3 Ensure password expiration warning days is 7 or more" "$output"
}

{
output=""
command_output=$(useradd -D | grep INACTIVE | awk '{print $3}')
command_output2=$(awk -F: '/^[^#:]+:[^\!\*:]*:[^:]*:[^:]*:[^:]*:[^:]*:(\s*|-1|3[1-9]|[4-9][0-9]|[1-9][0-9][0-9]+):[^:]*:[^:]*\s*$/ {print $1":"$7}' /etc/shadow)
if [ $command_output -gt 0 ] &> /dev/null
then
	if [ $command_output -le 30 ] &> /dev/null
	then
		if [ -z $command_output2 ]
		then
			output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 

		else
			output=$( echo -e "[${lightred}FAIL${normal}]" )
			echo "" 

		fi
	else
		output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.6.1.4 Ensure inactive password lock is 30 days or less" "$output"
}

whileloop()
{
awk -F: '/^[^:]+:[^!*]/{print $1}' /etc/shadow | while read -r usr;
do 
	change=$(date -d "$(chage --list $usr | grep '^Last password change' | cut -d: -f2 | grep -v 'never$')" +%s);
	if [[ "$change" -gt "$(date +%s)" ]]; 
	then
		echo "User: \"$usr\" last password change was \"$(chage --list $usr | grep '^Last password change' | cut -d: -f2)\""; 
	fi; 
done
}

{
output=""
command_output=$(whileloop)
if [ -z "$command_output" ]
then
	output=$( echo -e  "[${lightgreen}PASS${normal}]" )
	echo "" 

else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.6.1.5 Ensure all users last password change date is in the past" "$output"
}

{
output=""
command_output=$(awk -F: '($1!~/^(root|halt|sync|shutdown|nfsnobody)$/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) {print $1 }' /etc/passwd)
command_output2=$(awk -F: '($1!="root" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"') {print $1}' /etc/passwd | xargs -I '{}' passwd -S '{}' | awk '($2!="L" && $2!="LK") {print $1}')
if [ -z "$command_output" ]
then
	if [ -z "$command_output2" ]
	then
		output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	else
		output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.6.2 Ensure system accounts are secured" "$output"
}

{
output=""
output1="" output2=""
[ -f /etc/bashrc ] && BRC="/etc/bashrc"
for f in "$BRC" /etc/profile /etc/profile.d/*.sh ; 
do
	grep -Pq '^\s*([^#]+\s+)?TMOUT=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9])\b' "$f" && grep -Pq '^\s*([^#]+;\s*)?readonly\s+TMOUT(\s+|\s*;|\s*$|=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9]))\b' "$f" && grep -Pq '^\s*([^#]+;\s*)?export\s+TMOUT(\s+|\s*;|\s*$|=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9]))\b' "$f" && output1="$f"
done
grep -Pq '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh "$BRC" && output2=$(grep -Ps '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh $BRC)
if [ -n "$output1" ] && [ -z "$output2" ]; 
then
	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 
else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.6.3 Ensure default user shell timeout is 900 seconds or less" "$output"
}

{
output=""
if grep "^root:" /etc/passwd | cut -f4 -d: | grep "0" &> /dev/null
then
	output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 

else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.6.4 Ensure default group for the root account is GID 0" "$output"
}

passing()
{
passing=""
grep -Eiq '^\s*UMASK\s+(0[0-7][2-7]7|[0-7][2-7]7)\b' /etc/login.defs && grep -Eqi '^\s*USERGROUPS_ENAB\s*"?no"?\b' /etc/login.defs && grep -Eq '^\s*session\s+(optional|requisite|required)\s+pam_umask\.so\b' /etc/pam.d/common-session && passing=true
grep -REiq '^\s*UMASK\s+\s*(0[0-7][2-7]7|[0-7][2-7]7|u=(r?|w?|x?)(r?|w?|x?)(r?|w?|x?),g=(r?x?|x?r?),o=)\b' /etc/profile* /etc/bashrc* && passing=true
[ "[pass]ing" = true ] && echo "Default user umask is set"
}

{
output=""
command_output=$(passing)
command_output2=$(grep -RPi '(^|^[^#]*)\s*umask\s+([0-7][0-7][01][0-7]\b|[0-7][0-7][0-7][0-6]\b|[0-7][01][0-7]\b|[0-7][0-7][0-6]\b|(u=[rwx]{0,3},)?(g=[rwx]{0,3},)?o=[rwx]+\b|(u=[rwx]{1,3},)?g=[^rx]{1,3}(,o=[rwx]{0,3})?\b)' /etc/login.defs /etc/profile* /etc/bashrc*)
if [ ! -z $command_ouput ]
then
	if [ -z $command_output2 ]
	then
		output=$( echo -e "[${lightgreen}PASS${normal}]" )
		echo "" 

	else
		output=$( echo -e "[${lightred}FAIL${normal}]" )
		echo "" 

	fi
else
	output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 

fi
printf "%-77s %s\n" "5.6.5 Ensure default user umask is 027 or more restrictive" "$output"
}

}

function trans6() {

echo
echo "${lightyellow}${bold}6 System Maintenance:${normal}${default}"


{
echo "---------------------------------------------------------------------------------------"
}

{
       printf "%-77s %s\n" "Title" "Status"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo "${lightpurple}${bold}6.1 System File Permissions:${normal}${default}"
}

{
#output=""
#command_output=$(rpm -Va --nomtime --nosize --nomd5 --nolinkto)
#if [ ! -z "$command_output" ]
#then
#    	output=$( echo -e "   "$na" )
#else
#    	output=$( echo -e " [${lightred}FAIL${normal}]" )
#fi
printf "%-77s %s\n" "6.1.1 Audit system file permissions" "$na"
echo ""
}

{
output=""
command_output=$(df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null)
if [ -z "$command_output" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.1.2 Ensure sticky bit is set on all world-writable directories" "$output"
}

{
output=""
if stat /etc/passwd | grep "Access: (0644/-rw-r--r--)" &> /dev/null 
then
    	if stat /etc/passwd | grep "Uid: (    0/    root)" &> /dev/null
        then
            	if stat /etc/passwd | grep "Gid: (    0/    root)" &> /dev/null
		then 
			output=$( echo -e "[${lightgreen}PASS${normal}]" )
			echo "" 
		else 
			output=$( echo -e "[${lightred}FAIL${normal}]" )
		        echo "" 
		fi
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
	        echo "" 
        fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.1.3 Ensure permissions on /etc/passwd are configured" "$output"
}

{
output=""
if stat /etc/shadow | grep "Access: (0000/----------)" &> /dev/null 
then
    	if stat /etc/shadow | grep "Uid: (    0/    root)" &> /dev/null
        then
                if stat /etc/shadow | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
		        echo "" 

		else 
                        output=$( echo -e "[${lightred}FAIL${normal}]" )
                        echo "" 
		fi
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
                echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.1.4 Ensure permissions on /etc/shadow are configured" "$output"
}

{
output=""
if stat /etc/group | grep "Access: (0644/-rw-r--r--)" &> /dev/null 
then
    	if stat /etc/group | grep "Uid: (    0/    root)" &> /dev/null
        then
            	if stat /etc/group | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
                        echo "" 

		else 
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
                        echo "" 
		fi
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
                echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.1.5 Ensure permissions on /etc/group are configured" "$output"
}

{
output=""
if stat /etc/gshadow | grep "Access: (0000/----------)" &> /dev/null 
then
    	if stat /etc/gshadow | grep "Uid: (    0/    root)" &> /dev/null
        then
                if stat /etc/gshadow | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
                        echo "" 
		else 
                        output=$( echo -e "[${lightred}FAIL${normal}]" )
                        echo "" 
		fi
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
                echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.1.6 Ensure permissions on /etc/gshadow are configured" "$output"
}

{
output=""
if stat /etc/passwd- | grep "Access: (0644/-rw-r--r--)" &> /dev/null 
then
    	if stat /etc/passwd- | grep "Uid: (    0/    root)" &> /dev/null
        then
                if stat /etc/passwd- | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
                        echo "" 
		else 
                        output=$( echo -e "[${lightred}FAIL${normal}]" )
                        echo "" 
		fi
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
                echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.1.7 Ensure permissions on /etc/passwd- are configured" "$output"
}

{
output=""
if stat /etc/shadow- | grep "Access: (0000/----------)" &> /dev/null 
then
    	if stat /etc/shadow- | grep "Uid: (    0/    root)" &> /dev/null
        then
                if stat /etc/shadow- | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
                        echo "" 
		else 
                        output=$( echo -e "[${lightred}FAIL${normal}]" )
                        echo "" 
		fi
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
                echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.1.8 Ensure permissions on /etc/shadow- are configured" "$output"
}

{
output=""
if stat /etc/group- | grep "Access: (0644/-rw-r--r--)" &> /dev/null 
then
    	if stat /etc/group- | grep "Uid: (    0/    root)" &> /dev/null
        then
            	if stat /etc/group- | grep "Gid: (    0/    root)" &> /dev/null
                then 
                        output=$( echo -e "[${lightgreen}PASS${normal}]" )
                        echo "" 
		else 
                        output=$( echo -e "[${lightred}FAIL${normal}]" )
                        echo "" 
		fi
        else
                output=$( echo -e "[${lightred}FAIL${normal}]" )
                echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.1.9 Ensure permissions on /etc/group- are configured" "$output"
}

{
output=""
if stat /etc/gshadow- | grep "Access: (0000/----------)" &> /dev/null 
then
    	if stat /etc/gshadow- | grep "Uid: (    0/    root)" &> /dev/null
        then
            	if stat /etc/gshadow- | grep "Gid: (    0/    root)" &> /dev/null
                then 
                     	output=$( echo -e "[${lightgreen}PASS${normal}]" )
                        echo "" 
		else 
                     	output=$( echo -e "[${lightred}FAIL${normal}]" )
                        echo "" 
		fi
        else
            	output=$( echo -e "[${lightred}FAIL${normal}]" )
                echo "" 
	fi
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.1.10 Ensure permissions on /etc/gshadow- are configured" "$output"
}

{
output=""
command_output=$(df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type f -perm -0002)
if [ -z "$command_output" ]
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.1.11 Ensure no world writable files exist" "$output"
}

{
output=""
command_output=$(df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -nouser)
if [ -z "$command_output" ]
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.1.12 Ensure no unowned files or directories exist" "$output"
}

{
output=""
command_output=$(df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -nogroup)
if [ -z "$command_output" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.1.13 Ensure no ungrouped files or directories exist" "$output"
}

{
#output=""
#command_output=$(df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type f -perm -4000)
#if [ ! -z "$command_output" ]
#then
#    	output=$( echo -e "   $na" )
#else
#        output=$( echo -e " [${lightred}FAIL${normal}]" )
#fi
printf "%-77s %s\n" "6.1.14 Audit SUID executables" "$na"
echo ""
}

{
#output=""
#command_output=$(df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type f -perm -4000)
#if [ ! -z "$command_output" ]
#then
#    	output=$( echo -e "  "$na" )
#else
#        output=$( echo -e " [${lightred}FAIL${normal}]" )
#fi
printf "%-77s %s\n" "6.1.15 Audit SGID executables" "$na"
echo ""
}

{
echo "${lightpurple}${bold}6.2 User and Group Settings:${normal}${default}"
}

{
output=""
command_output=$(awk -F: '($2 == "" ) { print $1 " does not have a password "}' /etc/shadow)
if [ -z "$command_output" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
	echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
	echo "" 
fi
printf "%-77s %s\n" "6.2.1 Ensure password fields are not empty" "$output"
}

forloop()
{
for i in $(cut -s -d: -f4 /etc/passwd | sort -u );
do
 grep -q -P "^.*?:[^:]*:$i:" /etc/group
 if [ $? -ne 0 ]; then
 echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group"
 fi
done
}

{
output=""
command_output=$(forloop)
if [ -z "$command_output" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.2.2 Ensure all groups in /etc/passwd exist in /etc/group" "$output"
}

whileloop()
{
cut -f3 -d":" /etc/passwd | sort -n | uniq -c | while read x ; 
do
 [ -z "$x" ] && break
 set - $x
	if [ $1 -gt 1 ]; 
	then
 		users=$(awk -F: '($3 == n) { print $1 }' n=$2 /etc/passwd | xargs)
 		echo "Duplicate UID ($2): $users"
	fi
done
}
{
output=""
command_output=$(whileloop)
if [ -z "$command_output" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.2.3 Ensure no duplicate UIDs exist" "$output"
}

whileloop2()
{
cut -d: -f3 /etc/group | sort | uniq -d | while read x ; 
do
	echo "Duplicate GID ($x) in /etc/group"
done
}

{
output=""
command_output=$(whileloop2)
if [ -z "$command_output" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.2.4 Ensure no duplicate GIDs exist" "$output"
}

whileloop3()
{
cut -d: -f1 /etc/passwd | sort | uniq -d | while read x; 
do
	echo "Duplicate login name ${x} in /etc/passwd"
done
}

{
output=""
command_output=$(whileloop3)
if [ -z "$command_output" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.2.5 Ensure no duplicate user names exist" "$output"
}

whileloop4()
{
cut -d: -f1 /etc/group | sort | uniq -d | while read -r x; 
do
	echo "Duplicate group name ${x} in /etc/group"
done
}
{
output=""
command_output=$(whileloop4)
if [ -z "$command_output" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.2.6 Ensure no duplicate group names exist" "$output"
}

forloop2()
{
RPCV="$(sudo -Hiu root env | grep '^PATH=' | cut -d= -f2)"
echo "$RPCV" | grep -q "::" && echo "root's path contains a empty directory (::)"
echo "$RPCV" | grep -q ":$" && echo "root's path contains a trailing (:)"
for x in $(echo "$RPCV" | tr ":" " "); 
do
	if [ -d "$x" ]; 
	then
		ls -ldH "$x" | awk '$9 == "." {print "PATH contains current working directory (.)"}
		$3 != "root" {print $9, "is not owned by root"}
		substr($1,6,1) != "-" {print $9, "is group writable"}
		substr($1,9,1) != "-" {print $9, "is world writable"}'
	else
		echo "$x is not a directory"
	fi
done
}
{
output=""
command_output=$(forloop2)
if [ -z "$command_output" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.2.7 Ensure root PATH Integrity" "$output"
}

{
output=""
if awk -F: '($3 == 0) { print $1 }' /etc/passwd | grep "root" &> /dev/null
then 
	output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.2.8 Ensure root is the only UID 0 account" "$output"
}

whileloop5()
{
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; 
do
	if [ ! -d "$dir" ]; 
	then
		echo "User: \"$user\" home directory: \"$dir\" does not exist."
	fi
done
}
{
output=""
command_output=$(whileloop5)
if [ -z "$command_output" ]
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.2.9 Ensure all users' home directories exist" "$output"
}

forloop3()
{
UHOC()
{
for i in $( awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) {print $1":"$6}' /etc/passwd); 
do
	user=$(echo "$i" | cut -d: -f1)
	dir=$(echo "$i" | cut -d: -f2)
	if [ ! -d "$dir" ]; 
	then
		[ -z "$output2" ] && output2="The following users' home directories don't exist: \"$user\"" || output2="$output2, \"$user\""
	else
		owner="$(stat -L -c "%U" "$dir")"
		if [ "$owner" != "$user" ] && [ "$owner" != "root" ]; then
		[ -z "$output" ] && output="The following users' don't own their home directory: \"$user\" home directory is owned by \"$owner\"" || output="$output, \"$user\" home directory is owned by \"$owner\""
		fi
	fi
done
}
UHOC
}
{
output=""
command_output=$(forloop3)
if [ -z "$command_output" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.2.10 Ensure users own their home directories" "$output"
}

whileloop6()
{
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) {print $1 " " $6}' /etc/passwd | while read -r user dir; 
do
	if [ ! -d "$dir" ]; 
	then
		echo "User: \"$user\" home directory: \"$dir\" doesn't exist"
	else
		dirperm=$(stat -L -c "%A" "$dir")
		if [ "$(echo "$dirperm" | cut -c6)" != "-" ] || [ "$(echo "$dirperm" | cut -c8)" != "-" ] || [ "$(echo "$dirperm" | cut -c9)" != "-" ] || [ "$(echo "$dirperm" | cut -c10)" != "-" ]; 
		then
			echo "User: \"$user\" home directory: \"$dir\" has permissions: \"$(stat -L -c "%a" "$dir")\""
		fi
	fi
done
}
{
output=""
command_output=$(whileloop6)
if [ -z "$command_output" ]
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.2.11 Ensure users' home directories permissions are 750 or more restrictive" "$output"
}

whileloop7()
{
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; 
do
	if [ -d "$dir" ]; 
	then
		for file in "$dir"/.*; 
		do
			if [ ! -h "$file" ] && [ -f "$file" ]; 
			then
				fileperm=$(stat -L -c "%A" "$file")
				if [ "$(echo "$fileperm" | cut -c6)" != "-" ] || [ "$(echo "$fileperm" | cut -c9)" != "-" ]; 
				then
				echo "User: \"$user\" file: \"$file\" has permissions:\"$fileperm\""
				fi
			fi
		done
	fi
done
}
{
output=""
command_output=$(whileloop7)
if [ -z "$command_output" ]
then
        output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.2.12 Ensure users' dot files are not group or world writable" "$output"
}

whileloop8()
{
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; 
do
	if [ -d "$dir" ]; 
	then
		file="$dir/.netrc"
		if [ ! -h "$file" ] && [ -f "$file" ]; 
		then
			if stat -L -c "%A" "$file" | cut -c4-10 | grep -Eq '[^-]+'; 
			then
				echo "FAILED: User: \"$user\" file: \"$file\" exists with permissions: \"$(stat -L -c "%a" "$file")\", remove file or excessive permissions"
			else
				echo "WARNING: User: \"$user\" file: \"$file\" exists with permissions: \"$(stat -L -c "%a" "$file")\", remove file unless required"
			fi
		fi
	fi
done
}
{
output=""
command_output=$(whileloop8)
if [ -z "$command_output" ]
then
  	output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.2.13 Ensure users' .netrc Files are not group or world accessible" "$output"
}

whileloop9()
{
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; 
do
	if [ -d "$dir" ]; 
	then
		file="$dir/.forward"
		if [ ! -h "$file" ] && [ -f "$file" ]; 
		then
			echo "User: \"$user\" file: \"$file\" exists"
		fi
	fi
done
}
{
output=""
command_output=$(whileloop9)
if [ -z "$command_output" ]
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
        output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.2.14 Ensure no users have .forward files" "$output"
}

whileloop10()
{
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; 
do
	if [ -d "$dir" ]; 
	then
		file="$dir/.netrc"
		if [ ! -h "$file" ] && [ -f "$file" ]; 
		then
			echo "User: \"$user\" file: \"$file\" exists"
		fi
	fi
done
}
{
output=""
command_output=$(whileloop10)
if [ -z "$command_output" ]
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 
fi
printf "%-77s %s\n" "6.2.15 Ensure no users have .netrc files" "$output"
}

whileloop11()
{
awk -F: '($1!~/(halt|sync|shutdown|nfsnobody)/ && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) { print $1 " " $6 }' /etc/passwd | while read -r user dir; 
do
	if [ -d "$dir" ]; 
	then
		file="$dir/.rhosts"
		if [ ! -h "$file" ] && [ -f "$file" ]; 
		then
			echo "User: \"$user\" file: \"$file\" exists"
		fi
	fi
done
}
{
output=""
command_output=$(whileloop11)
if [ -z "$command_output" ]
then
    	output=$( echo -e "[${lightgreen}PASS${normal}]" )
        echo "" 
else
    	output=$( echo -e "[${lightred}FAIL${normal}]" )
        echo "" 

fi
printf "%-77s %s\n" "6.2.16 Ensure no users have .rhosts files" "$output"
}

echo
#Conclusion
echo 
#printf "%-77s %s\n" CONCLUSION "Status"
if [ "$PCOUNTER" -lt 134 ]
then
        printf ""
        #printf "%-77s %s\n" "There are $PCOUNTER pass(es), $FCOUNTER fail(s) and $WCOUNTER warning(s)" "$danger"
else
        printf ""
        #printf "%-77s %s\n" "There are $PCOUNTER pass(es), $FCOUNTER fail(s) and $WCOUNTER warning(s)" "$safe"
fi

echo
echo

}
