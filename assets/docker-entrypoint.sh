#!/usr/bin/env bash
set -e

# Configure keys only ssh connection
sed -i.bak 's/#[ ]*RSAAuthentication yes/RSAAuthentication yes/' /etc/ssh/ssh_config
sed -i.bak 's/#[ ]*PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/ssh_config
rm /etc/ssh/ssh_config.bak
/etc/init.d/ssh restart

# Start Runit
/opt/gitlab/embedded/bin/runsvdir-start &

# (Re)configure GitLab
gitlab-ctl reconfigure

# Tail all the GitLab logs
gitlab-ctl tail
