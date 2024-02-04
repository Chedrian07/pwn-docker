#!/bin/bash

realpath=$(realpath $1) #delete home directory in path
binary_path='~'/${realpath#/home/$USER/}
ssh_path='/root/'${realpath#/home/$USER/}
binary_dir=$(dirname $binary_path)


ubuntu_version=$2
port=$2
password=$2

username="root"
host="localhost"


#Go to gdb binary_path with ssh session
#sshpass -p 2204 ssh -o StrictHostKeyChecking=no -p 2204 root@kch3dri4n.kr

echo real path: $realpath
echo binary path: $binary_path
echo ubuntu version: $ubuntu_version
echo binary dir: $binary_dir

if [ $3 == "ex" ]; then
    echo "exploit"
    sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $username@$host "cd $binary_dir; python3 ex.py"
    #stop script
    exit 1
fi

#go go 2 binary_dir and debug with keeping session

echo "go2pwn"
sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $username@$host "cd $binary_dir; gdb -q $binary_path"
sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $username@$host cd $binary_dir;


#if ex.py no exist, create ex.py
if [ ! -f "ex.py" ]; then
    echo "create ex.py"
    echo "from pwn import *" > ex.py
    echo "context(arch='amd64', os='linux')" >> ex.py
    echo "context.log_level = 'debug'" >> ex.py
    echo "context.terminal = ['tmux', 'splitw', '-h']" >> ex.py
    echo "s = ssh(host='$host', user='$username', password='$password', port=$port)" >> ex.py
    echo "p = s.process('$ssh_path')" >> ex.py
    echo "" >> ex.py
    echo "def slog(name,addr): return success('": "'.join[(name,hex(addr))])" >> ex.py
    echo "" >> ex.py
    #echo "gdb.attach(p)" >> ex.py
fi

#if $3==ssh
if [ $3 == "ssh" ]; then
    #ssh login
    echo "ssh login"
    sshpass -p $password ssh -o StrictHostKeyChecking=no -p $port $username@$host
fi
