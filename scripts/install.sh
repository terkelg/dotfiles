#!/usr/bin/env bash

# Ask for the administrator password upfront
sudo -v

# Install all the tools
./brew.sh
./npm.sh
./other.sh


