#!/bin/bash

# Makefile generator 1.0.0

# default Makefile template
TEMPLATE="https://raw.githubusercontent.com/aabduvak/42make/master/Makefile.template"

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

printf "${CYAN}${BOLD}This script helps you create your custom Makefile 🌼${RESET}\n";

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

printf "\nEnter ${BOLD}include${RESET} directory of project: (default is ${BOLD}${FOLDER}${RESET} leave empty if wanted)\n\
${BLUE}>>${RESET} ";
read INCLUDE;

if [ -z "$INCLUDE" ]; then
	INCLUDE=$FOLDER;
fi

printf "\nEnter ${BOLD}extension${RESET} of source files: (default extension is ${BOLD}.c${RESET} leave empty if wanted)\n\
${BLUE}>>${RESET} ";
read EXTENSION;

if [ -z "$EXTENSION" ]; then
	EXTENSION=".c";
fi

#printf "\nEnter ${BOLD}author${RESET} of project: (default user is ${BOLD}$USER${RESET} leave empty if wanted)\n\
#${BLUE}>>${RESET} ";
#read AUTHOR;

#if [ -z "$AUTHOR" ]; then
#	AUTHOR=$USER;
#fi

printf "\nEnter ${BOLD}compiler${RESET} of project: (default compiler is ${BOLD}gcc${RESET} leave empty if wanted)\n\
${BLUE}>>${RESET} ";
read COMPILER;

if [ -z "$COMPILER" ]; then
	COMPILER="gcc";
fi

printf "\nEnter ${BOLD}flags${RESET} of compiler: (default flags are ${BOLD}-Wall -Wextra -Werror${RESET} leave empty if wanted)\n\
${BLUE}>>${RESET} ";
read CFLAGS;

if [ -z "$CFLAGS" ]; then
	CFLAGS="-Wall -Wextra -Werror";
fi

printf "\nEnter ${BOLD}arguments${RESET} of program: (default arguments are ${BOLD}null${RESET} leave empty if wanted)\n\
${BLUE}>>${RESET} ";
read ARGS;

if [ -z "$ARGS" ]; then
	ARGS="null";
fi

printf "\nDo you want to create a Makefile with all these informations?\
 [y/n]\n\
$BLUE$BOLD>> ${RESET}name: ${BOLD}$NAME$RESET\n\
$BLUE$BOLD>> ${RESET}source directory: ${BOLD}$FOLDER$RESET\n\
$BLUE$BOLD>> ${RESET}include directory: ${BOLD}$INCLUDE$RESET\n\
$BLUE$BOLD>> ${RESET}file extension: ${BOLD}$EXTENSION$RESET\n\
$BLUE$BOLD>> ${RESET}compiler: ${BOLD}$COMPILER$RESET\n\
$BLUE$BOLD>> ${RESET}compilation flags: ${BOLD}$CFLAGS$RESET\n\
$BLUE$BOLD>> ${RESET}arguments: ${BOLD}$ARGS$RESET\n\

$BLUE$BOLD[y/n] >> $RESET";
read CREATE;

if [ -z "$CREATE" ]; then
	CREATE="y";
fi

DATE="$(date +%d\\/%m\\/%Y)"

if [ $CREATE = "y" ]; then
	curl -s $TEMPLATE | sed 's/name_template/'"$NAME"'/g' \
							| sed 's/extension_template/'"$EXTENSION"'/g' \
							| sed 's/cc_template/'"$COMPILER"'/g' \
							| sed 's/cflags_template/'"$CFLAGS"'/g' \
							| sed 's/src_template/'"$FOLDER"'/g' \
							| sed 's/inc_template/'"$INCLUDE"'/g' \
							| sed 's/date_template/'"$DATE"'/g' \
							| sed 's/args_template/'"$ARGS"'/g' \
							> Makefile;
	printf "\n${BOLD}${GREEN}[✅]Makefile created successfully...${RESET}\n";
else
	printf "[❕]Exiting...\n";
fi
exit 0;