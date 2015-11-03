#!/bin/bash
mkdir -p /etc/chef/ohai/hints
touch /etc/chef/ohai/hints/ec2.json > /tmp/user_data.log
echo 'Defaults:ec2-user !requiretty' >> /etc/sudoers