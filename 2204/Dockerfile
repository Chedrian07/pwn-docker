FROM ubuntu:22.04
LABEL org.label-schema.arch="x86-64"

ARG DEBIAN_FRONTEND=noninteractive

ENV TZ Asia/Seoul
ENV PYTHONIOENCODING UTF-8
ENV LC_CTYPE C.UTF-8

WORKDIR /root

RUN apt update && apt install -y  netcat
RUN apt install vim git gcc ssh curl wget gdb sudo zsh python3 python3-pip libffi-dev build-essential libssl-dev libc6-i386 libc6-dbg gcc-multilib make gcc-multilib qemu-user-static -y
RUN apt install tmux -y

RUN sudo apt install -y openssh-server
RUN sudo sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sudo sed -i 's/#Port 22/Port 22/' /etc/ssh/sshd_config
RUN echo "root:2204" | sudo chpasswd  #유저 변경
RUN sudo systemctl enable ssh
RUN sudo service ssh restart


RUN dpkg --add-architecture i386
RUN apt update
RUN apt install libc6:i386 -y

RUN python3 -m pip install --upgrade pip
RUN pip3 install unicorn
RUN pip3 install keystone-engine
RUN pip3 install pwntools
RUN pip3 install ropgadget
RUN apt install libcapstone-dev -y

RUN git clone https://github.com/pwndbg/pwndbg
WORKDIR /root/pwndbg
RUN cd pwndbg
#RUN git checkout ubuntu18.04-final
#RUN pip3 install -r requirements.txt
RUN ~/pwndbg/setup.sh


WORKDIR /root
RUN git clone https://github.com/radareorg/radare2 && cd radare2 && sys/install.sh #install Ghirda

RUN cd /root
RUN git clone https://github.com/jerdna-regeiz/splitmind

RUN apt install ruby-full gem -y
RUN apt install ruby-dev -y
RUN gem install one_gadget -v 1.7.3

RUN git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim #Git Plugin

RUN wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh || true
RUN mkdir -p "$HOME/.zsh"
RUN git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
RUN echo "fpath+=("$HOME/.zsh/pure")\nautoload -U promptinit; promptinit\nprompt pure" >> ~/.zshrc

RUN git clone https://github.com/zsh-users/zsh-syntax-highlighting.git
RUN echo "source ./zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc

RUN git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
RUN echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
RUN echo "ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=111'" >> ~/.zshrc
RUN export LANG=C.UTF-8
RUN mkdir /root/pwn

#-------------------Script Copy--------------------------#

RUN mkdir /root/.script
RUN mkdir /root/.tools

COPY setting/pwn-command/ /root/.script/
COPY Tools/ /root/.tools/

RUN touch /root/.tmux.conf
RUN touch /root/.vimrc
RUN touch /root/.gdbinit

COPY setting/.tmux.conf /root/.tmux.conf
COPY setting/.vimrc /root/.vimrc
COPY setting/.gdbinit /root/.gdbinit
#-------------------Import script to .zshrc--------------------------#

RUN echo "alias pwn='/root/pwn-command/go2pwn'" >> ~/.zshrc
RUN echo "alias ida='/root/.tools/ida/ida64'" >> ~/.zshrc
RUN echo "alias pwnx86='/root/.script/pwn-x86.sh'" >> ~/.zshrc
RUN echo "alias pwn-x64='/root/.script/pwn-x64.sh'" >> ~/.zshrc
RUN echo "alias pwn-arm='/root/.script/pwn-arm.sh'" >> ~/.zshrc

RUN chmod +x /root/.script/*
RUN chmod +x /root/.tools/*



#--------------------------------------------------------------------#

EXPOSE 22
ENTRYPOINT ["/usr/bin/sudo", "/usr/sbin/sshd", "-D", "-o", "ListenAddress=0.0.0.0"]