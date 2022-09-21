#!/usr/bin/env bash

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

{
echo " "
}

{
echo "${lightyellow}${bold}3 Network Configurations Remediation:${normal}${default}"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo "Title"
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo "${purple}${bold}3.1 Disable unused network protocols and devices:${normal}${default}"
}

{
echo " "
}

{
echo "3.1.1 Verify if IPv6 is enabled on the system (Manual)"
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
echo "3.1.2 Ensure SCTP is disabled (Automated)"
echo "Edit or create a file in the /etc/modprobe.d/ directory ending in .conf:"
echo "${lightblue}${bold}printf 'install sctp /bin/true' >> /etc/modprobe.d/sctp.conf${default}${normal}"
}

{
echo " "
}

{
echo "3.1.3 Ensure DCCP is disabled (Automated)"
echo "Edit or create a file in the /etc/modprobe.d/ directory ending in .conf:"
echo "${lightblue}${bold}printf 'install dccp /bin/true' >> /etc/modprobe.d/dccp.conf${default}${normal}"
}

{
echo " "
}

{
echo "3.1.4 Ensure wireless interfaces are disabled (Automated)"
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
echo "---------------------------------------------------------------------------------------"
}

{
echo " "
}

{
echo "${purple}${bold}3.2 Network Parameters (Host Only):${normal}${default}"
}

{
echo " "
}

{
echo "3.2.1 Ensure IP forwarding is disabled (Automated)"
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
echo " sysctl -w net.ipv6.route.flush=1}${default}"
}

{
echo " "
}

{
echo "3.2.2 Ensure packet redirect sending is disabled (Automated)"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightgreen}printf '"
echo "net.ipv4.conf.all.send_redirects = 0"
echo "net.ipv4.conf.default.send_redirects = 0"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightgreen}{sysctl -w net.ipv4.conf.all.send_redirects=0"
echo "sysctl -w net.ipv4.conf.default.send_redirects=0"
echo "sysctl -w net.ipv4.route.flush=1}${default}"
}

{
echo " "
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo " "
}

{
echo "${lightaqua}${bold}3.3 Network Parameters (Host and Router):${normal}${default}"
}

{
echo " "
}

{
echo "3.3.1 Ensure source routed packets are not accepted (Automated)"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightgreen}printf '"
echo "net.ipv4.conf.all.accept_source_route = 0"
echo "net.ipv4.conf.default.accept_source_route = 0"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf"
echo "printf '"
echo "net.ipv6.conf.all.accept_source_route = 0"
echo "net.ipv6.conf.default.accept_source_route = 0"
echo "' >> /etc/sysctl.d/60-netipv6_sysctl.conf${default}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightgreen}{sysctl -w net.ipv4.conf.all.accept_source_route=0"
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
echo "3.3.2 Ensure ICMP redirects are not accepted (Automated)"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightgreen}printf '"
echo "net.ipv4.conf.all.accept_redirects = 0"
echo "net.ipv4.conf.default.accept_redirects = 0"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf"
echo "printf '"
echo "net.ipv6.conf.all.accept_redirects = 0"
echo "net.ipv6.conf.default.accept_redirects = 0"
echo "' >> /etc/sysctl.d/60-netipv6_sysctl.conf${default}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightgreen}{sysctl -w net.ipv4.conf.all.accept_redirects=0"
echo "sysctl -w net.ipv4.conf.default.accept_redirects=0"
echo "sysctl -w net.ipv4.route.flush=1"
echo "sysctl -w net.ipv6.conf.all.accept_redirects=0"
echo "sysctl -w net.ipv6.conf.default.accept_redirects=0"
echo "sysctl -w net.ipv6.route.flush=1}${default}"
}

{
echo " "
}

{
echo "3.3.3 Ensure secure ICMP redirects are not accepted (Automated)"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightgreen}printf '"
echo "net.ipv4.conf.all.secure_redirects = 0"
echo "net.ipv4.conf.default.secure_redirects = 0"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}"
echo "Run the following commands to set the active kernel parameters:"
echo "${lightgreen}{sysctl -w net.ipv4.conf.all.secure_redirects=0"
echo "sysctl -w net.ipv4.conf.default.secure_redirects=0"
echo "sysctl -w net.ipv4.route.flush=1}${default}"
}

