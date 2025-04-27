#!/bin/bash
# This script generates SSH keys for Terraform to use with Azure.
cd ..
mkdir -p SSHKeys
ssh-keygen -t rsa -b 4096 -f SSHKeys/ChromaVM -N "" 
chmod 400 SSHKeys/ChromaVM
echo "SSH keys generated in SSHKeys directory."
