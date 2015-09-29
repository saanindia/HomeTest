#!/bin/bash
cd /etc/puppet/modules/mytest/files
wget  http://edu.uci.ics/crawler4j/4.1-SNAPSHOT/crawler4j-4.1-SNAPSHOT.jar

cd /home/AutoVM
vagrant up

vagrant ssh
sudo exit

vagrant ssh -c "sudo service puppet status"
vagrant ssh -c "sudo puppet agent --test --waitforcert=60"
sudo puppet cert sign --all
vagrant ssh -c "sudo puppet agent --test"

vagrant ssh
sudo exit

echo "Work successfully Done"

#bundle install
#bundle exec veewee vbox define 'ubuntu-14' 'ubuntu-14.04.3-server-amd64'
#bundle exec veewee vbox build 'ubuntu-14' --force --auto --nogui
#bundle exec veewee vbox validate 'ubuntu-14'
#bundle exec vagrant basebox export 'ubuntu-14' --force
