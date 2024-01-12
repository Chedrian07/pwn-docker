#!/bin/bash

binary=$1


qemu-arm64-static -L /usr/aarch64-linux-gnu/ -g 1234 $binary &

if [ $? -eq 0 ]; then
    echo "Open GDB SERVER PORT 1234...[Background]"
else
    echo "Failed to open GDB SERVER PORT 1234..."
fi