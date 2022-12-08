#!/bin/bash

# Makefile generator 1.0.0

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

printf "${CYAN}${BOLD}This script helps you create your custom Makefile ${RESET}\n";

# get input from user
printf "\nEnter ${BOLD}name${RESET} of program: \n\
${BLUE}>>${RESET} ";
read NAME;

# check if project name is empty
if [ -z "$NAME" ]; then
	printf "❗️${RED}ERROR$RESET ${YELLOW}Executable's name cannot be empty.${RESET}\n";
	exit 1;
fi	

printf "\nEnter ${BOLD}source${RESET} directory of project: (default folder is ${BOLD}src${RESET} leave empty if wanted)\n\
${BLUE}>>${RESET} ";
read FOLDER;

if [ -z "$FOLDER" ]; then
	FOLDER="src";
fi

printf "\nEnter ${BOLD}extension${RESET} of source files: (default extension is ${BOLD}.c${RESET} leave empty if wanted)\n\
${BLUE}>>${RESET} ";
read EXTENSION;

if [ -z "$EXTENSION" ]; then
	EXTENSION=".c";
fi

printf "\nEnter ${BOLD}author${RESET} of project: (default user is ${BOLD}$USER${RESET} leave empty if wanted)\n\
${BLUE}>>${RESET} ";
read USR;

if [ -z "$USR" ]; then
	USR=$USER;
fi
