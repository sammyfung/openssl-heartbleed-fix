#!/bin/bash
#
# openssl-heartbleed-fix
# ----------------------
# OpenSSL Heartbleed (CVE-2014-0160) Fix script for Debian / Ubuntu system
# Git Clone: https://github.com/sammyfung/openssl-heartbleed-fix
#
# Sammy Fung <sammy@sammy.hk>
#
# *** Please run as root ***
# (or use sudo + adding sudo in the begining of each lines)
#

# Upgrading OpenSSL package
apt-get update
apt-get install -y libssh1.0.0 openssl

# For Fedora, you can remark above apt-get lines and unmark the 
# following yum line.
#
# sudo yum update
#

# Check build date manually, built date 2014/04/07 or later should be safe.
openssl version -a

# Backup default Apache SSL certificate and key file for Ubuntu / Debian.
mv /etc/ssl/certs/ssl-cert-snakeoil.pem /etc/ssl/certs/old-cert-snakeoil.pem
mv /etc/ssl/private/ssl-cert-snakeoil.key /etc/ssl/private/old-cert-snakeoil.key

# Generate new SSL certificate and key files with openssl
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
 -keyout /etc/ssl/private/ssl-cert-snakeoil.key \
 -out /etc/ssl/certs/ssl-cert-snakeoil.pem

# Stop and start Apache httpd to take new SSL cert and key effective
/etc/init.d/apache2 stop
/etc/init.d/apache2 start

# Done!
