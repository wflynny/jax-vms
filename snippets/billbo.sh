#!/usr/bin/env bash
# This is my usual "I can do whatever from here" build

sudo usermod -aG wheel $USER
sudo sed -i 's/, ! \/bin\/su, ! \/usr\/bin\/passwd, ! \/usr\/sbin\/visudo//' /etc/sudoers

sudo yum install -y singularity neovim
alias vim=nvim

sudo mkdir /opt/work && sudo chgrp jaxuser /opt/work && sudo chmod g+w /opt/work && cd /opt/work
miniconda_url="https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh"
wget -O miniconda.sh $miniconda_url && bash miniconda.sh -b -s -p /opt/work/tools/miniconda

mkdir -p /opt/work/logs /opt/work/configs/.secrets
cat << 'EOF' > /opt/work/configs/sourceme.bash
## >>> conda initialize >>>
## !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/opt/miniconda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/opt/miniconda/etc/profile.d/conda.sh" ]; then
#        . "/opt/miniconda/etc/profile.d/conda.sh"
#    else
#        export PATH="/opt/miniconda/bin:$PATH"
#    fi
#fi
#unset __conda_setup
## <<< conda initialize <<<
EOF
