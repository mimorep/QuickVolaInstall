#!/bin/bash

echo ""
echo "███╗   ███╗███████╗
████╗ ████║╚════██║
██╔████╔██║    ██╔╝
██║╚██╔╝██║   ██╔╝ 
██║ ╚═╝ ██║   ██║  
╚═╝     ╚═╝   ╚═╝ "
echo ""
echo "------------------------------------------------------------------"
echo "| Script for an easy installating of the Volatility requirements |"
echo "|                              by mmoreno                        |"
echo "------------------------------------------------------------------"
echo ""


# TODO: Mejorar esta herramienta para instalar también dwarfdump


# TODO: También convendría realizar aqui la instalación de la herramienta que vimos en el módulo de los headers


# Orden de la instalación: linux-compiler-gcc-xxx -> linux-kbuild-5.10_xxx -> linux-headers-5.10.0-kali9-common -> linux-headers-5.10.0-kali9-amd64_xxx -> 


# TODO: Eliminar el fichero de get-pip

SETUPVOLA=volatility/setup.py

if [ -f $SETUPVOLA ]
then
	echo "[i] setup.py found in the correct path"
	echo ""

	# Check if pip2 is intalled
	if ! [ -x "$(command -v pip2)" ]
	then
		echo "[-] pip2 is not installed in the system"
		read -p "[?] Do you want to install pip2 in the system? (Y/n) " pipResponse

		if [ $pipResponse = "Y" ]
		then
			echo "[i] Dowloading pip2..."
			echo ""
			sudo wget https://bootstrap.pypa.io/pip/2.7/get-pip.py
			echo "[i] Installing pip2..."
			sudo python2 get-pip.py
			echo ""
		fi
	else
		echo "------------------------------------"
		echo "[+] pip2 is already installed in the system"
		echo "------------------------------------"
		echo ""

	fi

	read -p "[?] Have you already installed python-dev? (Y/n) " pyDevResponse
	if [ $pyDevResponse = "n" ]
	then
		echo ""
		echo "Instalando las python-dev"
		sudo pip2 install --upgrade setuptools
		sudo apt-get install python2-dev
	fi

	echo ""
	echo "[i] Installing requirements"
	pip2 install pycrypto
	echo ""
	echo "[+] pycrypto installed"
	pip2 install distorm3
	echo ""
	echo "[+] distorm3 installed"
	echo ""
	read -p "[?] Init the Volatility setup? (Y/n) " setUpVolaResponse
	if [ $setUpVolaResponse = "Y" ]
	then
		cd volatility
		sudo python2 setup.py install
		echo ""
		echo "[+] Vola should be installed, Happy hacking"
	else
		echo ""
		echo "Happy hacking :)"
	fi
else
	echo "[-] setup.py is not found in the system or this script is not in the correct path"
	echo ""
	read -p "Want to install Volatility from scratch? (Y/n) " volaInstallationResponse
	if [ $volaInstallationResponse = "Y" ]
	then
		sudo git clone https://github.com/volatilityfoundation/volatility.git
		echo ""
		echo "[i] Cloning the repository of Volatility"
		sudo sh volatilityRequiremetsInstallation.sh
	fi
fi


