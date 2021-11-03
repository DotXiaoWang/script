#!/bin/bash 
#通过文件创建用户
[ ! -F $1  ] &&echo "$1file is not exist!" &&exit
STUDENT_FILE=$1

for USER in `cat $STUDENT_FILE` ;do 
	if id ${USER} &> /dev/null; then 
		echo "用户:${USER},已经存在，创建失败"
		userdel -r ${USER}
	else
		useradd  ${USER}
		echo ${USER} | passwd --stdin ${USER}
		echo "用户:${USER}创建成功"
	fi
done 


