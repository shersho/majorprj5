#!/bin/bash

function pass() {
#PassCounter=$(./script1.sh | grep -o 'PASS' | wc -l);

#PassCounter=$(./cis-1.sh | grep -o 'PASS' | wc -l);
PassCounter=$(cat pie.txt | grep -o 'PASS' | wc -l);


echo $PassCounter

}

function fail() {
#failCounter=$(./script1.sh | grep -o 'FAIL' | wc -l);
#failCounter=$(./cis-1.sh | grep -o 'FAIL' | wc -l);
failCounter=$(cat pie.txt | grep -o 'FAIL' | wc -l);


echo $failCounter

}

function ineli() {
#ineliCounter=$(./script1.sh | grep -o 'N/A' | wc -l);

#ineliCounter=$(./cis-1.sh | grep -o 'N/A' | wc -l);
ineliCounter=$(cat pie.txt | grep -o 'N/A' | wc -l);

echo $ineliCounter

}

function filterP() {
#./cis-1S.sh | grep -e 'PASS'
cat report.txt | grep -e 'PASS'
}

function filterF() {
#./cis-1S.sh | grep -e 'FAIL'
cat report.txt | grep -e 'FAIL'
}

function filterN() {
#./cis-1S.sh | grep -e 'N/A'
cat report.txt | grep -e 'N/A'
}
function filterA() {
#./cis-1S.sh 
cat report.txt
}


function logfile() {
cat report.txt > /var/log/auditResults.log
}


function clears() {
clear
}
#fail

#!/bin/bash

#global variables

