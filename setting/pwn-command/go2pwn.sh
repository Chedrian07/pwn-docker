#!/bin/bash

$1
path=$(realpath "$1")

# Check binary architecture and bitness
file_output=$(file "$1")

if echo "$file_output" | grep -q "i386"; then
    if echo "$file_output" | grep -q "ELF 32-bit"; then
        echo "Binary is 32-bit i386"
        #Make Example Exploit Code for 32-bit i386 >> ex.py
        echo "from pwn import *" > ex.py
        echo "p = process('"./$path"')" >> ex.py
        echo "context.log_level = 'debug'" >> ex.py
        echo "context.arch = 'i386'" >> ex.py
        echo "context.termianl = ['tmux', 'splitw', '-h']" >> ex.py
        echo "def slog(name,addr): return success(": ".join([name, hex(addr)]))" >> ex.py
elif echo "$file_output" | grep -q "amd64"; then
    if echo "$file_output" | grep -q "ELF 64-bit"; then
        echo "from pwn import *" > ex.py
        echo "p = process('"./$path"')" >> ex.py
        echo "context.log_level = 'debug'" >> ex.py
        echo "context.arch = 'i386'" >> ex.py
        echo "context.termianl = ['tmux', 'splitw', '-h']" >> ex.py
        echo "def slog(name,addr): return success(": ".join([name, hex(addr)]))" >> ex.py

else
    echo "Binary is not 32-bit i386 or 64-bit amd64"
fi
