#
# Main installation Makefile
#

all:
	mkdir -p /home/code/
	cd ..
	mv Kanzleiserver /home/code/
	cd /home/code/Kanzleiserver
	aptitude install tar bzip2 gzip git -y
	make ramdisk OpenLawyers MediaWiki ownCloud UPnP WebSC

ramdisk:
	cp init.d/ramdisk /etc/init.d/
	ln ../init.d/ramdisk /etc/rcS.d/S11ramdisk -s

OpenLawyers:
	# install OpenLawyers
	cd www/
	if [ -e "OpenLawyers" ]; then
		cd OpenLawyers
		git pull
	else
		git clone https://github.com/matthiasbock/OpenLawyers.git
	fi
	cd ..

MediaWiki:
	# install MediaWiki 1.20.0
	cd www/
	if [ ! -e mediawiki ]; then
		wget http://download.wikimedia.org/mediawiki/1.20/mediawiki-1.20.0.tar.gz -O /tmp/mediawiki.tar.gz
		tar -xzf /tmp/mediawiki.tar.gz
#		rm /tmp/mediawiki.tar.gz
	fi
	cd ..
	
ownCloud:
	# install ownCloud 4.5.2
	cd www/
	if [ ! -e owncloud ]; then
		wget http://mirrors.owncloud.org/releases/owncloud-4.5.2.tar.bz2 -O /tmp/owncloud.tar.bz2
		tar -xjf /tmp/owncloud.tar.bz2
#		rm /tmp/owncloud.tar.bz2
	fi
	cd ..

UPnP:
	# install UPnP-Buddy
	mkdir tools -p
	cd tools/
	if [ -e "UPnP-Buddy" ]; then
		cd UPnP-Buddy
		git pull
	else
		git clone https://github.com/matthiasbock/UPnP-Buddy.git
	fi
	cd ..

WebSC:
	# install WebSC
	cd www/
	if [ -e "WebSC" ]; then
		cd WebSC
		git pull
	else
		git clone https://github.com/matthiasbock/WebSC.git
	fi
	cd ..
