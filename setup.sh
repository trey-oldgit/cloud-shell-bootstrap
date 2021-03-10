#!/bin/bash

# Make sure we're in the home dir
cd $HOME

# Install ruby-install
if ! [ -x "$(command -v ruby-install)" ]; then
	echo 'Installing: ruby-install ...'
	wget -O ruby-install-0.8.1.tar.gz https://github.com/postmodern/ruby-install/archive/v0.8.1.tar.gz
	tar -xzvf ruby-install-0.8.1.tar.gz
	cd ruby-install-0.8.1/
	sudo make install

	# Cleanup ruby-install install files
	cd $HOME
	rm -rf ruby-install-0.8.1.tar.gz
	rm -rf ruby-install-0.8.1/
fi 

if ! [ -x "$(command -v chruby)" ]; then
	echo 'Installing: chruby ...'	
	wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
	tar -zxvf chruby-0.3.9.tar.gz
	cd chruby-0.3.9/
	sudo make install

	# Cleanup chruby install files
	echo 'Cleaning up chruby install files ...'
	cd $HOME
	rm -rf chruby-0.3.9.tar.gz
	rm -rf chruby-0.3.9/

	# Add config to .bashrc
	echo 'source /usr/local/share/chruby/chruby.sh' >> ~/.bashrc
	source ~/.bashrc
fi 
