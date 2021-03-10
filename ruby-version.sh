#!/bin/bash

RUBY_VERS=$(ruby -v | cut -c 5-10)
DESIRED_RUBY_VERS="2.6"

if [[ $RUBY_VERS =~ $DESIRED_RUBY_VERS ]]; then
  echo "Ruby 2.6 is installed.";
fi 

if [[ $RUBY_VERS != *"$DESIRED_RUBY_VERS"* ]]; then
  echo "Ruby 2.6 is not installed.";
fi 

