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
	printf "${CYAN}${BOLD}\nLove 42Make?${RESET} Scan this QRCode to star Github repository 👋\n";
	# curl "https://raw.githubusercontent.com/aabduvak/42make/master/Makefile.template";
	printf "Opening github repository?[y/n]: ";
	read CONFIRM;

	if [ $CONFIRM = "y" ]; then
		open "https://github.com/aabduvak/42Make"
	fi
}

printf "${CYAN}${BOLD}This script helps you create Makefile for 42cursus 🌼${RESET}\n";

# get input from user
printf "\nSelect ${BOLD}project${RESET} from 42cursus: \n\
1. libft\n\
2. ft_printf\n\
3. push_swap\n\
4. so_long\n\
5. fdf\n\
6. philosophers
7. minishell
8. cub3d
9. c++ modules

${BLUE}>>${RESET} ";
read NAME;

# check if project name is empty
if [ -z "$NAME" ]; then
	printf "❗️${RED}ERROR$RESET ${YELLOW}Program's name cannot be empty.${RESET}\n";
	exit 1;
fi	

if [ $NAME = "1" ]; then
	TEMPLATE="./templates/libft.template"
	cat $TEMPLATE > Makefile;
	printf "\n✅ ${BOLD}${GREEN}Makefile created successfully...${RESET}\n";
	display_qr

elif [ $NAME = "2" ]; then
	TEMPLATE="./templates/lib.template"
	printf "\nEnter ${BOLD}source${RESET} directory of project: (default folder is ${BOLD}src${RESET} leave empty if wanted)\n${BLUE}>>${RESET} ";
	read SOURCES;
	
	if [ -z "$SOURCES" ]; then
		SOURCES="src";
	fi

	printf "\nEnter ${BOLD}include${RESET} directory of project: (default is ${BOLD}${SOURCES}${RESET} leave empty if wanted)\n${BLUE}>>${RESET} ";
	read INCLUDE;

	if [ -z "$INCLUDE" ]; then
		INCLUDE=$SOURCES;
	fi
	
	cat $TEMPLATE | sed 's/extension_template/'".c"'/g' \
				| sed 's/src_template/'"$SOURCES"'/g' \
				| sed 's/inc_template/'"$INCLUDE"'/g' \
				| sed 's/name_template/'"libftprintf.a"'/g' \
					> Makefile;
	printf "\n✅ ${GREEN}${BOLD}Makefile created successfully...${RESET}\n";
	display_qr

elif [ $NAME = "3" ]; then
	TEMPLATE="./templates/general.template"
	
	printf "\nEnter ${BOLD}source${RESET} directory of project: (default folder is ${BOLD}src${RESET} leave empty if wanted)\n${BLUE}>>${RESET} ";
	read SOURCES;
	
	if [ -z "$SOURCES" ]; then
		SOURCES="src";
	fi

	printf "\nEnter ${BOLD}include${RESET} directory of project: (default is ${BOLD}${SOURCES}${RESET} leave empty if wanted)\n${BLUE}>>${RESET} ";
	read INCLUDE;

	if [ -z "$INCLUDE" ]; then
		INCLUDE=$SOURCES;
	fi
	
	cat -s $TEMPLATE | sed 's/name_template/'"push_swap"'/g' \
							| sed 's/extension_template/'".c"'/g' \
							| sed 's/cc_template/'"gcc"'/g' \
							| sed 's/cflags_template/'"-Wall -Wextra -Werror"'/g' \
							| sed 's/src_template/'"$SOURCES"'/g' \
							| sed 's/inc_template/'"$INCLUDE"'/g' \
							> Makefile;
	printf "\n✅ ${BOLD}${GREEN}Makefile created successfully...${RESET}\n";
	display_qr

else
	printf "❕${YELLOW}Exiting...${RESET}\n";
fi
exit 0;