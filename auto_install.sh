VERSION=VBoxManage -v | sed 's/\(.*\)r\([0-9]*\)/\1/'
bundle install
bundle exec veewee vbox define "precise-vbox-$VERSION" "ubuntu-12.04.1-server-i386"
bundle exec veewee vbox build "precise-vbox-$VERSION"
bundle exec veewee vbox validate "precise-vbox-$VERSION"
VBoxManage controlvm "precise-vbox-$VERSION" poweroff
vagrant package --base 'precise-vbox-4.2.4' --output 'boxes/precise-vbox-4.2.4.box'
vagrant box add "precise-vbox-$VERSION" "boxes/precise-vbox-$VERSION.box"
VBoxManage unregistervm precise-vbox-$VERSION --delete

cd /tmp
echo "Sankar"
ecjp "Transfered successfully"
touch yes.sh
