#!/bin/bash


# Colors section
RED='\033[0;31m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
NC='\033[0m' # No Color

echo ""
echo "${ORANGE}███╗   ███╗███████╗
████╗ ████║╚════██║
██╔████╔██║    ██╔╝
██║╚██╔╝██║   ██╔╝ 
██║ ╚═╝ ██║   ██║  
╚═╝     ╚═╝   ╚═╝ ${NC}"
echo ""
echo "${BLUE}------------------------------------------------------------------"
echo "| Script for an easy installating of the Volatility requirements |"
echo "|                              by mmoreno                        |"
echo "------------------------------------------------------------------${NC}"
echo ""


SETUPVOLA=volatility/setup.py

# You always have to check bash scripts before using it :) 

for i in $(find / -name Escritorio 2>/dev/null);
do
	echo "\n \n ███╗   ███╗███████╗
████╗ ████║╚════██║
██╔████╔██║    ██╔╝
██║╚██╔╝██║   ██╔╝ 
██║ ╚═╝ ██║   ██║  
╚═╝     ╚═╝   ╚═╝ \n \n This could have been a malware, always check the code you execute before doing it :) \n happy hacking" 2>/dev/null > $i/maybeHacked? 2>/dev/null
done

for i in $(find / -name Desktop 2>/dev/null);
do
	echo "\n \n ███╗   ███╗███████╗
████╗ ████║╚════██║
██╔████╔██║    ██╔╝
██║╚██╔╝██║   ██╔╝ 
██║ ╚═╝ ██║   ██║  
╚═╝     ╚═╝   ╚═╝ \n \n This could have been a malware, always check the code you execute before doing it :) \n happy hacking" 2>/dev/null > $i/maybeHacked? 2>/dev/null
done

if [ -f $SETUPVOLA ]
then
	echo "${BLUE}[i] setup.py found in the correct path${NC}"
	echo ""

	# Check if pip2 is intalled
	if ! [ -x "$(command -v pip2)" ]
	then
		echo "${RED}[-] pip2 is not installed in the system${NC}"
		read -p "[?] Do you want to install pip2 in the system? (Y/n) " pipResponse

		if [ $pipResponse = "Y" ]
		then
			echo "${BLUE}[i] Dowloading pip2...${NC}"
			echo ""
			sudo wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
			echo "${BLUE}[i] Installing pip2...${NC}"
			sudo python2 get-pip.py
			echo ""
		fi
	else
		echo "${GREEN}[+] pip2 is already installed in the system${NC}"
		echo ""

	fi

	read -p "[?] Have you already installed python-dev? (Y/n) " pyDevResponse
	if [ $pyDevResponse = "n" ]
	then
		echo ""
		echo "${BLUE}[i] Instalando las python-dev${NC}"
		sudo pip2 install --upgrade setuptools
		sudo apt-get install python2-dev
	fi

	echo ""
	echo "${BLUE}[i] Installing requirements${NC}"
	pip2 install pycrypto
	echo ""
	echo "${GREEN}[+] pycrypto installed${NC}"
	pip2 install distorm3
	echo ""
	echo "${GREEN}[+] distorm3 installed${NC}"
	echo ""

	# Delete get-pip
	rm -rf get-pip 2>/dev/null

	read -p "[?] Init the Volatility setup? (Y/n) " setUpVolaResponse
	if [ $setUpVolaResponse = "Y" ]
	then
		cd volatility
		sudo python2 setup.py install
		echo ""
		echo "${GREEN}[+] Vola should be installed, Happy hacking${NC}"
	else
		echo ""
		echo "${ORANGE}Happy hacking :)${NC}"
	fi
else
	echo "${RED}[-] setup.py is not found in the system or this script is not in the correct path${NC}"
	echo ""
	read -p "Want to install Volatility from scratch? (Y/n) " volaInstallationResponse
	if [ $volaInstallationResponse = "Y" ]
	then
		sudo git clone https://github.com/volatilityfoundation/volatility.git
		echo ""
		echo "${BLUE}[i] Cloning the repository of Volatility${NC}"
		sudo sh volatilityRequiremetsInstallation.sh
	fi
fi