{
echo " "
}

{
echo "3.3.4 Ensure suspicious packets are logged (Automated)"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightgreen}printf '"
echo "net.ipv4.conf.all.log_martians = 1"
echo "net.ipv4.conf.default.log_martians = 1"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightgreen}{sysctl -w net.ipv4.conf.all.log_martians=1"
echo "sysctl -w net.ipv4.conf.default.log_martians=1"
echo "sysctl -w net.ipv4.route.flush=1}${default}"
}

{
echo " "
}

{
echo "3.3.5 Ensure broadcast ICMP requests are ignored (Automated)"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightgreen}printf '"
echo "net.ipv4.icmp_echo_ignore_broadcasts = 1"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightgreen}{sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1"
echo "sysctl -w net.ipv4.route.flush=1}${default}"
}

{
echo " "
}

{
echo "3.3.6 Ensure bogus ICMP responses are ignored (Automated)"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightgreen}printf '"
echo "net.ipv4.icmp_ignore_bogus_error_responses = 1"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightgreen}{sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1"
echo "sysctl -w net.ipv4.route.flush=1}${default}"
}

{
echo " "
}

{
echo "3.3.7 Ensure Reverse Path Filtering is enabled (Automated)"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightgreen}printf '"
echo "net.ipv4.conf.all.rp_filter = 1"
echo "net.ipv4.conf.default.rp_filter = 1"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightgreen}{sysctl -w net.ipv4.conf.all.rp_filter=1"
echo "sysctl -w net.ipv4.conf.default.rp_filter=1"
echo "sysctl -w net.ipv4.route.flush=1}${default}"
}

{
echo " "
}

{
echo "3.3.8 Ensure TCP SYN Cookies is enabled (Automated)"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightgreen}printf '"
echo "net.ipv4.tcp_syncookies = 1"
echo "' >> /etc/sysctl.d/60-netipv4_sysctl.conf${default}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightgreen}{sysctl -w net.ipv4.tcp_syncookies=1"
echo "sysctl -w net.ipv4.route.flush=1}${default}"
}

{
echo " "
}

{
echo "3.3.9 Ensure IPv6 router advertisements are not accepted (Automated)"
echo "Set the following parameters in /etc/sysctl.conf or a /etc/sysctl.d/* file:"
echo "${lightgreen}printf '"
echo "net.ipv6.conf.all.accept_ra = 1"
echo "net.ipv6.conf.default.accept_ra = 1"
echo "' >> /etc/sysctl.d/60-netipv6_sysctl.conf${default}"
echo "Run the following command to set the active kernel parameters:"
echo "${lightgreen}{sysctl -w net.ipv6.conf.all.accept_ra=1"
echo "sysctl -w net.ipv6.conf.default.accept_ra=1"
echo "sysctl -w net.ipv6.route.flush=1}${default}"
}

{
echo " "
}

{
echo "---------------------------------------------------------------------------------------"
}

{
echo " "
}

{
echo "${lightaqua}${bold}3.4 Firewall Configuration:${normal}${default}"
}

{
echo " "
}

{
echo "${lightyellow}3.4.1 Configure firewalld${default}"
}

{
echo " "
}

{
echo "3.4.1.1 Ensure firewalld is installed (Automated)"
echo "Run the following command to install FirewallD and iptables :"
echo "${lightgreen}dnf install firewalld iptables${default}"
}

{
echo " "
}

{
echo "3.4.1.2 Ensure iptables-services not installed with firewalld (Automated)"
echo "Run the following commands to stop the services included in the iptables-services package and remove the iptables-services package"
echo "${lightgreen}systemctl stop iptables"
echo "systemctl stop ip6tables"
echo "dnf remove iptables-services${default}"
}

{
echo " "
}

{
echo "3.4.1.3 Ensure nftables either not installed or masked with firewalld (Automated)"
echo "Run the following command to remove nftables :"
echo "${lightgreen}dnf remove nftables${default}"
echo "OR"
echo "Run the following command to stop and mask nftables "
echo "${lightgreen}systemctl --now mask nftables${default}"
}

{
echo " "
}

