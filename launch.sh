#!/bin/bash

# Colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;35m'
BLUE='\033[0;36m'
WHITE='\033[0;37m'
BOLD='\033[1m'
RESET='\033[0;0m'

display_qr() {
	printf "${CYAN}${BOLD}\nLove 42Make?${RESET} Scan this ${BOLD}QRCode${RESET} to star Github repository 👋\n\n";
	curl "https://raw.githubusercontent.com/aabduvak/42make/master/assets/qrcode";
	printf "\nOpening github repository?[y/n]: ";
	read CONFIRM;

	if [ $CONFIRM = "y" ] || [ $CONFIRM = "Y" ]; then
		open "https://github.com/aabduvak/42Make"
	fi
}

printf "Welcome ${BOLD}${USER} 👋${RESET}\n";
printf "${CYAN}${BOLD}This script helps you create Makefile of any C/C++ type 🌼${RESET}\n";

# get input from user
printf "\nSelect ${BOLD}type${RESET} of Makefile: \n\
1. 42cursus\n\
2. custom\n\

${BLUE}>>${RESET} ";
read INPUT;

# check if project name is empty
if [ -z "$INPUT" ]; then
	printf "❗️${RED}ERROR$RESET ${YELLOW}input cannot be empty.${RESET}\n";
	exit 1;
fi

if [ $INPUT = "1" ]; then
	bash -c 'bash <(curl -s https://raw.githubusercontent.com/aabduvak/42make/master/generate.sh)'
	display_qr
elif [ $INPUT = "2" ]; then
	bash -c 'bash <(curl -s https://raw.githubusercontent.com/aabduvak/42make/master/setup.sh)'
	display_qr
else
	printf "⚠️${YELLOW} Please enter valid input...${RESET}\n";
	exit 1;
fi
exit 0;