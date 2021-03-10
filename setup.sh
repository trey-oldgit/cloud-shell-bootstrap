#!/bin/bash

# Variables
RUBY_VERS=$(ruby -v | cut -c 5-10)
DESIRED_RUBY_VERS="2.6"

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
else
  echo "ruby-install already installed. Checking chruby installation..."
fi 

# Install chruby
if [ -f "/usr/local/share/chruby/chruby.sh" ]; then
  echo "chruby already installed. Checking ruby version..." 
  source /usr/local/share/chruby/chruby.sh
  chruby ruby-2.6.6
else
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
  source /usr/local/share/chruby/chruby.sh
  source ~/.bashrc
fi 

# Install Ruby 2.6
if [[ $RUBY_VERS =~ $DESIRED_RUBY_VERS ]]; then
  echo "Ruby 2.6 is installed.";
fi 

if [[ $RUBY_VERS != *"$DESIRED_RUBY_VERS"* ]]; then
  echo "Ruby 2.6 is not installed.";
  ruby-install 2.6.6
  source /usr/local/share/chruby/chruby.sh
  chruby ruby-2.6.6
fi

