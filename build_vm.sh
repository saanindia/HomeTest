#!/bin/bash

bundle install

bundle exec veewee vbox build 'janihur/ubuntu-1404-desktop' --force --auto --nogui
bundle exec veewee vbox validate 'janihur/ubuntu-1404-desktop'

bundle exec vagrant basebox export 'janihur/ubuntu-1404-desktop' --force
bundle exec vagrant up
