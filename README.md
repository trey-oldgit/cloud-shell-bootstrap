# GCP Cloud Shell Bootstrap

This repo contains a Bash setup script to run inside the GCP Cloud Shell.

## Introduction

The included ruby_setup.sh file will install and setup ruby-install, chruby, and Ruby 2.6.6.
The included terraform_setup.sh file will remove the current version of Terraform and replace it with Terraform 0.13.6.

## Running

This script can be run by using the included bash scripts:

```
$ ./ruby_setup.sh
```

or

```
$ ./terraform_setup.sh
```
