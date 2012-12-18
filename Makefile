#
# Main installation Makefile
#

all:
	make prepare upgrade

prepare:
	mkdir -p /home/code/
	cd ..; mv Kanzleiserver /home/code/
	cd /home/code/Kanzleiserver
	aptitude install tar bzip2 gzip git --yes

upgrade:
	make Desktop OpenLawyers LawyerWiki LawyerCloud WebSC
	chown www-data:www-data www/ -R

Desktop:
	if [ -e "www/Desktop" ]; then \
		cd www/Desktop/; \
		git pull; \
	else \
		cd www/; \
		git clone https://github.com/matthiasbock/WebApp-Desktop.git; \
		mv WebApp-Desktop Desktop; \
		ln Desktop/index.html . -s; \
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

LawyerWiki:
	if [ -e "www/LawyerWiki" ]; then \
		cd www/LawyerWiki; \
		git pull; \
	else \
		cd www/; \
		git clone https://github.com/matthiasbock/LawyerWiki.git; \
	fi
	
LawyerCloud:
	if [ -e "www/LawyerCloud" ]; then \
		cd www/LawyerCloud; \
		git pull; \
	else \
		cd www/; \
		git clone https://github.com/matthiasbock/LawyerCloud.git; \
	fi

WebSC:
	if [ -e "www/WebSC" ]; then \
		cd www/WebSC; \
		git pull; \
	else \
		cd www/; \
		git clone https://github.com/matthiasbock/WebSC.git; \
	fi