{
echo "3.4.1.4 Ensure firewalld service enabled and running (Automated)"
echo "Run the following command to unmask firewalld"
echo "${lightgreen}systemctl unmask firewalld${default}"
echo "Run the following command to enable and start firewalld"
echo "${lightgreen}systemctl --now enable firewalld${default}"
}

{
echo " "
}

{
echo "3.4.1.5 Ensure firewalld default zone is set (Automated)"
echo "Run the following command to set the default zone:"
echo "${lightgreen}firewall-cmd --set-default-zone=<NAME_OF_ZONE>${default}"
echo "Example:"
echo "${lightgreen}firewall-cmd --set-default-zone=public${default}"
}

{
echo " "
}

{
echo "3.4.1.6 Ensure network interfaces are assigned to appropriate zone (Manual)"
echo "Run the following command to assign an interface to the approprate zone."
echo "${lightgreen}firewall-cmd --zone=<Zone NAME> --change-interface=<INTERFACE NAME>${default}"
echo "Example:"
echo "${lightgreen}firewall-cmd --zone=customezone --change-interface=eth0${default}"
}

{
echo " "
}

{
echo "3.4.1.7 Ensure firewalld drops unnecessary services and ports (Manual)"
echo "Run the following command to remove an unnecessary service:"
echo "${lightgreen}firewall-cmd --remove-service=<service>${default}"
echo "Example:"
echo "${lightgreen}firewall-cmd --remove-service=cockpit${default}"
echo "Run the following command to remove an unnecessary port:"
echo "${lightgreen}firewall-cmd --remove-port=<port-number>/<port-type>${default}"
echo "Example:"
echo "${lightgreen}firewall-cmd --remove-port=25/tcp${default}"
echo "Run the following command to make new settings persistent:"
echo "${lightgreen}firewall-cmd --runtime-to-permanent${default}"
}

{
echo " "
}

{
echo "${lightyellow}3.4.2 Configure nftables${default}"
}

{
echo " "
}

{
echo "3.4.2.1 Ensure nftables is installed (Automated)"
echo "Run the following command to install nftables"
echo "${lightgreen}dnf install nftables${default}"
}

{
echo " "
}

{
echo "3.4.2.2 Ensure firewalld is either not installed or masked with nftables (Automated)"
echo "Run the following command to remove firewalld"
echo "${lightgreen}dnf remove firewalld${default}"
echo "OR"
echo "Run the following command to stop and mask firewalld"
echo "${lightgreen}systemctl --now mask firewalld${default}"
}

{
echo " "
}

{
echo "3.4.2.3 Ensure iptables-services not installed with nftables (Automated)"
echo "Run the following commands to stop the services included in the iptables-services package and remove the iptables-services package"
echo "${lightgreen}systemctl stop iptables"
echo "systemctl stop ip6tables"
echo "dnf remove iptables-services${default}"
}

{
echo " "
}

{
echo "3.4.2.4 Ensure iptables are flushed with nftables (Manual)"
echo "Run the following commands to flush iptables:"
echo "For iptables:"
echo "${lightgreen}iptables -F${default}"
echo "For ip6tables:"
echo "${lightgreen}ip6tables -F${default}"
}

{
echo " "
}

{
echo "3.4.2.5 Ensure an nftables table exists (Automated)"
echo "Run the following command to create a table in nftables"
echo "${lightgreen}nft create table inet <table name>${default}"
echo "Example:"
echo "${lightgreen}nft create table inet filter${default}"
}

{
echo " "
}

{
echo "3.4.2.6 Ensure nftables base chains exist (Automated)"
echo "Run the following command to create the base chains:"
echo "${lightgreen}nft create chain inet <table name> <base chain name> { type filter hook <(input|forward|output)> priority 0 \; }${default}"
echo "Example:"
echo "${lightgreen}nft create chain inet filter input { type filter hook input priority 0 \; }"
echo "nft create chain inet filter forward { type filter hook forward priority 0 \; }"
echo "nft create chain inet filter output { type filter hook output priority 0 \; }${default}"
}

{
echo " "
}

