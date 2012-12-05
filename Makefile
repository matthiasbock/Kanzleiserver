#
# Main installation Makefile
#

all:
	make prepare install

prepare:
	mkdir -p /home/code/
	cd ..;	mv Kanzleiserver /home/code/
	cd /home/code/Kanzleiserver
	aptitude install tar bzip2 gzip git --yes

install:
	make ramdisk WebAppDesktop OpenLawyers MediaWiki ownCloud WebSC UPnP
	chown www-data:www-data www/ -R

ramdisk:
	if [ ! -e /etc/init.d/ramdisk ]; then		cp init.d/ramdisk /etc/init.d/;				fi
	if [ ! -e /etc/rcS.d/S11ramdisk ]; then	ln ../init.d/ramdisk /etc/rcS.d/S11ramdisk -fs;	fi

WebAppDesktop:
	if [ -e "www/WebApp-Desktop" ]; then \
		cd www/WebApp-Desktop/; \
		git pull; \
	else \
		cd www/; \
		git clone https://github.com/matthiasbock/WebApp-Desktop.git; \
		ln WebApp-Desktop/index.html . -s; \
	fi

OpenLawyers:
	# install OpenLawyers
	if [ -e "www/OpenLawyers" ]; then \
		cd www/OpenLawyers/; \
		git pull; \
	else \
		cd www/; \
		git clone https://github.com/matthiasbock/OpenLawyers.git; \
	fi

MediaWiki:
	# install MediaWiki 1.20.0
	if [ ! -e "www/MediaWiki" ]; then \
		cd www/; \
		wget -c http://download.wikimedia.org/mediawiki/1.20/mediawiki-1.20.0.tar.gz -O /tmp/mediawiki.tar.gz; \
		tar -xzf /tmp/mediawiki.tar.gz; \
		mv mediawiki-1.20.0 MediaWiki; \
	fi
	cd ..
	
ownCloud:
	# install ownCloud 4.5.2
	if [ ! -e "www/ownCloud" ]; then \
		cd www/; \
		wget -c http://mirrors.owncloud.org/releases/owncloud-4.5.2.tar.bz2 -O /tmp/owncloud.tar.bz2; \
		tar -xjf /tmp/owncloud.tar.bz2; \
		mv owncloud ownCloud; \
	fi

WebSC:
	# install WebSC
	if [ -e "www/WebSC" ]; then \
		cd www/WebSC; \
		git pull; \
	else \
		cd www/; \
		git clone https://github.com/matthiasbock/WebSC.git; \
	fi

UPnP:
	# install UPnP-Buddy
	if [ -e "tools/UPnP-Buddy" ]; then \
		cd tools/UPnP-Buddy; \
		git pull; \
	else \
		mkdir tools -p; \
		cd tools/; \
		git clone https://github.com/matthiasbock/UPnP-Buddy.git; \
	fi

