#!/usr/bin/bash


ipv6_chk() { passing="" grubfile="$(find /boot -type f \( -name 'grubenv' -o -name 'grub.conf' -o -name 'grub.cfg' \) \ -exec grep -Pl -- '^\h*(kernelopts=|linux|kernel)' {} \;)" ! grep -P -- "^\h*(kernelopts=|linux|kernel)" "$grubfile" | grep -vq -- ipv6.disable=1 && passing="true" grep -Pq -- "^\s*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\h*(#.*)?$" \ /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf && \ grep -Pq -- "^\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\h*(#.*)?$" \ /etc/sysctl.conf /etc/sysctl.d/*.conf /usr/lib/sysctl.d/*.conf /run/sysctl.d/*.conf && \ sysctl net.ipv6.conf.all.disable_ipv6 | \ grep -Pq -- "^\h*net\.ipv6\.conf\.all\.disable_ipv6\h*=\h*1\h*(#.*)?$" && \ sysctl net.ipv6.conf.default.disable_ipv6 | \ grep -Pq -- "^\h*net\.ipv6\.conf\.default\.disable_ipv6\h*=\h*1\h*(#.*)?$" && passing="true" 
if [ "$passing" = true ] ; 
then 
    echo -e "\nIPv6 is disabled on the system\n" 
else 
    echo -e "\nIPv6 is enabled on the system\n" 
fi 
}

ipv6_chk 2> /dev/null