function searchScript() {
UID_MIN=$(awk '/^\s*UID_MIN/{print $2}' /etc/login.defs)


#4.1.1.1

echo "4.1 Configure System Accounting (auditd)"

check=$(rpm -q audit)

if [[ $check == *"not installed"* ]]; 
then
echo -e "Audit Title: 4.1.1.1 Ensure auditd is installed    [FAIL]"
echo ""
else
echo -e "Audit Title: 4.1.1.1 Ensure auditd is installed    [PASS]"
echo "" 
fi

#4.1.1.2


if [[ $(systemctl is-enabled auditd | grep enabled | wc -l) -ne 1 ]]; 
then
echo -e "Audit Title: 4.1.1.2 Ensure auditd is enabled    [FAIL]"
echo ""

else
echo -e "Audit Title: 4.1.1.2 Ensure auditd is enabled    [PASS]"
echo ""

fi

#4.1.1.3


if [ $(find /boot -type f -name 'grubenv' -exec grep -P 'kernelopts=([^#\n\r]+\h+)?(audit=1)' {} \; | wc -l ) -ne 1 ]; 
then
echo -e "Audit Title: 4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled    [FAIL]"
echo ""

else
echo -e "Audit Title: 4.1.1.3 Ensure auditing for processes that start prior to auditd is enabled    [PASS]"
echo ""

fi

#4.1.1.4


if [ $(find /boot -type f -name 'grubenv' -exec grep -P 'kernelopts=([^#\n\r]+\h+)?(audit_backlog_limit=\S+\b)' {} \; | wc -l ) -ne 1 ];
then
echo -e "Audit Title: 4.1.1.4 Ensure audit_backlog_limit is sufficient    [FAIL]"
echo ""

else
echo -e "Audit Title: 4.1.1.4 Ensure audit_backlog_limit is sufficient    [PASS]"
echo ""

fi

echo "4.1.2 Configure Data Retention"

#4.1.2.1


if [ $(grep -w "^\s*max_log_file\s*=" /etc/audit/auditd.conf | wc -l) -eq 0 ]; 
then
echo -e "Audit Title: 4.1.2.1 Ensure audit log storage size is configured    [FAIL]"
echo ""

else
echo -e "Audit Title: 4.1.2.1 Ensure audit log storage size is configured    [PASS]"
echo ""

fi

#4.1.2.2


if [ $(grep max_log_file_action /etc/audit/auditd.conf | grep keep_logs | wc -l) -eq 0 ]; 
then
echo -e "Audit Title: 4.1.2.2 Ensure audit logs are not automatically deleted    [FAIL] "
echo ""

else
echo -e "Audit Title: 4.1.2.2 Ensure audit logs are not automatically deleted    [PASS] "
echo ""

fi

#4.1.2.3


if [ $(grep -E 'space_left_action|action_mail_acct =' /etc/audit/auditd.conf | wc -l) -eq 3 ] &&
[ $(grep -E 'admin_space_left_action\s*=\s*(halt|single)' /etc/audit/auditd.conf | grep -E 'halt|single' | wc -l) -ne 0 ]; 
then
echo -e "Audit Title: 4.1.2.3 Ensure system is disabled when audit logs are full    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.2.3 Ensure system is disabled when audit logs are full    [FAIL] "
echo ""

fi

#4.1.3
echo "4.1.3 Configure auditd rules";
echo""

#4.1.3.1

if [ $(awk '/^ *-w/ \
&&/\/etc\/sudoers/ \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -eq 2 ];
  
then
echo -e "Audit Title: 4.1.3.1 Ensure changes to system administration scope (sudoers) is collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.1 Ensure changes to system administration scope (sudoers) is collected    [FAIL] "
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
echo -e "Audit Title: 4.1.3.2 Ensure actions as another user are always logged    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.2 Ensure actions as another user are always logged    [FAIL] "
echo ""

fi

#4.1.3.3


if [ $([ -n "${SUDO_LOG_FILE_ESCAPED}" ] && awk "/^ *-w/ \
&&/"${SUDO_LOG_FILE_ESCAPED}"/ \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules || printf "ERROR: Variable 'SUDO_LOG_FILE_ESCAPED' is unset.\n" > /dev/null | grep 'sudo_log_file' | wc -l) -eq 1 ];
then
echo -e "Audit Title: 4.1.3.3 Ensure events that modify the sudo log file are collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.3 Ensure events that modify the sudo log file are collected    [FAIL] "
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
echo -e "Audit Title: 4.1.3.4 Ensure events that modify date and time information are collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.4 Ensure events that modify date and time information are collected    [FAIL] "
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
echo -e "Audit Title: 4.1.3.5 Ensure events that modify the system's network environment are collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.5 Ensure events that modify the system's network environment are collected    [FAIL] "
echo ""

fi

#4.1.3.6


echo -e "Audit Title: 4.1.3.6 Ensure use of privileged commands are collected    [INELIGIBLE] "
echo ""


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
echo -e "Audit Title: 4.1.3.7 Ensure unsuccessful file access attempts are collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.7 Ensure unsuccessful file access attempts are collected    [FAIL] "
echo ""

fi

#4.1.3.8


if [ $(awk '/^ *-w/ \
&&(/\/etc\/group/ \
||/\/etc\/[PASS]wd/ \
||/\/etc\/gshadow/ \
||/\/etc\/shadow/ \
||/\/etc\/security\/o[PASS]wd/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -eq 5 ] &&

[ $(auditctl -l | awk '/^ *-w/ \
&&(/\/etc\/group/ \
||/\/etc\/[PASS]wd/ \
||/\/etc\/gshadow/ \
||/\/etc\/shadow/ \
||/\/etc\/security\/o[PASS]wd/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l) -eq 5 ];

then
echo -e "Audit Title: 4.1.3.8 Ensure events that modify user/group information are collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.8 Ensure events that modify user/group information are collected    [FAIL] "
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
echo -e "Audit Title: 4.1.3.9 Ensure discretionary access control permission modification events are collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.9 Ensure discretionary access control permission modification events are collected    [FAIL] "
echo ""

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
echo -e "Audit Title: 4.1.3.10 Ensure successful file system mounts are collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.10 Ensure successful file system mounts are collected    [FAIL] "
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
echo -e "Audit Title: 4.1.3.11 Ensure session initiation information is collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.11 Ensure session initiation information is collected    [FAIL] "
echo ""

fi
  
#4.1.3.12


if [ $(awk '/^ *-w/ \
&&(/\/var\/log\/lastlog/ \
||/\/var\/run\/[FAIL]lock/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l) -eq 2 ] &&

[ $(auditctl -l | awk '/^ *-w/ \
&&(/\/var\/log\/lastlog/ \
||/\/var\/run\/[FAIL]lock/) \
&&/ +-p *wa/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l) -eq 2 ];

then
echo -e "Audit Title: 4.1.3.12 Ensure login and logout events are collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.12 Ensure login and logout events are collected    [FAIL] "
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
echo -e "Audit Title: 4.1.3.13 Ensure file deletion events by users are collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.13 Ensure file deletion events by users are collected    [FAIL] "
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
echo -e "Audit Title: 4.1.3.14 Ensure events that modify the system's Mandatory Access Controls are collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.14 Ensure events that modify the system's Mandatory Access Controls are collected    [FAIL] "
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
echo -e "Audit Title: 4.1.3.15 Ensure successful and unsuccessful attempts to use the chcon command are recorded    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.15 Ensure successful and unsuccessful attempts to use the chcon command are recorded    [FAIL] "
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
echo -e "Audit Title: 4.1.3.16 Ensure successful and unsuccessful attempts to use the setfacl command are recorded    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.16 Ensure successful and unsuccessful attempts to use the setfacl command are recorded    [FAIL] "
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
echo -e "Audit Title: 4.1.3.17 Ensure successful and unsuccessful attempts to use the chacl command are recorded    [PASS]"
echo ""

else
echo -e "Audit Title: 4.1.3.17 Ensure successful and unsuccessful attempts to use the chacl command are recorded    [FAIL] "
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
echo -e "Audit Title: 4.1.3.18 Ensure successful and unsuccessful attempts to use the usermod command are recorded    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.18 Ensure successful and unsuccessful attempts to use the usermod command are recorded    [FAIL] "
echo ""

fi

#4.1.3.19


if [ $(awk '/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F auid!=unset/||/ -F auid!=-1/||/ -F auid!=4294967295/) \
&&/ -S/ \
&&(/init_module/ \
||/finit_module/ \
||/delete_module/ \
||/create_module/ \
||/query_module/) \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' /etc/audit/rules.d/*.rules | wc -l ) -eq 2 ] &&

[ $([ -n "${UID_MIN}" ] && awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/bin\/kmod/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" /etc/audit/rules.d/*.rules | wc -l ) -eq 2 ] &&

[ $(auditctl -l | awk '/^ *-a *always,exit/ \
&&/ -F *arch=b[2346]{2}/ \
&&(/ -F auid!=unset/||/ -F auid!=-1/||/ -F auid!=4294967295/) \
&&/ -S/ \
&&(/init_module/ \
||/finit_module/ \
||/delete_module/ \
||/create_module/ \
||/query_module/) \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)' | wc -l ) -eq 2 ] &&

[ $([ -n "${UID_MIN}" ] && auditctl -l | awk "/^ *-a *always,exit/ \
&&(/ -F *auid!=unset/||/ -F *auid!=-1/||/ -F *auid!=4294967295/) \
&&/ -F *auid>=${UID_MIN}/ \
&&/ -F *perm=x/ \
&&/ -F *path=\/usr\/bin\/kmod/ \
&&(/ key= *[!-~]* *$/||/ -k *[!-~]* *$/)" | wc -l ) -eq 2 ];

then
echo -e "Audit Title: 4.1.3.19 Ensure kernel module loading unloading and modification is collected    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.19 Ensure kernel module loading unloading and modification is collected    [FAIL] "
echo ""

fi

#4.1.3.20


if [ $(grep "^\s*[^#]" /etc/audit/rules.d/*.rules | tail -1 | grep -e '-e 2' | wc -l ) -eq 1 ];

then
echo -e "Audit Title: 4.1.3.20 Ensure the audit configuration is immutable    [PASS] "
echo ""

else
echo -e "Audit Title: 4.1.3.20 Ensure the audit configuration is immutable    [FAIL] "
echo ""

fi

#4.1.3.21

echo -e "Audit Title: 4.1.3.21 Ensure the running and on disk configuration is the same    [INELIGIBLE] "
echo ""

#4.2.1.1


if [ $(rpm -q rsyslog | grep 'not installed' | wc -l ) -eq 0 ];  
then
echo -e "Audit Title: 4.2.1.1 Ensure rsyslog is installed    [PASS] "
echo ""

else
echo -e "Audit Title: 4.2.1.1 Ensure rsyslog is installed    [FAIL] "
echo ""

fi

#4.2.1.2


if [[ $(systemctl is-enabled rsyslog | grep enabled | wc -l) -eq 1 ]]; 
then
echo -e "Audit Title: 4.2.1.2 Ensure rsyslog service is enabled    [PASS] "
echo ""

else
echo -e "Audit Title: 4.2.1.2 Ensure rsyslog service is enabled    [FAIL] "
echo ""

fi

#4.2.1.3


if [[ $(grep -e ^\s*ForwardToSyslog /etc/systemd/journald.conf 2> /dev/null | grep 'yes' | wc -l) -eq 1 ]]; 
then
echo -e "Audit Title: 4.2.1.3 Ensure journald is configured to send logs to rsyslog    [PASS] "
echo ""

else
echo -e "Audit Title: 4.2.1.3 Ensure journald is configured to send logs to rsyslog    [FAIL] "
echo ""

fi

#4.2.1.4


if [[ $(grep ^\$FileCreateMode /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null | grep '0640\|0600' | wc -l) -ne 0 ]];
then
echo -e "Audit Title: 4.2.1.4 Ensure rsyslog default file permissions configured    [PASS] "
echo ""

else
echo -e "Audit Title: 4.2.1.4 Ensure rsyslog default file permissions configured    [FAIL] "
echo ""

fi

#4.2.1.5

echo -e "Audit Title: 4.2.1.5 Ensure logging is configured    [INELIGIBLE] "
echo ""

#4.2.1.6

echo -e "Audit Title: 4.2.1.6 Ensure rsyslog is configured to send logs to a remote log host    [INELIGIBLE] "
echo ""

#4.2.1.7


if [ $(grep '$ModLoad imtcp' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null | wc -l ) -eq 0 ] &&

[ $(grep '$InputTCPServerRun' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null | wc -l ) -eq 0 ] && 

[ $(grep -P -- '^\h*module\(load="imtcp"\)' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null | wc -l ) -eq 0 ] && 

[ $(grep -P -- '^\h*input\(type="imtcp" port="514"\)' /etc/rsyslog.conf /etc/rsyslog.d/*.conf 2> /dev/null | wc -l ) -eq 0 ];
 
then
echo -e "Audit Title: 4.2.1.7 Ensure rsyslog is not configured to recieve logs from a remote client    [PASS] "
echo ""

else
echo -e "Audit Title: 4.2.1.7 Ensure rsyslog is not configured to recieve logs from a remote client    [FAIL] "
echo ""

fi

#4.2.2

echo "4.2.2 Configure journald" 
echo ""

#4.2.2.1


echo -e "4.2.2.1 Ensure journald is configured to send logs to a remote log host"
echo""

#4.2.2.1.1

if [ $(rpm -q systemd-journal-remote | grep 'not installed' | wc -l ) -eq 0 ]; 

then
echo -e "Audit Title: 4.2.2.1.1 Ensure systemd-journal-remote is installed    [PASS] "
echo ""

else
echo -e "Audit Title: 4.2.2.1.1 Ensure systemd-journal-remote is installed    [FAIL] "
echo ""

fi

#4.2.2.1.2

echo -e "Audit Title: 4.2.2.1.2 Ensure systemd-journal-remote is configured    [INELIGIBLE] "
echo ""


#4.2.2.1.3


if [ $(systemctl is-enabled systemd-journal-upload.service 2> /dev/null | wc -l ) -eq 1 ]; 
then
echo -e "Audit Title: 4.2.2.1.3 Ensure systemd-journal-remote is enabled    [PASS] "
echo ""

else
echo -e "Audit Title: 4.2.2.1.3 Ensure systemd-journal-remote is enabled    [FAIL] "
echo ""

fi

#4.2.2.1.4

if [ $(systemctl is-enabled systemd-journal-remote.socket 2> /dev/null | grep 'masked' | wc -l) -eq 1 ];
then
echo -e "Audit Title: 4.2.2.1.4 Ensure journald is not configured to recieve logs from a remote client    [PASS] "
echo "" 

else
echo -e "Audit Title: 4.2.2.1.4 Ensure journald is not configured to recieve logs from a remote client    [FAIL] "
echo ""

fi

#4.2.2.2

if [ $(systemctl is-enabled systemd-journald.service 2> /dev/null | grep 'static' | wc -l) -eq 1 ];
then
echo -e "Audit Title: 4.2.2.2 Ensure journald service is enabled    [PASS] "
echo "" 

else
echo -e "Audit Title: 4.2.2.2 Ensure journald service is enabled    [FAIL] "
echo "" 

fi

#4.2.2.3

if [ $(grep ^\s*Compress /etc/systemd/journald.conf 2> /dev/null | wc -l) -eq 1 ];
then
echo -e "Audit Title: 4.2.2.3 Ensure journald is configured to compress large log files    [PASS] "
echo "" 

else
echo -e "Audit Title: 4.2.2.3 Ensure journald is configured to compress large log files    [FAIL] "
echo "" 

fi

#4.2.2.4

if [ $(grep ^\s*Storage /etc/systemd/journald.conf 2> /dev/null | wc -l) -eq 1 ];
then
echo -e "Audit Title: 4.2.2.4 Ensure journald is configured to write logfiles to persistent disk    [PASS] "
echo "" 

else
echo -e "Audit Title: 4.2.2.4 Ensure journald is configured to write logfiles to persistent disk    [FAIL] "
echo "" 

fi

#4.2.2.5


if [ $(grep ^\s*ForwardToSyslog /etc/systemd/journald.conf 2> /dev/null | wc -l) -eq 0 ];
then
echo -e "Audit Title: 4.2.2.5 Ensure journald is not configured to send logs to rsyslog    [PASS] "
echo "" 

else
echo -e "Audit Title: 4.2.2.5 Ensure journald is not configured to send logs to rsyslog    [FAIL] "
echo "" 

fi

#4.2.2.6

echo -e "Audit Title: 4.2.2.6 Ensure journald log rotation is configured per site policy    [INELIGIBLE] "
echo ""

#4.2.2.7

echo -e "Audit Title: 4.2.2.7 Ensure journald default file permissions configured    [INELIGIBLE] "
echo ""

#4.2.3

if [ $(find /var/log/ -type f -perm /g+wx,o+rwx -exec ls -l "{}" + | wc -l) -eq 0 ]; 
then
echo -e "Audit Title: 4.2.3 Ensure permissions on all logfiles are configured    [PASS] "
echo "" 

else
echo -e "Audit Title: 4.2.3 Ensure permissions on all logfiles are configured    [FAIL] "
echo "" 

fi

#4.3

echo -e "Audit Title: 4.3 Ensure logrotate is configured    [INELIGIBLE] "
echo ""

}


function appendSearch() {
./cis-1S.sh > test.txt
 
}

#appendSearch
