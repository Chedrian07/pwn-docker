#!/bin/bash

#save binary_path 절대경로
path=$(realpath $1)

if [ "$2" == "x86" ]; then
    ~/tools/linux_server $path &
    echo "Start IDA-gdbserver i386"
    echo "Open Port [ubuntu-version-year]922"
elif [ "$2" == "x64" ]; then
    ~/tools/linux_server64 $path &
    echo "Start IDA-gdbserver amd64"
    echo "Open Port [ubuntu-version-year]922"
elif [ "$2" == "arm64" ]; then
    ~/tools/armlinux_server $path &
    echo "Start IDA-gdbserver arm64"
    echo "Open Port [ubuntu-version-year]922"
else
    echo "Failed to open gdbserver..."
fi