{
echo "3.4.2.7 Ensure nftables loopback traffic is configured (Automated)"
echo "Run the following commands to implement the loopback rules:"
echo "${lightgreen}nft add rule inet filter input iif lo accept"
echo "nft create rule inet filter input ip saddr 127.0.0.0/8 counter drop${default}"
echo "IF IPv6 is enabled:"
echo "Run the following command to implement the IPv6 loopback rules:"
echo "${lightgreen}nft add rule inet filter input ip6 saddr ::1 counter drop${default}"
}

{
echo " "
}

{
echo "3.4.2.8 Ensure nftables outbound and established connections are configured (Manual)"
echo "Configure nftables in accordance with site policy. The following commands will implement a policy to allow all outbound connections and all established connections:"
echo "${lightgreen}nft add rule inet filter input ip protocol tcp ct state established accept"
echo "nft add rule inet filter input ip protocol udp ct state established accept"
echo "nft add rule inet filter input ip protocol icmp ct state established accept"
echo "nft add rule inet filter output ip protocol tcp ct state new,related,established accept"
echo "nft add rule inet filter output ip protocol udp ct state new,related,established accept"
echo "nft add rule inet filter output ip protocol icmp ct state new,related,established accept${default}"
}

{
echo " "
}

{
echo "3.4.2.9 Ensure nftables default deny firewall policy (Automated)"
echo "Run the following command for the base chains with the input, forward, and output hooks to implement a default DROP policy:"
echo "${lightgreen}nft chain <table family> <table name> <chain name> { policy drop \; }${default}"
echo "Example:"
echo "${lightgreen}nft chain inet filter input { policy drop \; }"
echo "nft chain inet filter forward { policy drop \; }"
echo "nft chain inet filter output { policy drop \; }${default}"
}

{
echo " "
}

{
echo "3.4.2.10 Ensure nftables service is enabled (Automated)"
echo "Run the following command to enable the nftables service:"
echo "${lightgreen}systemctl enable nftables${default}"
}

{
echo " "
}

{
echo "3.4.2.11 Ensure nftables rules are permanent (Automated)"
echo "Edit the /etc/sysconfig/nftables.conf file and un-comment or add a line with include <Absolute path to nftables rules file> for each nftables file you want included in the nftables ruleset on boot:"
echo "${lightgreen}include '/etc/nftables/nftables.rules'${default}"
}

{
echo " "
}

{
echo "${lightyellow}3.4.3 Configure iptables${default}"
}

{
echo " "
}

{
echo "${lightpurple}3.4.3.1 Configure iptables software${default}"
}

{
echo " "
}

{
echo "3.4.3.1.1 Ensure iptables packages are installed (Automated)"
echo "Run the following command to install iptables and iptables-services"
echo "${lightgreen}dnf install iptables iptables-services${default}"
}

{
echo " "
}

{
echo "3.4.3.1.2 Ensure nftables is not installed with iptables (Automated)"
echo "Run the following command to remove nftables :"
echo "${lightgreen}dnf remove nftables${default}"
}

{
echo " "
}

{
echo "3.4.3.1.3 Ensure firewalld is either not installed or masked with iptables (Automated)"
echo "Run the following command to remove firewalld"
echo "${lightgreen}yum remove firewalld${default}"
echo "OR"
echo "Run the following command to stop and mask firewalld"
echo "${lightgreen}systemctl --now mask firewalld${default}"
}

{
echo " "
}

{
echo "${lightpurple}3.4.3.2 Configure IPv4 iptables${default}"
}

{
echo " "
}

{
echo "3.4.3.2.1 Ensure iptables loopback traffic is configured (Automated)"
echo "Run the following commands to implement the loopback rules:"
echo "${lightgreen}iptables -A INPUT -i lo -j ACCEPT"
echo "iptables -A OUTPUT -o lo -j ACCEPT"
echo "iptables -A INPUT -s 127.0.0.0/8 -j DROP${default}"
}

{
echo " "
}

{
echo "3.4.3.2.2 Ensure iptables outbound and established connections are configured (Manual)"
echo "Configure iptables in accordance with site policy. The following commands will implement a policy to allow all outbound connections and all established connections:"
echo "${lightgreen}iptables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "iptables -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "iptables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "iptables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT"
echo "iptables -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT"
echo "iptables -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT${default}"
}

{
echo " "
}

