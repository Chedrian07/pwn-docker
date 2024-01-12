sudo docker run -d -it --privileged --platform linux/amd64 --name pwn1804 --cap-add=SYS_PTRACE -v ~/pwn:/root/pwn --security-opt seccomp=unconfined -p 1804:22 -p 18922:23946 pwn1804
sudo docker run -d -it --privileged --platform linux/amd64 --name pwn2004 --cap-add=SYS_PTRACE -v ~/pwn:/root/pwn --security-opt seccomp=unconfined -p 2004:22 -p 20922:23946 pwn2004 
sudo docker run -d -it --privileged --platform linux/amd64 --name pwn2204 --cap-add=SYS_PTRACE -v ~/pwn:/root/pwn --security-opt seccomp=unconfined -p 2204:22 -p 22922:23946 pwn2204 

