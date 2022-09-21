#!/bin/bash
fail=(\[$'\e[0;91m'FAIL$'\e[0m'\])
pass=(\[$'\e[0;92m'PASS$'\e[0m'\])
warning=(\[$'\e[1;36m'WARNING$'\e[0m'\])
critical=(\[$'\e[1;31m'CRITICAL$'\e[0m'\])
safe=(\[$'\e[1;32m'SAFE$'\e[0m'\])
na="[N/A]"

orange=`echo -en "\e[33m"`
lightpurple=`echo -en "\e[35m"`
lightred=`echo -en "\e[91m"`
lightgreen=`echo -en "\e[92m"`
default=`echo -en "\e[39m"`
lightblue=`echo -en "\e[94m"`
bold=$(tput bold)
normal=$(tput sgr0)
lightyellow=`echo -en "\e[93m"`

PCOUNTER=0
FCOUNTER=0
WCOUNTER=0
echo "Legend"
echo "	"$'\e[0;91m'Red$'\e[0m'" displays non-compliant benchmarks"
echo "	"$'\e[0;92m'Green$'\e[0m'" displays compliant benchmarks"
echo "	"$'\e[1;36m'Cyan$'\e[0m'" displays the more important non-compliant benchmarks"
echo "	"$'\e[1;33m'Yellow$'\e[0m'" displays the sections of benchmarks"
echo "	"$'\e[1;35m'Purple$'\e[0m'" displays the sub-sections of benchmarks"
{
echo " "
}
{
echo "${orange}${bold}1 File System:${normal}"
}
{
echo "--------------------------------------------------------------------------------------"
}
{
printf "%-77s %s\n" "Title" "Status"
}
{
echo "--------------------------------------------------------------------------------------"
}
echo "${lightpurple}${bold}1.1.1 Disable Unused File ${normal}"
#1.1.1.1
output=""
result=`lsmod | grep freevxfs | grep "install /bin/true"`
if [ -z "$result" ] ; 
then 
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else    
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.1.1 Ensure mounting of freevxfs filesystem is disabled" "$output"

#1.1.1.2
output=""
result= `lsmod | grep jffs2 | grep "install /bin/true"`
if [ -z "$result" ] ;
then
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else    
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.1.2 Ensure mounting of jffs2 filesystems is disabled" "$output"

#1.1.1.3
output=""0
result= `lsmod | grep hfs | grep "install /bin/true"`
if [ -z "$result" ] ; 
then
       output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else    
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.1.3 Ensure mounting of hfs filesystems is disabled" "$output" 

#1.1.1.4
output=""
result= `lsmod | grep hfsplus | grep "install /bin/true"`
if [ -z "$result" ] ;
then
       output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else    
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.1.4 Ensure mounting of hfsplus filesystems is disabled" "$output"

#1.1.1.5
output=""
result= `lsmod | grep squashfs | grep "install /bin/true"`
if [ -z  "$result" ] ; 
then
       output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else    
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.1.5 Ensure mounting of squashfs filesystems is disabled" "$output" 

#1.1.1.6
output=""
result= `lsmod | grep udf | grep "install /bin/true"`
if [ -z "$result" ] ; 
then
       output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else    
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.1.6 Ensure mounting of udf filesystems is disabled" "$output"
#1.1.1.7
#output=$( echo "[${lightblue}Not Tested${normal}]" )
#result= `modprobe -n -v cramfs | grep "install /bin/true"`
#if [ "$result" != 'install /bin/true' ] ; 
#then
        #output=$( echo "[${lightblue}Not Tested${normal}]" )
#else    
       # output=$( echo "[${lightblue}Not Tested${normal}]" )
#fi
printf "%-77s %s\n" "1.1.1.7 Ensure mounting of FAT filesystem is limited" "$na"

output=""
result= `findmnt /etc/fstab /tmp`
if [ "$result" != "/tmp" ] ; 
then
      output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else    
      output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.2 Ensure /tmp is a separate partition" "$output" 

output=""
result= `findmnt /etc/fstab /tmp | grep nodev`
if [ "$result" != "nodev" ] ; 
then      
	output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else    
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.3 Ensure nodev option set on /tmp partition" "$output"

output=""
result= `findmnt /etc/fstab /tmp | grep nosuid`
if [ "$result" != "noexec" ] ; 
then
       output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else    
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.4 Ensure nosuid option set on /tmp partition" "$output" 

output=""
result= `findmnt /etc/fstab /tmp | grep nosuid`
if [ "$result" != "nosuid" ] ; 
then
       output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else    
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.5 Ensure noexec option set on /tmp partition" "$output" 

