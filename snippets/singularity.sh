#!/usr/bin/env bash

sudo yum install -y singularity
sudo mkdir /opt/work && sudo chgrp jaxuser /opt/work && sudo chmod g+w /opt/work && cd /opt/work