{
echo "3.4.3.2.3 Ensure iptables rules exist for all open ports (Automated)"
echo "For each port identified in the audit which does not have a firewall rule establish a proper rule for accepting inbound connections:"
echo "${lightgreen}iptables -A INPUT -p <protocol> --dport <port> -m state --state NEW -j ACCEPT${default}"
}

{
echo " "
}

{
echo "3.4.3.2.4 Ensure iptables default deny firewall policy (Automated)"
echo "Run the following commands to implement a default DROP policy:"
echo "${lightgreen}iptables -P INPUT DROP"
echo "iptables -P OUTPUT DROP"
echo "iptables -P FORWARD DROP${default}"
}

{
echo " "
}

{
echo "3.4.3.2.5 Ensure iptables rules are saved (Automated)"
echo "Run the following commands to create or update the /etc/sysconfig/iptables file:"
echo "Run the following command to review the current running iptables configuration:"
echo "${lightgreen}iptables -L${default}"
echo "Run the following command to save the verified running configuration to the file /etc/sysconfig/iptables :"
echo "${lightgreen}service iptables save"
echo "iptables: Saving firewall rules to /etc/sysconfig/iptables:[OK]${default}"
}

{
echo " "
}

{
echo "3.4.3.2.6 Ensure iptables is enabled and active (Automated)"
echo "Run the following command to enable and start iptables:"
echo "${lightgreen}systemctl --now enable iptables${default}"
}

{
echo " "
}

{
echo "${lightpurple}3.4.3.3 Configure IPv6 ip6tables${default}"
}

{
echo " "
}

{
echo "3.4.3.3.1 Ensure ip6tables loopback traffic is configured (Automated)"
echo "Run the following commands to implement the loopback rules:"
echo "${lightgreen}ip6tables -A INPUT -i lo -j ACCEPT"
echo "ip6tables -A OUTPUT -o lo -j ACCEPT"
echo "ip6tables -A INPUT -s ::1 -j DROP${default}"
}

{
echo " "
}

{
echo "3.4.3.3.2 Ensure ip6tables outbound and established connections are configured (Manual)"
echo "Configure iptables in accordance with site policy. The following commands will implement a policy to allow all  outbound connections and all established connections:"
echo "${lightgreen}ip6tables -A OUTPUT -p tcp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "ip6tables -A OUTPUT -p udp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "ip6tables -A OUTPUT -p icmp -m state --state NEW,ESTABLISHED -j ACCEPT"
echo "ip6tables -A INPUT -p tcp -m state --state ESTABLISHED -j ACCEPT"
echo "ip6tables -A INPUT -p udp -m state --state ESTABLISHED -j ACCEPT"
echo "ip6tables -A INPUT -p icmp -m state --state ESTABLISHED -j ACCEPT${default}"
}

{
echo " "
}

{
echo "3.4.3.3.3 Ensure ip6tables rules exist for all open ports (Automated)"
echo "For each port identified in the audit which does not have a firewall rule establish a proper rule for accepting inbound connections:"
echo "${lightgreen}ip6tables -A INPUT -p <protocol> --dport <port> -m state --state NEW -j ACCEPT${default}"
}

{
echo " "
}

{
echo "3.4.3.3.4 Ensure ip6tables default deny firewall policy (Automated)"
echo "Run the following commands to implement a default DROP policy:"
echo "${lightgreen}ip6tables -P INPUT DROP"
echo "ip6tables -P OUTPUT DROP"
echo "ip6tables -P FORWARD DROP${default}"
}

{
echo " "
}

{
echo "3.4.3.3.5 Ensure ip6tables rules are saved (Automated)"
echo "Run the following commands to create or update the /etc/sysconfig/iptables file:"
echo "Run the following command to review the current running iptables configuration:"
echo "${lightgreen}iptables -L${default}"
echo "Run the following command to save the verified running configuration to the file /etc/sysconfig/ip6tables :"
echo "${lightgreen}service ip6tables save"
echo "iptables: Saving firewall rules to /etc/sysconfig/ip6tables:[OK]${default}"
}

{
echo " "
}

{
echo "3.4.3.3.6 Ensure ip6tables is enabled and active (Automated)"
echo "Run the following command to enable and start ip6tables:"
echo "${lightgreen}systemctl --now enable ip6tables${default}"
}