output=""
result= `findmnt /etc/fstab /var`
if [ "$result" != "/var" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.6 Ensure separate partition exists for /var" "$output"

output=""
result= `findmnt /etc/fstab /var/tmp`
if [ "$result" != "/var/tmp" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.7 Ensure separate partition exists for /var/tmp" "$output"


#output=""
#result= `findmnt -n /dev/shm /etc/fstab`
#if [ "$result" != '/dev/shm' ] ; 
#then
#	 output=$( echo "[${lightred}FAIL${normal}]" )
#	let FCOUNTER=FCOUNTER+1
#else
#	output=$( echo "[${lightgreen}PASS${normal}]" )
#	let PCOUNTER=PCOUNTER+1
#fi
#echo "1.1.6 Ensure /dev/shm is configured" "$output"

#output=""
#result= `findmnt -n /dev/shm /etc/fstab| grep nodev`
#if [ "$result" != "nodev" ] ; 
#then
#         output=$( echo "[${lightred}FAIL${normal}]" )
#	let FCOUNTER=FCOUNTER+1
#else
 #       output=$( echo "[${lightgreen}PASS${normal}]" )
#fi
#echo "1.1.7 Ensure nodev option set on /dev/shm partition" "$output" 

output=""
result= `findmnt /etc/fstab /var/tmp | grep nodev`
if [ "$result" != "nodev" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.8 Ensure nodev option set on /var/tmp partition" "$output"

output=""
result= `findmnt /etc/fstab /var/tmp | grep nosuid`
if [ "$result" != "nosuid" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.9 Ensure nosuid option set on /var/tmp partition" "$output"

output=""
result= `findmnt /etc/fstab /var/tmp | grep noexec`
if [ "$result" != 'noexec' ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.10 Ensure /var/tmp partition includes the noexec option" "$output" 

output=""
result= `findmnt /etc/fstab /var/log`
if [ "$result" != '/var/log' ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.11 Ensure separate partition exits for /var/log" "$output" 

output=""
result= `findmnt /etc/fstab /var/log/audit`
if [ "$result" != '/var/log/audit' ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.12 Ensure separate partition exists for /var/log/audit" "$output"

output=""
result= `findmnt -n /home /etc/fstab`
if [ "$result" != '/home' ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.13 Ensure separate partition exists for /home" "$output"

output=""
result= `findmnt /etc/fstab /home | grep nodev`
if [ "$result" != "nodev" ] ;
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.15 Ensure nodev option set on /home partition" "$output" 

output=""
result= `findmnt -n /dev/shm /etc/fstab | grep nodev`
if [ "$result" != "nodev" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.16 Ensure nodev option set on /dev/shm partition" "$output"

output=""
result= `findmnt -n /dev/shm /etc/fstab | grep nosuid`
if [ "$result" != "nosuid" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.17 Ensure nosuid option set on /dev/shm partition" "$output"

output=""
result= `findmnt -n /dev/shm /etc/fstab | grep noexec`
if [ "$result" != "noexec" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.17 Ensure noexec option set on /dev/shm partition" "$output"

#output=""
#result=`mount | grep nodev`
#if [ "$result" = 'nodev' ] ; 
#then
#         output=$( echo "$na" )
#else
#        output=$( echo "$na" )
#fi 
printf "%-77s %s\n" "1.1.18 Ensure nodev option set on removable media partitions" "$na" 

#output=""
#result=`mount | grep nosuid`
#if [ "$result" = 'nosuid' ] ; 
#then
#	output=$( echo "[${lightblue}  Not Tested${normal}]" )
#else
#        output=$( echo "[${lightblue}  Not Tested${normal}]" )
#fi
printf "%-77s %s\n" "1.1.19 Ensure nosuid option set on removable media partitions" "$na"

#output=$( echo "[${lightblue}  Not Tested${normal}]" )
#result=`mount | grep noexec`
#if [ "$result" = 'noexec' ] ; 
#then
 #       output=$( echo "[${lightblue}  Not Tested${normal}]" )
#else
 #       output=$( echo "[${lightblue}  Not Tested${normal}]" )
#fi
printf "%-77s %s\n" "1.1.20 Ensure noexec option set on removable media partitions" "$na" 

output=""
result=`df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type d \( -perm -0002 -a ! -perm -1000 \) 2>/dev/null`
if [ -z "$result" ] ; 
then
         output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
printf "%-77s %s\n" "1.1.21 Ensure sticky bit is set on all world-writable directories" "$output"

output=""
#result= `dpkg -s autofs | grep 'not installed'` 
if [ "dpkg -s autofs" != "package 'autofs' not install" ] ;
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.22 Disable Automounting" "$output" 

output=""
result= `lsmod | grep  usb-storage | grep "install /bin/true"`
if [ "$result" != "install /bin/true" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.1.23 Disable USB Storage" "$output"

{
echo "${lightpurple}${bold}1.2 Configure Software Updates${normal}"
}

#output=$( echo "[${lightblue}Not Tested${normal}]" )
printf "%-77s %s\n" "1.2.1 Ensure package manager repositories are configured" "$na"
#1.2.1
#result= grep /etc/yum.repos.d/* /etc/dnf/dnf.conf
#if [ "$result" == "gpgkey" ] ; then
#printf "${NC}%-20s${lightblue} %s\n ${normal}" "1.2.1 Ensure GPG Keys are configured (Manual)..." "[FAIL]"
#else
#output=$( echo "[${lightblue}Not Tested${normal}]" )
printf "%-77s %s\n" "1.2.2 Ensure GPG Keys are configured" "$output" 
#fi

{
echo "${lightpurple}${bold}1.3 Configure sudo${normal}"
}

output=""
result=
if [ "dpkg -s sudo | grep install" = 'not installed' ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.3.1 Ensure sudo is installed" "$output"

output=""
#result= grep -Eis '^([^#]+\s+)?(\/usr\/s?bin\/|^\s*)aide(\.wrapper)?\s(--?\S+\s)*(--(check|update)|\$AIDEARGS)\b' /etc/cron.* /etc/crontab /var/spool/cron/
result=`grep 'Defaults use_pty' /etc/sudoers` 
if [ "$result" != "Defaults use_pty" ] ;
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.3.2 Ensure sudo commands use pty" "$output"

output=""
result=`grep 'Defaults logfile' /etc/sudoers` 
if [ "$result" != "Defaults logile" ] ;
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.3.3 Ensure sudo logfile exists" "$output"

{
echo "${lightpurple}${bold}1.4 Filesystem Integrity Checking${normal}"
}

output=""
if [ "dpkg -s aide | grep '(Status:|not installed)'" != 'install' ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.4.1 Ensure AIDE is installed" "$output"

output=""
#result= grep -Eis '^([^#]+\s+)?(\/usr\/s?bin\/|^\s*)aide(\.wrapper)?\s(--?\S+\s)*(--(check|update)|\$AIDEARGS)\b' /etc/cron.* /etc/crontab /var/spool/cron/
result=`grep /usr/sbin/aide.wrapper /etc/crontab` 
if [ "$result" != "/usr/sbin/aide.wrapper" ] ;
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.4.2 Ensure filesystem integrity is regularly checked" "$output"

{
echo "${lightpurple}${bold}1.5 Secure Boot Settings${normal}"
}

output=""
result=`grep -E '^\s*chmod\s+[0-7][0-7][0-7]\s+\$\{grub_cfg\}\.new' -A 1 -B1 /usr/sbin/grub-mkconfig`
if [ "$result" != '400' ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.5.1 Ensure permissions on bootloader config are not overridden" "$output"

output=""
result=`grep "^set superusers|password" /boot/grub/grub.cfg`
if [ "$result" != "password_pbkdf2" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.5.2 Ensure bootloader password is set" "$output"

output=""
result=`grep -Eq '^root:\$[0-9]' /etc/shadow`
if [ -z "$result" ] ; 
then
         output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
printf "%-77s %s\n" "1.5.3 Ensure authentication required for single user mode" "$output"

{
echo "${lightpurple}${bold}1.6 Additional Process Hardening${normal}"
}

output=""
result=`journalctl | grep 'protection: active'` 
if [ "$result" != " not active" ] ; 
then
         output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
printf "%-77s %s\n" "1.6.1 Ensure XD/NX support is enabled" "$output"

output=""
result=`grep "kernel\.randomize_va_space" /etc/sysctl.conf`
if [ -z "$result" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.6.2 Ensure address space layout randomization (ASLR) is enabled" "$output" 

output=""
#result=`dpkg -s prelink | grep -E '(Status:|not installed)'`
if [ "dpkg --info prelink | grep '(Status:|not installed)'" = 'dpkg-query' ] ; 
then
         output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
printf "%-77s %s\n" "1.6.3 Ensure prelink is not installed" "$output"

output=""
result=`grep -Es '^(\*|\s).*hard.*core.*(\s#.*)?$' /etc/security/limits.conf /etc/security/limits.d/*`
if [ -z "$result" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.6.4 Ensure core dumps are restricted" "$output"

{
echo "${lightpurple}${bold}1.7 Mandatory Access Control${normal}"
}

output=""
if [ "dpkg -s apparmor" = "not install" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.7.1.1 Ensure AppArmor is installed" "$output" 

output=""
result=`grep "\^s*linux" /boot/grub/grub.cfg | grep -v "apparmor=1"`
if [ -z "$result" ] ;
then
         output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
printf "%-77s %s\n" "1.7.1.2 Ensure AppArmor is enabled in the bootloader configuration" "$output"

output=""
result=`sudo aa-status | grep profiles | grep enforce | grep -o '[[:digit:]]*'`
if [ "$result" != "enforce" ] ; 
then
         output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
printf "%-77s %s\n" "1.7.1.3 Ensure all AppArmor Profiles are in enforce or complain mode" "$output"

output=""
result=`sudo aa-status  | grep enforce | grep -o '[[:digit:]]*'`
if [ "$result" != "enforce" ] ; 
then
         output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
printf "%-77s %s\n" "1.7.1.4 Ensure all AppArmor Profiles are enforcing" "$output"

{
echo "${lightpurple}${bold}1.8 Warning Banners${normal}"
}

output=""
result=`grep -Eis "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d=  -f2 | sed -e 's/"//g'))" /etc/motd`
if [ ! -z "$result" ] ;
then
         output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
printf "%-77s %s\n" "1.8.1.1  Ensure message of the day is configured properly" "$output"

output=""
result=`grep -Eis "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d=  -f2 | sed -e 's/"//g'))" /etc/issue`
if [ ! -z "$result" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.8.1.2 Ensure local login warning banner is configured properly" "$output"

output=""
result=`grep -Eis "(\\\v|\\\r|\\\m|\\\s|$(grep '^ID=' /etc/os-release | cut -d=  -f2 | sed -e 's/"//g'))" /etc/issue.net`
if [ ! -z "$result" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.8.1.3 Ensure remore login warning banner is configured properly" "$output"

output=""
#result=`grep -E '^\s*UID|GID=(0/root)\s*Access=0644' /etc/motd`
if [ "grep -E '^\s*UID|GID=(0/root)\s*Access=0644' /etc/motd" != "0/root|0400" ]  ; 
then
         output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
printf "%-77s %s\n" "1.8.1.4 Ensure permissions on /etc/motd are configured" "$output"

output=""
result= grep -E '^\s*UID|GID=(0/root)\s*Access=0644' /etc/issue
if [ "$result" != "root|0400" ] ; 
then
         output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
        output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
printf "%-77s %s\n" "1.8.1.5 Ensure permissions on /etc/issue are configured" "$output"

output=""
result= grep -E '^\s*UID|GID=(0/root)\s*Access=0644' /etc/issue.net
if [ "$result" = "0/root|0400" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.8.1.6 Ensure permissions on /etc/issue.net are configured" "$output"

output=""
result=`grep -Eis '^\s*banner-message-enable\s*=\s*true' /etc/gdm3/greeter.dconf-defaults`
if [ "$result" != "banner-message-enable=true" ] ; 
then
         output=$( echo "[${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
else
        output=$( echo "[${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
fi
printf "%-77s %s\n" "1.8.2 Ensure GDM login banner is configured" "$output"

#output=$( echo "[${lightblue}Not Tested${normal}]" )
echo "1.9 Ensure updates, patched, and additional security"
printf "%-77s %s\n" "   Software are installed" "$na"
echo
echo $'\e[1;33m'2 Services$'\e[0m'
echo ---------------------------------------------------------------------------------------
printf "%-77s %s\n" "Title" "Status"
echo ---------------------------------------------------------------------------------------

echo $'\e[1;35m'2.1 Special Purpose Services$'\e[0m'
echo $'\e[0;33m'[+]	2.1.1 Time Synchronization$'\e[0m'
#2.1.1.1
xin=$(sudo dpkg-query -l | grep "xinetd ")
if [ -z "$xin" ]
then
	printf "%-77s %s\n" "2.1.1 Ensure xinetd is not installed" "$pass"
	let PCOUNTER=PCOUNTER+1
else
	printf "%-77s %s\n" "2.1.1 Ensure xinetd is not installed" "$fail"
	let FCOUNTER=FCOUNTER+1
fi

#2.1.2
open=$(sudo dpkg-query -l | grep "openbsd-inetd ")
if [ -z "$open" ]
then
	printf "%-77s %s\n" "2.1.2 Ensure openbsd-inetd is not installed" "$pass"
	let PCOUNTER=PCOUNTER+1
else
	printf "%-77s %s\n" "2.1.2 Ensure openbsd-inetd is not installed" "$fail"
	let FCOUNTER=FCOUNTER+1
fi

echo $'\e[1;35m'2.2 Special Purpose Services$'\e[0m'
echo "2.2.1 Time Synchronization"

#2.1.1.1
syst=$(systemctl is-enabled systemd-timesyncd)
chron=$(sudo dpkg-query -l | grep "chrony ")
ntp=$(sudo dpkg-query -l | grep "ntp ")
if [[ ("$syst" == "enabled") || ( -z "$chron" ) || ( -z "$ntp" ) ]]
then
        printf "%-77s %s\n" "2.2.1.1 Ensure time synchronization is in use" "$pass"
        let PCOUNTER=PCOUNTER+1
else
	printf "%-77s %s\n" "2.2.1.1 Ensure time synchronization is in use" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.1.1.2
printf "%-77s %s\n" "2.2.1.2 Ensure systemd-timesyncd is configured" "$na"

#2.2.1.3
remote_server=$(grep -E "^(server|pool)" /etc/chrony.conf &> /dev/null)
multiple_servers=$(ps -ef | grep chronyd | cut -d " " -f 1)

if [[ ( -n "$remote_server" ) && ("$multiple_servers" == "chrony") ]]
then
        printf "%-77s %s\n" "2.2.1.3 Ensure chrony is configured" "$pass"
        let PCOUNTER=PCOUNTER+1

else
        printf "%-77s %s\n" "2.2.1.3 Ensure chrony is configured" "$fail"
        let FCOUNTER=FCOUNTER+1

fi

#2.2.1.4
ntp_restrict=$(grep "^restrict" /etc/ntp.conf &> /dev/null)
ntp_remote_server=$(grep -E "^(server|pool)" /etc/ntp.conf &> /dev/null)
ntp_multiple_servers=$(ps -ef | grep chronyd | cut -d " " -f 1)

if [[ ("$ntp_restrict" =~ "default kod nomodify notrap nopeer noquery") && ( -n "$ntp_remote_server" ) && ("$ntp_multiple_servers" == "RUNASUSER=ntp") ]]
then
        printf "%-77s %s\n" "2.2.1.4 Ensure ntp is configured" "$pass"
        let PCOUNTER=PCOUNTER+1
else
	printf "%-77s %s\n" "2.2.1.4 Ensure ntp is configured" "$fail"
        let FCOUNTER=FCOUNTER+1

fi

#2.2.2
x_win=$(dpkg -l xserver-xorg*)
if  [ -z "$x_win" ]
then
        printf "%-77s %s\n" "2.2.2 Ensure X Windows System is not installed" "$pass"
        let PCOUNTER=PCOUNTER+1
else
	printf "%-77s %s\n" "2.2.2 Ensure X Windows System is not installed" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.3
ava=$(systemctl is-enabled avahi-daemon)
if  [[ "$ava" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.3 Ensure Avahi Server is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.3 Ensure Avahi Server is not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.4
cup=$(systemctl is-enabled cups)
if  [[ "$cup" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.4 Ensure CUPS is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.4 Ensure CUPS is not enabled" "$warning"
        let WCOUNTER=WCOUNTER+1
fi

#2.2.5
dhcp1=$(systemctl is-enabled isc-dhcp-server &> /dev/null)
dhcp2=$(systemctl is-enabled isc-dhcp-server6 &> /dev/null)
if  [[ ("$dhcp1" == "disabled") && ("$dhcp2" == "disabled") ]]
then
        printf "%-77s %s\n" "2.2.5 Ensure DHCP Server is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.5 Ensure DHCP Server is not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.6
slap=$(systemctl is-enabled slapd &> /dev/null)
if  [[ "$slap" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.6 Ensure LDAP server is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.6 Ensure LDAP server is not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.7
nfs=$(systemctl is-enabled nfs-server &> /dev/null)
rpc=$(systemctl is-enabled rpcbind &> /dev/null)
if  [[ ("$nfs" == "disabled") && ("$rpc" == "disabled") ]]
then
        printf "%-77s %s\n" "2.2.7 Ensure NFS and RPC are not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.7 Ensure NFS and RPC are not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.8
dns=$(systemctl is-enabled bind9 &> /dev/null)
if  [[ "$dns" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.8 Ensure DNS Server is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.8 Ensure DNS Server is not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.9
ftp=$(systemctl is-enabled vsftpd &> /dev/null)
if  [[ "$ftp" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.9 Ensure FTP Server is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.9 Ensure FTP Server is not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.10
http=$(systemctl is-enabled apache2 &> /dev/null)
if  [[ "$http" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.10 Ensure HTTP Server is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.10 Ensure HTTP Server is not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.11
ema=$(systemctl is-enabled dovecot &> /dev/null)
if  [[ "$ema" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.11 Ensure email services are not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.11 Ensure email services are not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.12
smb=$(systemctl is-enabled smbd &> /dev/null)
if  [[ "$smb" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.12 Ensure Samba is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.12 Ensure Samba is not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.13
http_p=$(systemctl is-enabled squid &> /dev/null)
if  [[ "$http_p" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.13 Ensure HTTP Proxy Server is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.13 Ensure HTTP Proxy Server is not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.14
snmp=$(systemctl is-enabled snmpd &> /dev/null)
if  [[ "$snmp" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.14 Ensure SNMP Server is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.14 Ensure SNMP Server is not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.15
MTA=$(ss -lntu | grep -E ':25\s' | grep -E -v '\s(127.0.0.1|::1):25\s')
if [ -z "$MTA" ]
then
        printf "%-77s %s\n" "2.2.15 Ensure mail transfer agent is configured for local-only mode" "$pass"
	let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.15 Ensure mail transfer agent is configured for local-only mode" "$fail"
	let FCOUNTER=FCOUNTER+1
fi

#2.2.16
rsync=$(systemctl is-enabled rsync &> /dev/null)
if  [[ "$rsync" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.16 Ensure rsync service is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.16 Ensure rsync service is not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.2.17
nis=$(systemctl is-enabled nis &> /dev/null)
if  [[ "$nis" == "disabled" ]]
then
        printf "%-77s %s\n" "2.2.17 Ensure NIS Server is not enabled" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.2.17 Ensure NIS Server is not enabled" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

echo $'\e[1;35m'2.3 Service Clients$'\e[0m'
#2.3.1
nis_c=$(sudo dpkg-query -l | grep "nis ")
if [ -z "$nis" ]
then
	printf "%-77s %s\n" "2.3.1 Ensure NIS Client is not installed" "$pass"
	let PCOUNTER=PCOUNTER+1
else
	printf "%-77s %s\n" "2.3.1 Ensure NIS Client is not installed" "$fail"
	let FCOUNTER=FCOUNTER+1
fi

#2.3.2
rsh_c=$(sudo dpkg-query -l | grep "rsh-client ")
if [ -z "$rsh_c" ]
then
        printf "%-77s %s\n" "2.3.2 Ensure rsh client is not installed" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.3.2 Ensure rsh client is not installed" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.3.3
talk_c=$(sudo dpkg-query -l | grep "talk ")
if [ -z "$talk_c" ]
then
        printf "%-77s %s\n" "2.3.3 Ensure talk client is not installed" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.3.3 Ensure talk client is not installed" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.3.4
telnet_c=$(sudo dpkg-query -l | grep "telnet ")
if [ -z "$telnet_c" ]
then
        printf "%-77s %s\n" "2.3.4 Ensure telnet client is not installed" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.3.4 Ensure telnet client is not installed" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

#2.3.5
ldap_c=$(sudo dpkg-query -l | grep "ldap-utils ")
if [ -z "$ldap_c" ]
then
        printf "%-77s %s\n" "2.3.5 Ensure LDAP client is not installed" "$pass"
        let PCOUNTER=PCOUNTER+1
else
        printf "%-77s %s\n" "2.3.5 Ensure LDAP client is not installed" "$fail"
        let FCOUNTER=FCOUNTER+1
fi

{
echo " "
}

{
echo "${orange}${bold}3 Network Configurations:${normal}"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo -e "Title\t\t\t\t\t\t\t\t\t      Status"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo "${lightpurple}${bold}3.1 Disable unused network protocols and devices:${normal}"
}

{
printf "%-77s %s\n" "3.1.1 Disable IPv6" "$na"
let NCOUNTER=NCOUNTER+1
}

{
output=""
if nmcli radio all | grep "disabled"
then 
	printf "%-77s %s\n" "3.1.2 Ensure wireless interfaces are disabled" "$pass"
	let PCOUNTER=PCOUNTER+1
else
	printf "%-77s %s\n" "3.1.2 Ensure wireless interfaces are disabled" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}


{
echo "${lightpurple}${bold}3.2 Network Parameters (Host Only):${normal}"
}


{
output=""
if sysctl net.ipv4.conf.all.send_redirects | grep "net.ipv4.conf.all.send_redirects = 0"
then
	if sysctl net.ipv4.conf.default.send_redirects | grep "net.ipv4.conf.default.send_redirects = 0"
	then
		if grep "net\.ipv4\.conf\.all\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.all.send_redirects = 0"
		then
			if grep "net\.ipv4\.conf\.all\.send_redirects" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.default.send_redirects = 0"
			then
				printf "%-77s %s\n" "3.2.1 Ensure packet redirect sending is disabled" "$pass"
				let PCOUNTER=PCOUNTER+1
			else 
				printf "%-77s %s\n" "3.2.1 Ensure packet redirect sending is disabled" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" "3.2.1 Ensure packet redirect sending is disabled" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else 
		printf "%-77s %s\n" "3.2.1 Ensure packet redirect sending is disabled" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "3.2.1 Ensure packet redirect sending is disabled" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
command_output=$( grep "^\s*linux" /boot/grub/grub.cfg | grep -v "ipv6.disable=1" )
command_output2=$( grep -E -s "^\s*net\.ipv4\.ip_forward\s*=\s*1" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf )
command_output3=$( grep -E -s "^\s*net\.ipv6\.conf\.all\.forwarding\s*=\s*1" /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf )
if [ ! -z "$command_output"  ]
then 
	if sysctl net.ipv4.ip_forward | grep "net.ipv4.ip_forward = 0" &> /dev/null
	then
		if [ -z "$command_output2" ] &> /dev/null
		then
			if sysctl net.ipv6.conf.all.forwarding | grep "net.ipv6.conf.all.forwarding = 0" &> /dev/null
			then
				if [ -z "$command_output3" ] &> /dev/null
				then
					printf "%-77s %s\n" "3.2.2 Ensure IP forwarding is disabled" "$pass"
					let PCOUNTER=PCOUNTER+1
				else 
					printf "%-77s %s\n" "3.2.2 Ensure IP forwarding is disabled" "$fail"
					let FCOUNTER=FCOUNTER+1
				fi
			else 
				printf "%-77s %s\n" "3.2.2 Ensure IP forwarding is disabled" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else 
			printf "%-77s %s\n" "3.2.2 Ensure IP forwarding is disabled" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else 
		printf "%-77s %s\n" "3.2.2 Ensure IP forwarding is disabled" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	if sysctl net.ipv4.ip_forward | grep "net.ipv4.ip_forward = 0" &> /dev/null
	then
		if [ -z "$command_output2" ] &> /dev/null
		then
			printf "%-77s %s\n" "3.2.2 Ensure IP forwarding is disabled" "$pass"
			let PCOUNTER=PCOUNTER+1
		else 
			printf "%-77s %s\n" "3.2.2 Ensure IP forwarding is disabled" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "3.2.2 Ensure IP forwarding is disabled" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
fi
}


{
echo "${lightpurple}${bold}3.3 Network Parameters (Host and Router):${normal}"
}

{
output=""
command_output=$( grep "^\s*linux" /boot/grub/grub.cfg | grep -v "ipv6.disable=1" )
if [ ! -z "$command_output"  ]
then 
	if sysctl net.ipv4.conf.all.accept_source_route | grep "net.ipv4.conf.all.accept_source_route = 0" &> /dev/null
	then
		if sysctl net.ipv4.conf.default.accept_source_route | grep "net.ipv4.conf.default.accept_source_route = 0" &> /dev/null
		then
			if grep "net\.ipv4\.conf\.all\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.all.accept_source_route= 0" &> /dev/null
			then
				if grep "net\.ipv4\.conf\.default\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.default.accept_source_route= 0" &> /dev/null
				then
					if sysctl net.ipv6.conf.all.accept_source_route | grep "net.ipv6.conf.all.accept_source_route = 0" &> /dev/null
					then 
						if sysctl net.ipv6.conf.default.accept_source_route | grep "net.ipv6.conf.default.accept_source_route = 0" &> /dev/null
						then 
							if grep "net\.ipv6\.conf\.all\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.all.accept_source_route= 0" &> /dev/null
							then 
								if grep "net\.ipv6\.conf\.default\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv6.conf.default.accept_source_route= 0" &> /dev/null
								then
									printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$pass"
									let PCOUNTER=PCOUNTER+1
								else 
									printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
									let FCOUNTER=FCOUNTER+1
								fi
							else 
								printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
								let FCOUNTER=FCOUNTER+1
							fi
						else
							printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
							let FCOUNTER=FCOUNTER+1
						fi
					else
						printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
						let FCOUNTER=FCOUNTER+1
					fi
				else
					printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
					let FCOUNTER=FCOUNTER+1
				fi
			else
				printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else 
			printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	if sysctl net.ipv4.conf.all.accept_source_route | grep "net.ipv4.conf.all.accept_source_route = 0" &> /dev/null
	then
		if sysctl net.ipv4.conf.default.accept_source_route | grep "net.ipv4.conf.default.accept_source_route = 0" &> /dev/null
		then
			if grep "net\.ipv4\.conf\.all\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.all.accept_source_route= 0" &> /dev/null
			then
				if grep "net\.ipv4\.conf\.default\.accept_source_route" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.default.accept_source_route= 0" &> /dev/null
				then
					printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$pass"
					let PCOUNTER=PCOUNTER+1
				else 
					printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
					let FCOUNTER=FCOUNTER+1
				fi
			else
				printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "3.3.1 Ensure source routed packets are not accepted" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
fi
}

{
output=""
command_output=$( grep "^\s*linux" /boot/grub/grub.cfg | grep -v "ipv6.disable=1" )
if [ ! -z "$command_output"  ]
then 
	if sysctl net.ipv4.conf.all.accept_redirects | grep "net.ipv4.conf.all.accept_redirects = 0" &> /dev/null
	then
		if sysctl net.ipv4.conf.default.accept_redirects | grep "net.ipv4.conf.default.accept_redirects = 0" &> /dev/null
		then
			if grep "net\.ipv4\.conf\.all\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.all.accept_redirects= 0" &> /dev/null
			then
				if grep "net\.ipv4\.conf\.default\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.default.accept_redirects= 0" &> /dev/null
				then
					if sysctl net.ipv6.conf.all.accept_redirects | grep "net.ipv6.conf.all.accept_redirects = 0" &> /dev/null
					then
						if sysctl net.ipv6.conf.default.accept_redirects | grep "net.ipv6.conf.default.accept_redirects = 0" &> /dev/null
						then
							if grep "net\.ipv6\.conf\.all\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv6.conf.all.accept_redirects= 0" &> /dev/null
							then
								if grep "net\.ipv6\.conf\.default\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv6.conf.default.accept_redirects= 0" &> /dev/null
								then
									printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$pass"
									let PCOUNTER=PCOUNTER+1
								else
									printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
									let FCOUNTER=FCOUNTER+1
								fi
							else
								printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
								let FCOUNTER=FCOUNTER+1
							fi
						else
							printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
							let FCOUNTER=FCOUNTER+1
						fi
					else
						printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
						let FCOUNTER=FCOUNTER+1
					fi
				else
					printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
					let FCOUNTER=FCOUNTER+1
				fi
			else
				printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	if sysctl net.ipv4.conf.all.accept_redirects | grep "net.ipv4.conf.all.accept_redirects = 0" &> /dev/null
	then
		if sysctl net.ipv4.conf.default.accept_redirects | grep "net.ipv4.conf.default.accept_redirects = 0" &> /dev/null
		then
			if grep "net\.ipv4\.conf\.all\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.all.accept_redirects= 0" &> /dev/null
			then
				if grep "net\.ipv4\.conf\.default\.accept_redirects" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.default.accept_redirects= 0" &> /dev/null
				then
					printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$pass"
					let PCOUNTER=PCOUNTER+1
				else 
					printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
					let FCOUNTER=FCOUNTER+1
				fi
			else
				printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "3.3.2 Ensure ICMP redirects are not accepted" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
fi
}

{
output=""
if sysctl net.ipv4.conf.all.secure_redirects | grep "net.ipv4.conf.all.secure_redirects = 0" &> /dev/null
then
	if sysctl net.ipv4.conf.default.secure_redirects | grep "net.ipv4.conf.default.secure_redirects = 0" &> /dev/null
	then
		if grep "net\.ipv4\.conf\.all\.secure_redirects" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.all.secure_redirects= 0" &> /dev/null
		then
			if grep "net\.ipv4\.conf\.default\.secure_redirects" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.default.secure_redirects= 0" &> /dev/null
			then
				printf "%-77s %s\n" "3.3.3 Ensure secure ICMP redirects are not accepted" "$pass"
				let PCOUNTER=PCOUNTER+1
			else
				printf "%-77s %s\n" "3.3.3 Ensure secure ICMP redirects are not accepted" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" "3.3.3 Ensure secure ICMP redirects are not accepted" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "3.3.3 Ensure secure ICMP redirects are not accepted" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "3.3.3 Ensure secure ICMP redirects are not accepted" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
if sysctl net.ipv4.conf.all.log_martians | grep "net.ipv4.conf.all.log_martians = 1" &> /dev/null
then
	if sysctl net.ipv4.conf.default.log_martians | grep "net.ipv4.conf.default.log_martians = 1" &> /dev/null
	then
		if grep "net\.ipv4\.conf\.all\.log_martians" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.all.log_martians = 1" &> /dev/null
		then
			if grep "net\.ipv4\.conf\.default\.log_martians" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.default.log_martians = 1" &> /dev/null
			then
				printf "%-77s %s\n" "3.3.4 Ensure suspicious packets are logged" "$pass"
				let PCOUNTER=PCOUNTER+1
			else
				printf "%-77s %s\n" "3.3.4 Ensure suspicious packets are logged" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" "3.3.4 Ensure suspicious packets are logged" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "3.3.4 Ensure suspicious packets are logged" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "3.3.4 Ensure suspicious packets are logged" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
if sysctl net.ipv4.icmp_echo_ignore_broadcasts | grep "net.ipv4.icmp_echo_ignore_broadcasts = 1" &> /dev/null
then
	if grep "net\.ipv4\.icmp_echo_ignore_broadcasts" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.icmp_echo_ignore_broadcasts = 1" &> /dev/null
	then
		printf "%-77s %s\n" "3.3.5 Ensure broadcast ICMP requests are ignored" "$pass"
		let PCOUNTER=PCOUNTER+1
	else 
		printf "%-77s %s\n" "3.3.5 Ensure broadcast ICMP requests are ignored" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "3.3.5 Ensure broadcast ICMP requests are ignored" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
if sysctl net.ipv4.icmp_ignore_bogus_error_responses | grep "net.ipv4.icmp_ignore_bogus_error_responses = 1" &> /dev/null
then
	if grep "net.ipv4.icmp_ignore_bogus_error_responses" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.icmp_ignore_bogus_error_responses = 1" &> /dev/null
	then
		printf "%-77s %s\n" "3.3.6 Ensure bogus ICMP responses are ignored" "$pass"
		let PCOUNTER=PCOUNTER+1
	else
		printf "%-77s %s\n" "3.3.6 Ensure bogus ICMP responses are ignored" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "3.3.6 Ensure bogus ICMP responses are ignored" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
if sysctl net.ipv4.conf.all.rp_filter | grep "net.ipv4.conf.all.rp_filter = 1" &> /dev/null
then
	if sysctl net.ipv4.conf.default.rp_filter | grep "net.ipv4.conf.default.rp_filter = 1" &> /dev/null
	then
		if grep "net\.ipv4\.conf\.all\.rp_filter" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.all.rp_filter = 1" &> /dev/null
		then
			if grep "net\.ipv4\.conf\.default\.rp_filter" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.conf.default.rp_filter = 1" &> /dev/null
			then
				printf "%-77s %s\n" "3.3.7 Ensure Reverse Path Filtering is enabled" "$pass"
				let PCOUNTER=PCOUNTER+1
			else
				printf "%-77s %s\n" "3.3.7 Ensure Reverse Path Filtering is enabled" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" "3.3.7 Ensure Reverse Path Filtering is enabled" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "3.3.7 Ensure Reverse Path Filtering is enabled" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "3.3.7 Ensure Reverse Path Filtering is enabled" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
if sysctl net.ipv4.tcp_syncookies | grep "net.ipv4.tcp_syncookies = 1" &> /dev/null
then
	if grep "net\.ipv4\.tcp_syncookies" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv4.tcp_syncookies = 1" &> /dev/null
	then
		printf "%-77s %s\n" "3.3.8 Ensure TCP SYN Cookies is enabled" "$pass"
		let PCOUNTER=PCOUNTER+1
	else
		printf "%-77s %s\n" "3.3.8 Ensure TCP SYN Cookies is enabled" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "3.3.8 Ensure TCP SYN Cookies is enabled" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
command_output=$( grep "^\s*linux" /boot/grub/grub.cfg | grep -v "ipv6.disable=1" )
if [ ! -z "$command_output"  ]
then
	if sysctl net.ipv6.conf.all.accept_ra | grep "net.ipv6.conf.all.accept_ra = 0" &> /dev/null
	then
		if sysctl net.ipv6.conf.default.accept_ra | grep "net.ipv6.conf.default.accept_ra = 0" &> /dev/null
		then
			if grep "net\.ipv6\.conf\.all\.accept_ra" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv6.conf.all.accept_ra = 0" &> /dev/null
			then
				if grep "net\.ipv6\.conf\.default\.accept_ra" /etc/sysctl.conf /etc/sysctl.d/* | grep "net.ipv6.conf.default.accept_ra = 0" &> /dev/null
				then
					printf "%-77s %s\n" "3.3.9 Ensure IPv6 router advertisements are not accepted" "$pass"
					let PCOUNTER=PCOUNTER+1
				else
					printf "%-77s %s\n" "3.3.9 Ensure IPv6 router advertisements are not accepted" "$fail"
					let FCOUNTER=FCOUNTER+1
				fi
			else
				printf "%-77s %s\n" "3.3.9 Ensure IPv6 router advertisements are not accepted" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" "3.3.9 Ensure IPv6 router advertisements are not accepted" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "3.3.9 Ensure IPv6 router advertisements are not accepted" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "3.3.9 Ensure IPv6 router advertisements are not accepted" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
echo "${lightpurple}${bold}3.4 Uncommon Network Protocols:${normal}"
}

{
output=""
command_output=$( lsmod | grep dccp )
if modprobe -n -v dccp | grep "install /bin/true" &> /dev/null
then
	if [ -z $command_output ]
	then
		printf "%-77s %s\n" "3.4.1 Ensure DCCP is disabled" "$pass"
		let PCOUNTER=PCOUNTER+1
	else 
		printf "%-77s %s\n" "3.4.1 Ensure DCCP is disabled" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "3.4.1 Ensure DCCP is disabled" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
command_output=$( lsmod | grep sctp )
if modprobe -n -v sctp | grep -E '(sctp|install)' | grep "install /bin/true" &> /dev/null
then
        if [ -z $command_output ]
        then
		printf "%-77s %s\n" "3.4.2 Ensure SCTP is disabled" "$pass"
		let PCOUNTER=PCOUNTER+1
        else 
		printf "%-77s %s\n" "3.4.2 Ensure SCTP is disabled" "$fail"
		let FCOUNTER=FCOUNTER+1
        fi
else
	printf "%-77s %s\n" "3.4.2 Ensure SCTP is disabled" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
command_output=$( lsmod | grep rds )
if modprobe -n -v rds | grep "install /bin/true" &> /dev/null
then
        if [ -z $command_output ]
        then
		printf "%-77s %s\n" "3.4.3 Ensure RDS is disabled" "$pass"
		let PCOUNTER=PCOUNTER+1
        else 
		printf "%-77s %s\n" "3.4.3 Ensure RDS is disabled" "$fail"
		let FCOUNTER=FCOUNTER+1
        fi
else
	printf "%-77s %s\n" "3.4.3 Ensure RDS is disabled" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
command_output=$( lsmod | grep tipc )
if modprobe -n -v tipc | grep -E '(tipc|install)' | grep "install /bin/true" &> /dev/null
then
        if [ -z $command_output ]
        then
		printf "%-77s %s\n" "3.4.4 Ensure TIPC is disabled" "$pass"
		let PCOUNTER=PCOUNTER+1
        else 
		printf "%-77s %s\n" "3.4.4 Ensure TIPC is disabled" "$fail"
		let FCOUNTER=FCOUNTER+1
        fi
else
	printf "%-77s %s\n" "3.4.4 Ensure TIPC is disabled" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
echo "${lightpurple}${bold}3.5 Firewall Configuration:${normal}"
}

{
echo "${orange}${bold}[+]	3.5.1 Ensure Firewall software is installed:${normal}"
}

{
output=""
if dpkg -s ufw | grep -i status | grep "Status: install ok installed" &> /dev/null;
then
	if dpkg -s nftables | grep -i status | grep "Status: install ok installed" &> /dev/null;
	then
		if dpkg -s iptables | grep -i status | grep "Status: install ok installed" &> /dev/null;
		then
			printf "%-77s %s\n" " 3.5.1.1 Ensure a Firewall package is installed" "$pass"
			let PCOUNTER=PCOUNTER+1
		else
			printf "%-77s %s\n" " 3.5.1.1 Ensure a Firewall package is installed" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" " 3.5.1.1 Ensure a Firewall package is installed" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" " 3.5.1.1 Ensure a Firewall package is installed" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
echo "${orange}${bold}[+]	3.5.2 Configure UncomplicatedFirewall:${normal}"
}

{
output=""
if systemctl is-enabled ufw | grep "enabled" &> /dev/null
then
	if ufw status | grep Status | grep "Status: active" &> /dev/null
	then
		printf "%-77s %s\n" " 3.5.2.1 Ensure ufw service is enabled" "$pass"
		let PCOUNTER=PCOUNTER+1
	else
		printf "%-77s %s\n" " 3.5.2.1 Ensure ufw service is enabled" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" " 3.5.2.1 Ensure ufw service is enabled" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
if ufw status verbose | grep "deny (incoming)" &> /dev/null
then
	if ufw status verbose | grep "deny (outgoing)" &> /dev/null
	then
		if ufw status verbose | grep "deny (routed)" &> /dev/null
		then
			printf "%-77s %s\n" " 3.5.2.2 Ensure default deny firewall policy" "$pass"
			let PCOUNTER=PCOUNTER+1
		else
			printf "%-77s %s\n" " 3.5.2.2 Ensure default deny firewall policy" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" " 3.5.2.2 Ensure default deny firewall policy" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" " 3.5.2.2 Ensure default deny firewall policy" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
if sudo ufw status verbose | grep "Anywhere on 1o             ALLOW IN    Anywhere" &> /dev/null
then
	if sudo ufw status verbose | grep "Anywhere                   DENY IN     127.0.0.0/8" &> /dev/null
	then
		if sudo ufw status verbose | grep "Anywhere (v6) on 1o        ALLOW IN    Anywhere (v6)" &> /dev/null
		then
			if sudo ufw status verbose | grep "Anywhere (v6)              DENY IN     ::1" &> /dev/null
			then
				if sudo ufw status verbose | grep "Anywhere                   ALLOW OUT   Anywhere on 1o" &> /dev/null
				then
					if sudo ufw status verbose | grep "Anywhere (v6)              ALLOW OUT   Anywhere (v6) on 1o" &> /dev/null
					then
						printf "%-77s %s\n" " 3.5.2.3 Ensure loopback traffic is configured" "$pass"
						let PCOUNTER=PCOUNTER+1
					else
						printf "%-77s %s\n" " 3.5.2.3 Ensure loopback traffic is configured" "$fail"
						let FCOUNTER=FCOUNTER+1
					fi
				else
					printf "%-77s %s\n" " 3.5.2.3 Ensure loopback traffic is configured" "$fail"
					let FCOUNTER=FCOUNTER+1
				fi
			else
				printf "%-77s %s\n" " 3.5.2.3 Ensure loopback traffic is configured" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" " 3.5.2.3 Ensure loopback traffic is configured" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" " 3.5.2.3 Ensure loopback traffic is configured" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" " 3.5.2.3 Ensure loopback traffic is configured" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
printf "%-77s %s\n" " 3.5.2.4 Ensure outbound connections are configured" "$na"
let NCOUNTER=NCOUNTER+1
}

{
output=""
if ufw status | grep "/tcp" &> /dev/null
then
	printf "%-77s %s\n" " 3.5.2.5 Ensure firewall rules exist for all open ports" "$pass"
	let PCOUNTER=PCOUNTER+1
else
	printf "%-77s %s\n" " 3.5.2.5 Ensure firewall rules exist for all open ports" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
echo "${orange}${bold}[+]	3.5.3 Configure nftables:${normal}"
}

{
printf "%-77s %s\n" " 3.5.3.1 Ensure iptables are flushed" "$na"
let NCOUNTER=NCOUNTER+1
}

{
output=""
command_output=$( nft list tables )
if [ ! -z "$command_output" ]
then
	printf "%-77s %s\n" " 3.5.3.2 Ensure a table exists" "$pass"
	let PCOUNTER=PCOUNTER+1
else
	printf "%-77s %s\n" " 3.5.3.2 Ensure a table exists" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
if nft list ruleset | grep 'hook input' | grep "type filter hook input priority 0;" &> /dev/null
then
	if nft list ruleset | grep 'hook forward' | grep "type filter hook forward priority 0;" &> /dev/null
	then
		if nft list ruleset | grep 'hook output' | grep "type filter hook output priority 0;" &> /dev/null
		then
			printf "%-77s %s\n" " 3.5.3.3 Ensure base chains exist" "$pass"
			let PCOUNTER=PCOUNTER+1
		else
			printf "%-77s %s\n" " 3.5.3.3 Ensure base chains exist" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" " 3.5.3.3 Ensure base chains exist" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" " 3.5.3.3 Ensure base chains exist" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
command_output=$( grep "^\s*linux" /boot/grub/grub.cfg | grep -v "ipv6.disable=1" )
if [ ! -z "$command_output"  ]
then 
	if nft list ruleset | awk '/hook input/,/}/' | grep 'ip6 saddr' | grep "ip6 saddr ::1 counter packets 0 bytes 0 drop" &> /dev/null
	then
		if nft list ruleset | awk '/hook input/,/}/' | grep 'iif "lo" accept' &> /dev/null
		then
			if nft list ruleset | awk '/hook input/,/}/' | grep 'ip sddr' | grep "ip saddr 127.0.0.0/8 counter packets 0 bytes 0 drop" &> /dev/null
			then
				printf "%-77s %s\n" " 3.5.3.4 Ensure loopback traffic is configured" "$pass"
				let PCOUNTER=PCOUNTER+1
			else
				printf "%-77s %s\n" " 3.5.3.4 Ensure loopback traffic is configured" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" " 3.5.3.4 Ensure loopback traffic is configured" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" " 3.5.3.4 Ensure loopback traffic is configured" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	if nft list ruleset | awk '/hook input/,/}/' | grep 'iif "lo" accept' &> /dev/null
	then
		if nft list ruleset | awk '/hook input/,/}/' | grep 'ip sddr' | grep "ip saddr 127.0.0.0/8 counter packets 0 bytes 0 drop" &> /dev/null
		then
			printf "%-77s %s\n" " 3.5.3.4 Ensure loopback traffic is configured" "$pass"
			let PCOUNTER=PCOUNTER+1
		else
			printf "%-77s %s\n" " 3.5.3.4 Ensure loopback traffic is configured" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" " 3.5.3.4 Ensure loopback traffic is configured" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
fi
}

{
printf "%-77s %s\n" " 3.5.3.5 Ensure outbound and established connections are configured" "$na"
let NCOUNTER=NCOUNTER+1
}

{
output=""
if nft list ruleset | grep 'hook input' | grep "type filter hook input priority 0; policy drop" &> /dev/null
then
	if nft list ruleset | grep 'hook forward' | grep "type filter hook forward priority 0; policy drop" &> /dev/null
	then
		if nft list ruleset | grep 'hook output' | grep "type filter hook output priority 0; policy drop" &> /dev/null
		then
			printf "%-77s %s\n" " 3.5.3.6 Ensure default deny firewall policy" "$pass"
			let PCOUNTER=PCOUNTER+1
		else
			printf "%-77s %s\n" " 3.5.3.6 Ensure default deny firewall policy" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" " 3.5.3.6 Ensure default deny firewall policy" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" " 3.5.3.6 Ensure default deny firewall policy" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
if systemctl is-enabled nftables | grep "enabled" &> /dev/null
then
	printf "%-77s %s\n" " 3.5.3.7 Ensure nftables service is enabled" "$pass"
	let PCOUNTER=PCOUNTER+1
else
	printf "%-77s %s\n" " 3.5.3.7 Ensure nftables service is enabled" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

#{
#ouput=""
#command_output=$(awk '/hook input/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print$2 }' /etc/nftables.conf))
#command_output2=$(awk '/hook forward/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print$2 }' /etc/nftables.conf))
#command_output3=$(awk '/hook output/,/}/' $(awk '$1 ~ /^\s*include/ { gsub("\"","",$2);print$2 }' /etc/nftables.conf))
#if [ ! -z "$command_output"  ]
#then
#	if [ ! -z "$command_output2"  ]
#	then
#		if [ ! -z "$command_output"  ]
#		then
#			printf "%-77s %s\n" " 3.5.3.8 Ensure nftables rules are permanent" "$pass"
#			let PCOUNTER=PCOUNTER+1
#		else
#			printf "%-77s %s\n" " 3.5.3.8 Ensure nftables rules are permanent" "$fail"
#			let FCOUNTER=FCOUNTER+1
#		fi
#	else
#		printf "%-77s %s\n" " 3.5.3.8 Ensure nftables rules are permanent" "$fail"
#		let FCOUNTER=FCOUNTER+1
#	fi
#else
#	printf "%-77s %s\n" " 3.5.3.8 Ensure nftables rules are permanent" "$fail"
#	let FCOUNTER=FCOUNTER+1
#fi
#}

{
echo "${orange}${bold}[+]	3.5.4 Configure iptables:${normal}"
}

{
echo "${lightpurple}${bold} 3.5.4.1 Configure IPv4 iptables:${normal}"
}

{
output=""
if iptables -L | grep "Chain INPUT (policy DROP)" &> /dev/null
then
	if iptables -L | grep "Chain FORWARD (policy DROP)" &> /dev/null
	then
		if iptables -L | grep "Chain OUTPUT (policy DROP)" &> /dev/null
		then
			printf "%-77s %s\n" "  3.5.4.1.1 Ensure default deny firewall policy" "$pass"
			let PCOUNTER=PCOUNTER+1
		else
			printf "%-77s %s\n" "  3.5.4.1.1 Ensure default deny firewall policy" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "  3.5.4.1.1 Ensure default deny firewall policy" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "  3.5.4.1.1 Ensure default deny firewall policy" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
if iptables -L INPUT -v -n | grep "ACCEPT     all  --  1o     *       0.0.0.0/0            0.0.0.0/0" &> /dev/null
then
	if iptables -L INPUT -v -n | grep "DROP       all  --  *      *       127.0.0.0/8          0.0.0.0/0" &> /dev/null
	then
		if iptables -L OUTPUT -v -n | grep "ACCEPT     all  --  *      1o      0.0.0.0/0            0.0.0.0/0" &> /dev/null
		then
			printf "%-77s %s\n" "  3.5.4.1.2 Ensure loopback traffic is configured" "$pass"
			let PCOUNTER=PCOUNTER+1
		else
			printf "%-77s %s\n" "  3.5.4.1.2 Ensure loopback traffic is configured" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "  3.5.4.1.2 Ensure loopback traffic is configured" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "  3.5.4.1.2 Ensure loopback traffic is configured" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

printf "%-77s %s\n" "  3.5.4.1.3 Ensure outbound and established connections are configured" "$na"
let NCOUNTER=NCOUNTER+1

{
output=""
if iptables -L INPUT -v -n | grep "tcp dpt:" &> /dev/null
then
	printf "%-77s %s\n" "  3.5.4.1.4 Ensure firewall rules exist for all open ports" "$pass"
	let PCOUNTER=PCOUNTER+1
else
	printf "%-77s %s\n" "  3.5.4.1.4 Ensure firewall rules exist for all open ports" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
echo "${lightpurple}${bold} 3.5.4.2 Configure IPv6 iptables:${normal}"
}

{
output=""
command_output=$( grep "^\s*linux" /boot/grub/grub.cfg | grep -v "ipv6.disable=1" )
if [ ! -z "$command_output"  ]
then
	if ip6tables -L | grep "Chain INPUT (policy DROP)" &> /dev/null
	then
		if ip6tables -L | grep "Chain FORWARD (policy DROP)" &> /dev/null
		then
			if ip6tables -L | grep "Chain OUTPUT (policy DROP)" &> /dev/null
			then
				printf "%-77s %s\n" "  3.5.4.2.1 Ensure IPv6 default deny firewall policy" "$pass"
				let PCOUNTER=PCOUNTER+1
			else
				printf "%-77s %s\n" "  3.5.4.2.1 Ensure IPv6 default deny firewall policy" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" "  3.5.4.2.1 Ensure IPv6 default deny firewall policy" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "  3.5.4.2.1 Ensure IPv6 default deny firewall policy" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "  3.5.4.2.1 Ensure IPv6 default deny firewall policy" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
output=""
command_output=$( grep "^\s*linux" /boot/grub/grub.cfg | grep -v "ipv6.disable=1" )
if [ ! -z "$command_output"  ]
then
	if ip6tables -L INPUT -v -n | grep "ACCEPT     all      1o     *       ::/0                 ::/0" &> /dev/null
	then
		if ip6tables -L INPUT -v -n | grep "DROP       all      *      *       ::1                  ::/0" &> /dev/null
		then
			if ip6tables -L OUTPUT -v -n | grep "ACCEPT     all      *      1o      ::/0                 ::/0" &> /dev/null
			then
				printf "%-77s %s\n" "  3.5.4.2.2 Ensure IPv6 loopback traffic is configured" "$pass"
				let PCOUNTER=PCOUNTER+1
			else
				printf "%-77s %s\n" "  3.5.4.2.2 Ensure IPv6 loopback traffic is configured" "$fail"
				let FCOUNTER=FCOUNTER+1
			fi
		else
			printf "%-77s %s\n" "  3.5.4.2.2 Ensure IPv6 loopback traffic is configured" "$fail"
			let FCOUNTER=FCOUNTER+1
		fi
	else
		printf "%-77s %s\n" "  3.5.4.2.2 Ensure IPv6 loopback traffic is configured" "$fail"
		let FCOUNTER=FCOUNTER+1
	fi
else
	printf "%-77s %s\n" "  3.5.4.2.2 Ensure IPv6 loopback traffic is configured" "$fail"
	let FCOUNTER=FCOUNTER+1
fi
}

{
printf "%-77s %s\n" "  3.5.4.2.3 Ensure IPv6 outbound and established connections are configured" "$na"
let NCOUNTER=NCOUNTER+1
}

{
printf "%-77s %s\n" "  3.5.4.2.4 Ensure IPv6 firewall rules exist for all open ports" "$na"
let NCOUNTER=NCOUNTER+1
}

{
echo " "
}

{
echo "${orange}${bold}5 Access, Authentication and Authorization:${normal}"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo -e "Title\t\t\t\t\t\t\t\t\t      Status"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo "${lightpurple}${bold}5.1 Configure Cron:${normal}"
}

{
output=""
if systemctl is-enabled cron | grep "enabled" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
echo -e "5.1.1 Ensure cron daemon is enabled\t\t\t\t\t$output"
}

{
output=""
if stat /etc/crontab | grep "Access: (0600/-rw-------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.1.2 Ensure permissions on /etc/crontab are configured\t\t\t$output"
}

{
output=""
if stat /etc/cron.hourly | grep "Access: (0700/drwx------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.1.3 Ensure permissions on /etc/cron.hourly are configured\t\t$output"
}

{
output=""
if stat /etc/cron.daily | grep "Access: (0700/drwx------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.1.4 Ensure permissions on /etc/cron.daily are configured\t\t$output"
}

{
output=""
if stat /etc/cron.weekly | grep "Access: (0700/drwx------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.1.5 Ensure permissions on /etc/cron.weekly are configured\t\t$output"
}

{
output=""
if stat /etc/cron.monthly | grep "Access: (0700/drwx------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.1.6 Ensure permissions on /etc/cron.monthly are configured\t\t$output"
}

{
output=""
if stat /etc/cron.d | grep "Access: (0700/drwx------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.1.7 Ensure permissions on /etc/cron.d are configured\t\t\t$output"
}

{
output=""
if [ ! -e /etc/cron.deny ] &> /dev/null
then
	if [ ! -e /etc/at.deny ] &> /dev/null
	then
		if [ -e /etc/cron.allow ] &> /dev/null
		then
			if [ -e /etc/at.allow ] &> /dev/null
			then
				if stat /etc/cron.allow | grep "Access: (0640/-rw-r-----)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
				then
					if stat /etc/at.allow | grep "Access: (0640/-rw-r-----)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
					then
						output=$( echo -e "      [${lightgreen}PASS${normal}]" )
					        let PCOUNTER=PCOUNTER+1
					else
						output=$( echo -e "      [${lightred}FAIL${normal}]" )
					        let FCOUNTER=FCOUNTER+1
					fi
				else
					output=$( echo -e "      [${lightred}FAIL${normal}]" )
				        let FCOUNTER=FCOUNTER+1
				fi
			else
				output=$( echo -e "      [${lightred}FAIL${normal}]" )
			        let FCOUNTER=FCOUNTER+1
			fi
		else
			output=$( echo -e "      [${lightred}FAIL${normal}]" )
		        let FCOUNTER=FCOUNTER+1
		fi
	else
		output=$( echo -e "      [${lightred}FAIL${normal}]" )
	        let FCOUNTER=FCOUNTER+1
	fi
else
	output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.1.8 Ensure at/cron is restricted to authorized users\t\t\t$output"
}

{
echo "${lightpurple}${bold}5.2 SSH Server Configuration:${normal}"
}

{
output=""
if stat /etc/ssh/sshd_config | grep "Access: (0600/-rw-------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.1 Ensure permissions on /etc/ssh/sshd_config are configured\t\t$output"
}

{
output=""
if find /etc/ssh -xdev -type f -name 'ssh_host_*_key' -exec stat {} \; | grep "Access: (0600/-rw-------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.2 Ensure permissions on SSH private host key files are configured\t$output"
}

{
output=""
if find /etc/ssh -xdev -type f -name 'ssh_host_*_key.pub' -exec stat {} \;  | grep "Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.3 Ensure permissions on SSH public host key files are configured\t$output"
}

{
output=""
command_output=$( sshd -T | grep -Ei '^\s*protocol\s+(1|1\s*,\s*2|2\s*,\s*1)\s*' )
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.4 Ensure SSH protocol is not set to 1\t\t\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep loglevel &> /dev/null 
then
        if grep -i 'loglevel' /etc/ssh/sshd_config | grep -Evi  '(VERBOSE|INFO)' &> /dev/null
        then 
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
		let FCOUNTER=FCOUNTER+1
        else 
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        	let PCOUNTER=PCOUNTER+1
	fi
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.5 Ensure SSH LogLevel is appropriate\t\t\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i x11forwarding | grep "x11forwarding no" &> /dev/null 
then
        if grep -Ei '^\s*x11forwarding\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        else 
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        fi
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.6 Ensure SSH X11 Forwarding is disabled\t\t\t\t$output"
}

{
output=""
command_output=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep maxauthtries | awk '{print $2}')
if [ $command_output -le 4 ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.7 Ensure SSH MaxAuthTries is set to 4 or less\t\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep ignorerhosts | grep "ignorerhosts yes" &> /dev/null 
then
        if grep -Ei '^\s*ignorerhosts\s+no' /etc/ssh/sshd_config &> /dev/null
        then 
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        else 
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        fi
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.8 Ensure SSH IgnoreRhosts is enabled\t\t\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep hostbasedauthentication | grep "hostbasedauthentication no" &> /dev/null 
then
        if grep -Ei '^\s*HostBasedAuthentication\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        else 
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        fi
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.9 Ensure SSH HostbasedAuthentication is disabled\t\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitrootlogin | grep "permitrootlogin no"  &> /dev/null 
then
        if grep -Ei '^\s*PermitRootLogin\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        else 
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        fi
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.10 Ensure SSH root login is disabled\t\t\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permitemptypasswords | grep "permitemptypasswords no" &> /dev/null 
then
        if grep -Ei '^\s*PermitEmptyPasswords\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        else 
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        fi
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.11 Ensure SSH PermitEmptyPasswords is disabled\t\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep permituserenvironment | grep "permituserenvironment no" &> /dev/null 
then
        if grep -Ei '^\s*PermitUserEnvironment\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        else 
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        fi
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.12 Ensure SSH PermitUserEnvironment is disabled\t\t\t$output"
}

{
output=""
command_output=$( sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Ei '^\s*ciphers\s+([^#]+,)?(3des-cbc|aes128-cbc|aes192-cbc|aes256-cbc|arcfour|arcfour128|arcfour256|blowfish-cbc|cast128-cbc|rijndael-cbc@lysator.liu.se)\b' )
command_output2=$( grep -Eis '^\s*ciphers\s+([^#]+,)?(3des-cbc|aes128-cbc|aes192-cbc|aes256-cbc|arcfour|arcfour128|arcfour256|blowfish-cbc|cast128-cbc|rijndael-cbc@lysator.liu.se)\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf )
if [ -z "$command_output" ]
then
        if [ -z "$command_output2" ]
        then 
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        else 
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        fi
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.13 Ensure only strong Ciphers are used\t\t\t\t$output"
}

{
output=""
command_output=$( sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Ei '^\s*macs\s+([^#]+,)?(hmac-md5|hmac-md5-96|hmac-ripemd160|hmac-sha1|hmac-sha1-96|umac-64@openssh\.com|hmac-md5-etm@openssh\.com|hmac-md5-96-etm@openssh\.com|hmac-ripemd160-etm@openssh\.com|hmac-sha1-etm@openssh\.com|hmac-sha1-96-etm@openssh\.com|umac-64-etm@openssh\.com|umac-128-etm@openssh\.com)\b' )
command_output2=$( grep -Eis '^\s*macs\s+([^#]+,)?(hmac-md5|hmac-md5-96|hmac-ripemd160|hmac-sha1|hmac-sha1-96|umac-64@openssh\.com|hmac-md5-etm@openssh\.com|hmac-md5-96-etm@openssh\.com|hmac-ripemd160-etm@openssh\.com|hmac-sha1-etm@openssh\.com|hmac-sha1-96-etm@openssh\.com|umac-64-etm@openssh\.com|umac-128-etm@openssh\.com)\b' /etc/ssh/sshd_config /etc/ssh/sshd_config.d/*.conf )
if [ -z "$command_output" ]
then
        if [ -z "$command_output2" ]
        then
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        else
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
               let  FCOUNTER=FCOUNTER+1
        fi
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.14 Ensure only strong MAC algorithms are used\t\t\t$output"
}

{
output=""
command_output=$( sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Ei '^\s*kexalgorithms\s+([^#]+,)?(diffie-hellman-group1-sha1|diffie-hellman-group14-sha1|diffie-hellman-group-exchange-sha1)\b' )
command_output2=$( grep -Ei '^\s*kexalgorithms\s+([^#]+,)?(diffie-hellman-group1-sha1|diffie-hellman-group14-sha1|diffie-hellman-group-exchange-sha1)\b' /etc/ssh/sshd_config )
if [ -z "$command_output" ]
then
        if [ -z "$command_output2" ]
        then
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        else
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        fi
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.15 Ensure only strong Key Exchange algorithms are used\t\t$output"
}

{
output=""
command_output=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientaliveinterval | awk '{print $2}')
command_output2=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep clientalivecountmax | awk '{print $2}')
if [ $command_output -ge 1 ] && [ $command_output -le 900 ] && [ $command_output2 == 0 ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.16 Ensure SSH Idle Timeout Interval is configured\t\t\t$output"
}

{
output=""
command_output=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep logingracetime | awk '{print $2}')
if [ $command_output -ge 1 ] && [ $command_output -le 60 ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.17 Ensure SSH LoginGraceTime is set to one minute or less\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -Pi '^\h*(allow|deny)(users|groups)\h+\H+(\h+.*)?$' &> /dev/null 
then
	output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        if grep -Pi '^\h*(allow|deny)(users|groups)\h+\H+(\h+.*)?$' /etc/ssh/sshd_config &> /dev/null
        then 
	        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        	let PCOUNTER=PCOUNTER+1
	else
        	output=$( echo -e "      [${lightred}FAIL${normal}]" )
        	let FCOUNTER=FCOUNTER+1
	fi
fi
echo -e "5.2.18 Ensure SSH access is limited\t\t\t\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep banner | grep "banner /etc/issue.net" &> /dev/null
then 
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.19 Ensure SSH warning banner is configured\t\t\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i usepam | grep "usepam yes" &> /dev/null 
then
        if grep -Ei '^\s*UsePAM\s+no' /etc/ssh/sshd_config &> /dev/null
        then 
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        else 
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        fi
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.20 Ensure SSH PAM is enabled\t\t\t\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i allowtcpforwarding | grep "allowtcpforwarding no" &> /dev/null 
then
        if grep -Ei '^\s*AllowTcpForwarding\s+yes' /etc/ssh/sshd_config &> /dev/null
        then 
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        else 
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        fi
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.21 Ensure SSH AllowTcpForwarding is disabled\t\t\t$output"
}

{
output=""
if sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxstartups | grep "maxstartups 10:30:60" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.22 Ensure SSH MaxStartups is configured\t\t\t\t$output"
}

{
output=""
command_output=$(sshd -T -C user=root -C host="$(hostname)" -C addr="$(grep $(hostname) /etc/hosts | awk '{print $1}')" | grep -i maxsessions | awk '{print $2}')
if [ $command_output -le 10 ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.2.23 Ensure SSH MaxSessions is limited\t\t\t\t$output"
}

{
echo "${lightpurple}${bold}5.3 Configure PAM:${normal}"
}

{
output=""
command_output=$(grep ^minlen /etc/security/pwquality.conf | awk '{print $3}')
command_output2=$(grep ^minclass /etc/security/pwquality.conf | awk '{print $3}')
if [ $command_output -ge 14 ] &> /dev/null
then
        if [ $command_output2 == 4 ] &> /dev/null
        then
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        else
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        fi
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.3.1 Ensure password creation requirements are configured\t\t$output"
}

{
output=""
if [ -e /etc/security/faillock.conf ] &> /dev/null
then
	command_output=$(grep -E '^\s*deny\s*=\s*[1-5]\b' /etc/security/faillock.conf | awk '{print $3}')
	command_output2=$(grep -E '^\s*unlock_time\s*=\s*(0|9[0-9][0-9]|[1-9][0-9][0-9][0-9]+)\b' /etc/security/faillock.conf | awk '{print $3}')
        if [ $command_output -gt 0 ] &> /dev/null
        then
                if [ "$command_output" -le 5 ] &> /dev/null
                then
                        if [ "$command_output2" -eq 0 ] || [ "$command_output2" -ge 900 ] &> /dev/null
                        then
                                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
				let PCOUNTER=PCOUNTER+1
                        else
                                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                        	let FCOUNTER=FCOUNTER+1
			fi
                else
                        output=$( echo -e "      [${lightred}FAIL${normal}]" )
                	let FCOUNTER=FCOUNTER+1
		fi
        else
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
        	let FCOUNTER=FCOUNTER+1
	fi
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
echo -e "5.3.2 Ensure lockout for failed password attempts is configured\t\t$output"
}

{
output=""
command_output=$(grep -P '^\h*password\h+(requisite|sufficient)\h+(pam_pwhistory\.so|pam_unix\.so)\h+([^#\n\r]+\h+)?remember=(5)\h*(\h+.*)?$' /etc/pam.d/common-password)
if [ ! -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.3.3 Ensure password reuse is limited\t\t\t\t\t$output"
}

{
output=""
command_output=$(grep -P -- '^\h*password\h+(requisite|required|sufficient)\h+pam_unix\.so(\h+[^#\n\r]+)?\h+sha512\b.*$' /etc/pam.d/common-password)
if $command_output | grep "password [success=1 default=ignore] pam_unix.so obscure sha512" &> /dev/null
then
	output=$( echo -e "      [${lightgreen}PASS${normal}]" )
	let PCOUNTER=PCOUNTER+1
else
	output=$( echo -e "      [${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
echo -e "5.3.4 Ensure password hashing algorithm is SHA-512\t\t\t$output"
}

{
echo "${lightpurple}${bold}5.4 User Accounts and Environment:${normal}"
}

{
echo "${orange}${bold}[+]       5.4.1 Set Shadow Password Suite Parameters:${normal}"
}

{
output=""
command_output=$(grep PASS_MAX_DAYS /etc/login.defs | awk '{print $2}')
if [ $command_output -gt 0 ] &> /dev/null
then
        if [ $command_output -le 365 ] &> /dev/null
        then
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        else
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        fi
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.4.1.1 Ensure password expiration is 365 days or less\t\t\t$output"
}

{
output=""
command_output=$(grep ^\s*PASS_MIN_DAYS /etc/login.defs | awk '{print $2}')
if [ $command_output -ge 1 ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.4.1.2 Ensure minimum days between password changes is configured\t$output"
}

{
output=""
command_output=$(grep PASS_WARN_AGE /etc/login.defs | awk '{print $2}')
if [ $command_output -ge 7 ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.4.1.3 Ensure password expiration warning days is 7 or more\t\t$output"
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
			output=$( echo -e "      [${lightgreen}PASS${normal}]" )
			let PCOUNTER=PCOUNTER+1
		else
			output=$( echo -e "      [${lightred}FAIL${normal}]" )
			let FCOUNTER=FCOUNTER+1
		fi
	else
		output=$( echo -e "      [${lightred}FAIL${normal}]" )
		let FCOUNTER=FCOUNTER+1
	fi
else
	output=$( echo -e "      [${lightred}FAIL${normal}]" )
	let FCOUNTER=FCOUNTER+1
fi
echo -e "5.4.1.4 Ensure inactive password lock is 30 days or less\t\t$output"
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
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.4.1.5 Ensure all users last password change date is in the past\t$output"
}

{
output=""
command_output=$(awk -F: '($1!~/^(root|halt|sync|shutdown|nfsnobody)$/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"' && $7!~/^(\/usr)?\/sbin\/nologin(\/)?$/ && $7!~/(\/usr)?\/bin\/false(\/)?$/) {print $1 }' /etc/passwd)
command_output2=$(awk -F: '($1!="root" && $1!~/^\+/ && $3<'"$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)"') {print $1}' /etc/passwd | xargs -I '{}' passwd -S '{}' | awk '
($2!="L" && $2!="LK") {print $1}')
if [ -z "$command_output" ]
then
        if [ -z "$command_output2" ]
        then
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        else
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        fi
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.4.2 Ensure system accounts are secured\t\t\t\t$output"
}

{
output=""
if grep "^root:" /etc/passwd | cut -f4 -d: | grep "0" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.4.3 Ensure default group for the root account is GID 0\t\t$output"
}

{
output=""
if grep "umask" /etc/bash.bashrc | grep "umask 027" &> /dev/null
then
	if grep "umask" /etc/profile /etc/profile.d/*.sh | grep "umask 027" &> /dev/null
	then
                output=$( echo -e "      [${lightgreen}PASS${normal}]" )
                let PCOUNTER=PCOUNTER+1
        else
                output=$( echo -e "      [${lightred}FAIL${normal}]" )
                let FCOUNTER=FCOUNTER+1
        fi
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.4.4 Ensure default user umask is 027 or more restrictive\t\t$output"
}

{
output=""
output1="" output2=""
[ -f /etc/bash.bashrc ] && BRC="/etc/bash.bashrc"
for f in "$BRC" /etc/profile /etc/profile.d/*.sh ; 
do
        grep -Pq '^\s*([^#]+\s+)?TMOUT=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9])\b' "$f" && grep -Pq '^\s*([^#]+;\s*)?readonly\s+TMOUT(\s+|\s*;|\s*$|=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9]))\b' "$f" && grep -Pq '^\s*([^#]+;\s*)?export\s+TMOUT(\s+|\s*;|\s*$|=(900|[1-8][0-9][0-9]|[1-9][0-9]|[1-9]))\b' "$f" && output1="$f"
done
grep -Pq '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh "$BRC" && output2=$(grep -Ps '^\s*([^#]+\s+)?TMOUT=(9[0-9][1-9]|9[1-9][0-9]|0+|[1-9]\d{3,})\b' /etc/profile /etc/profile.d/*.sh $BRC)
if [ -n "$output1" ] && [ -z "$output2" ]; 
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else 
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.4.5 Ensure default user shell timeout is 900 seconds or less\t\t$output"
}

{
printf "%-77s %s\n" "5.5 Ensure root login is restricted to system console" "$na"
let NCOUNTER=NCOUNTER+1
}

{
output=""
command_output=$( grep pam_wheel.so /etc/pam.d/su )
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "5.6 Ensure access to the su command is restricted\t\t\t$output"
}

{
echo " "
}

{
echo "${orange}${bold}6 System Maintenance:${normal}"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo -e "Title\t\t\t\t\t\t\t\t\t      Status"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo "${lightpurple}${bold}6.1 System File Permissions:${normal}${default}"
}

{
printf "%-77s %s\n" "6.1.1 Audit system file permissions" "$na"
let NCOUNTER=NCOUNTER+1
}

{
output=""
if stat /etc/passwd | grep "Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.1.2 Ensure sticky bit is set on all world-writable directories\t$output"
}

{
output=""
if stat /etc/gshadow- | grep "Access: (0640/-rw-r-----)  Uid: (    0/    root)   Gid: " &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.1.3 Ensure permissions on /etc/gshadow- are configured\t\t$output"
}

{
output=""
if stat /etc/shadow | grep "Access: (0640/-rw-r-----)  Uid: (    0/    root)   Gid: " &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.1.4 Ensure permissions on /etc/shadow are configured\t\t\t$output"
}

{
output=""
if stat /etc/group | grep "Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.1.5 Ensure permissions on /etc/group are configured\t\t\t$output"
}

{
output=""
if stat /etc/passwd- | grep "Access: (0600/-rw-------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.1.6 Ensure permissions on /etc/passwd- are configured\t\t\t$output"
}

{
output=""
if stat /etc/shadow- | grep "Access: (0600/-rw-------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.1.7 Ensure permissions on /etc/shadow- are configured\t\t\t$output"
}

{
output=""
if stat /etc/group- | grep "Access: (0600/-rw-------)  Uid: (    0/    root)   Gid: (    0/    root)" &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.1.8 Ensure permissions on /etc/group- are configured\t\t\t$output"
}

{
output=""
if stat /etc/gshadow | grep "Access: (0640/-rw-r-----)  Uid: (    0/    root)   Gid: " &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.1.9 Ensure permissions on /etc/gshadow are configured\t\t\t$output"
}

{
output=""
command_output=$(df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -type f -perm -0002)
if [ -z $command_output ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.1.10 Ensure no world writable files exist\t\t\t\t$output"
}

{
output=""
command_output=$(df --local -P | awk {'if (NR!=1) print $6'} | xargs -I '{}' find '{}' -xdev -nouser)
if [ -z $command_output ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.1.11 Ensure no unowned files or directories exist\t\t\t$output"
}

{
output=""
command_output=$(df --local -P | awk '{if (NR!=1) print $6}' | xargs -I '{}' find '{}' -xdev -nogroup)
if [ -z $command_output ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.1.12 Ensure no ungrouped files or directories exist\t\t\t$output"
}

{
printf "%-77s %s\n" "6.1.13 Audit SUID executables" "$na"
let NCOUNTER=NCOUNTER+1
}

{
printf "%-77s %s\n" "6.1.14 Audit SGID executables" "$na"
let NCOUNTER=NCOUNTER+1
}

{
echo "${lightpurple}${bold}6.2 User and Group Settings:${normal}${default}"
}

{
output=""
command_output=$(awk -F: '($2 == "" ) { print $1 " does not have a password "}' /etc/shadow)
if [ -z $command_output ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.1 Ensure password fields are not empty\t\t\t\t$output"
}

{
output=""
command_output=$(grep '^\+:' /etc/passwd)
if [ -z $command_output ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.2 Ensure no legacy "+" entries exist in /etc/passwd\t\t\t$output"
}

whileloop2()
{
grep -E -v '^(halt|sync|shutdown)' /etc/passwd | awk -F: '($7 != "'"$(which nologin)"'" && $7 != "/bin/false") { print $1 " " $6 }' | while read -r user dir; 
do
	if [ ! -d "$dir" ]; 
	then
		echo "The home directory ($dir) of user $user does not exist."
	fi
done
}

{
output=""
command_output=$(whileloop2)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.3 Ensure all users' home directories exist\t\t\t\t$output"
}


{
output=""
command_output=$(grep '^\+:' /etc/shadow)
if [ -z $command_output ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.4 Ensure no legacy "+" entries exist in /etc/shadow\t\t\t$output"
}

{
output=""
command_output=$(grep '^\+:' /etc/group)
if [ -z $command_output ] &> /dev/null
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.5 Ensure no legacy "+" entries exist in /etc/group\t\t\t$output"
}

{
output=""
if awk -F: '($3 == 0) { print $1 }' /etc/passwd | grep "root" &> /dev/null
then 
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.6 Ensure root is the only UID 0 account\t\t\t\t$output"
}

forloop()
{
if echo $PATH | grep -q "::" ; 
then
	echo "Empty Directory in PATH (::)"
fi

if echo $PATH | grep -q ":$" ; 
then
	echo "Trailing : in PATH"
fi

for x in $(echo $PATH | tr ":" " ") ; 
do
	if [ -d "$x" ] ; 
	then
		ls -ldH "$x" | awk '$9 == "." {print "PATH contains current working directory (.)"} $3 != "root" {print $9, "is not owned by root"} substr($1,6,1) != "-" {print $9, "is group writable"} substr($1,9,1) != "-" {print $9, "is world writable"}'
	else
		echo "$x is not a directory"
	fi
done
}

{
output=""
command_output=$(forloop)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.7 Ensure root PATH Integrity\t\t\t\t\t$output"
}

whileloop3()
{
grep -E -v '^(halt|sync|shutdown)' /etc/passwd | awk -F: '($7 != "'"$(which nologin)"'" && $7 != "/bin/false") { print $1 " " $6 }' | while read user dir; 
do
	if [ ! -d "$dir" ]; 
	then
		echo "The home directory ($dir) of user $user does not exist."
	else
		dirperm=$(ls -ld $dir | cut -f1 -d" ")
		if [ $(echo $dirperm | cut -c6) != "-" ]; 
		then
			echo "Group Write permission set on the home directory ($dir) of user $user"
		fi
		if [ $(echo $dirperm | cut -c8) != "-" ]; 
		then
			echo "Other Read permission set on the home directory ($dir) of user $user"
		fi
		if [ $(echo $dirperm | cut -c9) != "-" ]; 
		then
			echo "Other Write permission set on the home directory ($dir) of user $user"
		fi
		if [ $(echo $dirperm | cut -c10) != "-" ]; 
		then
			echo "Other Execute permission set on the home directory ($dir) of user $user"
		fi
	fi
done
}

{
output=""
command_output=$(whileloop3)
if [ -z "$command_output" ]
then
        output=$( echo -e "  [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "  [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.8 Ensure users' home directories permissions are 750 or more restrictive$output"
}

whileloop4()
{
grep -E -v '^(halt|sync|shutdown)' /etc/passwd | awk -F: '($7 != "'"$(which nologin)"'" && $7 != "/bin/false") { print $1 " " $6 }' | while read user dir; 
do
	if [ ! -d "$dir" ]; 
	then
		echo "The home directory ($dir) of user $user does not exist."
	else
		owner=$(stat -L -c "%U" "$dir")
		if [ "$owner" != "$user" ]; 
		then
			echo "The home directory ($dir) of user $user is owned by $owner."
		fi
	fi
done
}

{
output=""
command_output=$(whileloop4)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.9 Ensure users own their home directories\t\t\t\t$output"
}

whileloop5()
{
grep -E -v '^(halt|sync|shutdown)' /etc/passwd | awk -F: '($7 != "'"$(which nologin)"'" && $7 != "/bin/false") { print $1 " " $6 }' | while read user dir; 
do
	if [ ! -d "$dir" ]; 
	then
		echo "The home directory ($dir) of user $user does not exist."
	else
		for file in $dir/.[A-Za-z0-9]*; 
		do
			if [ ! -h "$file" -a -f "$file" ]; 
			then
				fileperm=$(ls -ld $file | cut -f1 -d" ")
				if [ $(echo $fileperm | cut -c6) != "-" ]; 
				then
					echo "Group Write permission set on file $file"
				fi
				if [ $(echo $fileperm | cut -c9) != "-" ]; 
				then
					echo "Other Write permission set on file $file"
				fi
			fi
		done
	fi
done
}

{
output=""
command_output=$(whileloop5)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.10 Ensure users' dot files are not group or world writable\t\t$output"
}

whileloop6()
{
grep -E -v '^(root|halt|sync|shutdown)' /etc/passwd | awk -F: '($7 != "'"$(which nologin)"'" && $7 != "/bin/false") { print $1 " " $6 }' | while read user dir; 
do
	if [ ! -d "$dir" ]; 
	then
		echo "The home directory ($dir) of user $user does not exist."
	else
		if [ ! -h "$dir/.forward" -a -f "$dir/.forward" ]; 
		then
			echo ".forward file $dir/.forward exists"
		fi
	fi
done
}

{
output=""
command_output=$(whileloop6)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.11 Ensure no users have .forward files\t\t\t\t$output"
}

whileloop7()
{
grep -E -v '^(root|halt|sync|shutdown)' /etc/passwd | awk -F: '($7 != "'"$(which nologin)"'" && $7 != "/bin/false") { print $1 " " $6 }' | while read user dir; 
do
	if [ ! -d "$dir" ]; 
	then
		echo "The home directory ($dir) of user $user does not exist."
	else
		if [ ! -h "$dir/.netrc" -a -f "$dir/.netrc" ]; 
		then
			echo ".netrc file $dir/.netrc exists"
		fi
	fi
done
}

{
output=""
command_output=$(whileloop7)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.12 Ensure no users have .netrc files\t\t\t\t$output"
}

whileloop8()
{
grep -E -v '^(root|halt|sync|shutdown)' /etc/passwd | awk -F: '($7 != "'"$(which nologin)"'" && $7 != "/bin/false") { print $1 " " $6 }' | while read user dir; 
do
	if [ ! -d "$dir" ]; 
	then
		echo "The home directory ($dir) of user $user does not exist."
	else
		for file in $dir/.netrc; 
		do
			if [ ! -h "$file" -a -f "$file" ]; 
			then
				fileperm=$(ls -ld $file | cut -f1 -d" ")
				if [ $(echo $fileperm | cut -c5) != "-" ]; 
				then
					echo "Group Read set on $file"
				fi
				if [ $(echo $fileperm | cut -c6) != "-" ]; 
				then
					echo "Group Write set on $file"
				fi
				if [ $(echo $fileperm | cut -c7) != "-" ]; 
				then
					echo "Group Execute set on $file"
				fi
				if [ $(echo $fileperm | cut -c8) != "-" ]; 
				then
					echo "Other Read set on $file"
				fi
				if [ $(echo $fileperm | cut -c9) != "-" ]; 
				then
					echo "Other Write set on $file"
				fi
				if [ $(echo $fileperm | cut -c10) != "-" ]; 
				then
					echo "Other Execute set on $file"
				fi
			fi
		done
	fi
done
}

{
output=""
command_output=$(whileloop8)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.13 Ensure users' .netrc Files are not group or world accessible\t$output"
}

whileloop9()
{
grep -E -v '^(root|halt|sync|shutdown)' /etc/passwd | awk -F: '($7 != "'"$(which nologin)"'" && $7 != "/bin/false") { print $1 " " $6 }' | while read user dir; 
do
	if [ ! -d "$dir" ]; 
	then
		echo "The home directory ($dir) of user $user does not exist."
	else
		for file in $dir/.rhosts; 
		do
			if [ ! -h "$file" -a -f "$file" ]; 
			then
				echo ".rhosts file in $dir"
			fi
		done
	fi
done
}

{
output=""
command_output=$(whileloop9)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.14 Ensure no users have .rhosts files\t\t\t\t$output"
}

forloop2()
{
for i in $(cut -s -d: -f4 /etc/passwd | sort -u ); 
do
	grep -q -P "^.*?:[^:]*:$i:" /etc/group
	if [ $? -ne 0 ]; 
	then
		echo "Group $i is referenced by /etc/passwd but does not exist in /etc/group"
	fi
done
}

{
output=""
command_output=$(forloop2)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.15 Ensure all groups in /etc/passwd exist in /etc/group\t\t$output"
}

whileloop10()
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
command_output=$(whileloop10)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.16 Ensure no duplicate UIDs exist\t\t\t\t\t$output"
}

whileloop11()
{
cut -d: -f3 /etc/group | sort | uniq -d | while read x ; 
do
	echo "Duplicate GID ($x) in /etc/group"
done
}

{
output=""
command_output=$(whileloop11)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.17 Ensure no duplicate GIDs exist\t\t\t\t\t$output"
}

whileloop12()
{
cut -d: -f1 /etc/passwd | sort | uniq -d | while read x ;
do 
	echo "Duplicate login name ${x} in /etc/passwd"
done
}

{
output=""
command_output=$(whileloop12)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.18 Ensure no duplicate user names exist\t\t\t\t$output"
}

whileloop13()
{
cut -d: -f1 /etc/group | sort | uniq -d | while read x ;
do 
	echo "Duplicate group name ${x} in /etc/group"
done
}

{
output=""
command_output=$(whileloop13)
if [ -z "$command_output" ]
then
        output=$( echo -e "      [${lightgreen}PASS${normal}]" )
        let PCOUNTER=PCOUNTER+1
else
        output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.19 Ensure no duplicate group names exist\t\t\t\t$output"
}

{
output=""
command_output=$(grep ^shadow:[^:]*:[^:]*:[^:]+ /etc/group)
command_output2=$(awk -F: '($4 == "<shadow-gid>") { print }' /etc/passwd)
if [ -z $command_output ]
then
	if [ -z $command_output2 ]
	then
		output=$( echo -e "      [${lightgreen}PASS${normal}]" )
	        let PCOUNTER=PCOUNTER+1
	else
		output=$( echo -e "      [${lightred}FAIL${normal}]" )
	        let FCOUNTER=FCOUNTER+1
	fi
else
	output=$( echo -e "      [${lightred}FAIL${normal}]" )
        let FCOUNTER=FCOUNTER+1
fi
echo -e "6.2.20 Ensure shadow group is empty\t\t\t\t\t$output"
}

#Summary
#echo
#echo --------------------------------------------------------------------------------------
#echo SUMMARY
#echo --------------------------------------------------------------------------------------
#time_date=$(date +"%T")
#echo Hello, who am I talking to?
#read dbname
#tabname=$dbname"1"
#mysql -e"
#CREATE DATABASE tab;
#USE tab;
#CREATE TABLE tab1( STATUS VARCHAR(50) NOT NULL, PASS VARCHAR(50) NOT NULL, FAIL VARCHAR(50) NOT NULL, 
#WARNING VARCHAR(50) NOT NULL, NOT_TESTED VARCHAR(50) NOT NULL);
#INSERT INTO tab1 (STATUS, PASS, FAIL, WARNING, NOT_TESTED) VALUES ( 'NUMBER','$PCOUNTER','$FCOUNTER',
#'$WCOUNTER', '$NCOUNTER');
#SELECT * FROM tab1;
#DROP DATABASE tab;
#"
#echo

#Conclusion
echo ---------------------------------------------------------------------------------------
printf "%-77s %s\n" CONCLUSION "Status"
echo ---------------------------------------------------------------------------------------
if [ "$PCOUNTER" -lt "$FCOUNTER" ]
then
        printf "%-76s %s\n" "There are $PCOUNTER pass(es), $FCOUNTER fail(s) and $WCOUNTER warning(s)" "$critical"
else
        printf "%-77s %s\n" "There are $PCOUNTER pass(es), $FCOUNTER fail(s) and $WCOUNTER warning(s)" "$safe"
fi
echo
echo

