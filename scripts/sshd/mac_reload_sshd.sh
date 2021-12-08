#!/usr/bin/env bash

sudo launchctl stop com.openssh.sshd
sudo launchctl start com.openssh.sshd

sudo launchctl unload /System/Library/LaunchDaemons/ssh.plist
sudo launchctl load -w /System/Library/LaunchDaemons/ssh.plist
