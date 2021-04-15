#!/bin/bash

# Variables
TERRAFORM_VERSION="0.13.6"

# Install Terraform 0.13
echo "Removing Terraform 0.12..."
sudo rm -rf /usr/local/bin/terraform
echo "Installing Terraform version $TERRAFORM_VERSION..."
wget https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip
sudo mv terraform /usr/local/bin
