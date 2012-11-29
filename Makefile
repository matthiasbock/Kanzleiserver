#
# Main installation Makefile
#

all:
	mkdir -p /home/code/
	cd ..
	mv Kanzleiserver /home/code/
	cd /home/code/Kanzleiserver
	aptitude install tar bzip2 gzip git -y
	make ramdisk openLawyers MediaWiki ownCloud UPnP WebSC

ramdisk:
	cp init.d/ramdisk /etc/init.d/
	ln ../init.d/ramdisk /etc/rcS.d/S11ramdisk -s

openLawyers:
	# install openLawyers

MediaWiki:
	# install MediaWiki 1.20.0
	wget http://download.wikimedia.org/mediawiki/1.20/mediawiki-1.20.0.tar.gz -O /tmp/mediawiki.tar.gz
	cd www/
	tar -xzf /tmp/mediawiki.tar.gz
	rm /tmp/mediawiki.tar.gz
	cd ..
	
ownCloud:
	# install ownCloud 4.5.2
	wget http://mirrors.owncloud.org/releases/owncloud-4.5.2.tar.bz2 -O /tmp/owncloud.tar.bz2
	cd www/
	tar -xjf /tmp/owncloud.tar.bz2
	rm /tmp/owncloud.tar.bz2
	cd ..

UPnP:
	# install UPnP-Buddy
	mkdir tools -p
	cd tools/
	git clone https://github.com/matthiasbock/UPnP-Buddy.git
	cd ..

WebSC:
	# install WebSC
	cd www/
	git clone https://github.com/matthiasbock/WebSC.git
	cd ..
