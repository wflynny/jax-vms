#!/usr/bin/env bash
# This is my usual "I can do whatever from here" build

sudo usermod -aG wheel $USER
sudo sed -i 's/, ! \/bin\/su, ! \/usr\/bin\/passwd, ! \/usr\/sbin\/visudo//' /etc/sudoers

sudo yum install -y singularity neovim
alias vim=nvim

sudo mkdir /opt/work && sudo chgrp jaxuser /opt/work && sudo chmod g+w /opt/work && cd /opt/work
miniconda_url="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
wget -O miniconda.sh $miniconda_url && bash miniconda.sh -b -s -p /opt/work/tools/miniconda
