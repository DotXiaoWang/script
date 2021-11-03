#!/bin/bash
##install yum stop firewalld 
mkdir -p /opt/local-yum
cd /etc/yum.repos.d
mv * /opt
cat > /etc/yum.repos.d/local.repo << EOF
[local-yum]
name=local-yum
baseurl=file:///opt/local-yum
enabled=1
gpgcheck=0
EOF
mount /dev/cdrom /opt/local-yum
yum clean all; yum makecache 
yum install -y vsftpd  && 
echo "anon_root=/opt/local-yum" >> /etc/vsftpd/vsftpd.conf   
systemctl start vsftpd && 
systemctl enable vsftpd 

systemctl stop firewalld 
systemctl disable firewalld 
sed -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config
setenforce 0    
echo "/dev/cdrom /opt/local-yum iso9660 defaults 0 0 " >> /etc/fstab 
mount -a 
