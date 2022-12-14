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
	TEMPLATE="https://raw.githubusercontent.com/aabduvak/42make/master/templates/libft.template"
	curl -s $TEMPLATE > Makefile;
	printf "\n✅ ${BOLD}${GREEN}Makefile created successfully...${RESET}\n";
	display_qr

elif [ $NAME = "2" ]; then
	TEMPLATE="https://raw.githubusercontent.com/aabduvak/42make/master/templates/lib.template"
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
	
	curl -s $TEMPLATE | sed 's/extension_template/'".c"'/g' \
				| sed 's/src_template/'"$SOURCES"'/g' \
				| sed 's/inc_template/'"$INCLUDE"'/g' \
				| sed 's/name_template/'"libftprintf.a"'/g' \
					> Makefile;
	printf "\n✅ ${GREEN}${BOLD}Makefile created successfully...${RESET}\n";
	display_qr

elif [ $NAME = "3" ]; then
	TEMPLATE="https://raw.githubusercontent.com/aabduvak/42make/master/templates/general.template"
	
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
	
	curl -s $TEMPLATE | sed 's/name_template/'"push_swap"'/g' \
							| sed 's/extension_template/'".c"'/g' \
							| sed 's/cc_template/'"gcc"'/g' \
							| sed 's/cflags_template/'"-Wall -Wextra -Werror"'/g' \
							| sed 's/src_template/'"$SOURCES"'/g' \
							| sed 's/inc_template/'"$INCLUDE"'/g' \
							> Makefile;
	printf "\n✅ ${BOLD}${GREEN}Makefile created successfully...${RESET}\n";
	display_qr

elif [ $NAME = "4" ] || [ $NAME = "5" ] || [ $NAME = "8" ]; then
	TEMPLATE="https://raw.githubusercontent.com/aabduvak/42make/master/templates/minilibx.template"
	
	if [ $NAME = "4" ]; then
		PROG="so_long";
	elif [ $NAME = "5" ]; then
		PROG="fdf";
	elif [ $NAME = "8" ]; then
		PROG="cub3D";
	fi
	
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
	
	printf "\nEnter ${BOLD}libft${RESET} directory of project: (default is ${BOLD}libft${RESET} leave empty if wanted)\n${BLUE}>>${RESET} ";
	read LIBFT;

	if [ -z "$LIBFT" ]; then
		LIBFT="libft";
	fi
	
	printf "\nEnter ${BOLD}minilibx${RESET} directory of project: (default is ${BOLD}minilibx${RESET} leave empty if wanted)\n${BLUE}>>${RESET} ";
	read MINILIBX;

	if [ -z "$MINILIBX" ]; then
		MINILIBX="minilibx";
	fi
	
	curl -s $TEMPLATE | sed 's/name_template/'"$PROG"'/g' \
							| sed 's/extension_template/'".c"'/g' \
							| sed 's/cc_template/'"gcc"'/g' \
							| sed 's/cflags_template/'"-Wall -Wextra -Werror"'/g' \
							| sed 's/src_template/'"$SOURCES"'/g' \
							| sed 's/inc_template/'"$INCLUDE"'/g' \
							| sed 's/lib_template/'"$LIBFT"'/g' \
							| sed 's/mlx_template/'"$MINILIBX"'/g' \
							> Makefile;
	printf "\n✅ ${BOLD}${GREEN}Makefile created successfully...${RESET}\n";
	display_qr

elif [ $NAME = "6" ]; then
	TEMPLATE="https://raw.githubusercontent.com/aabduvak/42make/master/templates/general.template"
	
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
	
	curl -s $TEMPLATE | sed 's/name_template/'"philo"'/g' \
							| sed 's/extension_template/'".c"'/g' \
							| sed 's/cc_template/'"gcc"'/g' \
							| sed 's/cflags_template/'"-Wall -Wextra -Werror -pthread"'/g' \
							| sed 's/src_template/'"$SOURCES"'/g' \
							| sed 's/inc_template/'"$INCLUDE"'/g' \
							> Makefile;
	printf "\n✅ ${BOLD}${GREEN}Makefile created successfully...${RESET}\n";
	display_qr

elif [ $NAME = "7" ]; then
	TEMPLATE="https://raw.githubusercontent.com/aabduvak/42make/master/templates/minishell.template"
	
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
	
	printf "\nEnter ${BOLD}readline${RESET} directory of project: (default is ${BOLD}readline${RESET} leave empty if wanted)\n${BLUE}>>${RESET} ";
	read READLINE;

	if [ -z "$READLINE" ]; then
		READLINE="readline";
	fi
	
	printf "\nEnter ${BOLD}libft${RESET} directory of project: (default is ${BOLD}libft${RESET} leave empty if wanted)\n${BLUE}>>${RESET} ";
	read LIBFT;

	if [ -z "$LIBFT" ]; then
		LIBFT="libft";
	fi
	
	curl -s $TEMPLATE | sed 's/name_template/'"minishell"'/g' \
							| sed 's/extension_template/'".c"'/g' \
							| sed 's/cc_template/'"gcc"'/g' \
							| sed 's/cflags_template/'"-Wall -Wextra -Werror"'/g' \
							| sed 's/src_template/'"$SOURCES"'/g' \
							| sed 's/inc_template/'"$INCLUDE"'/g' \
							| sed 's/lib_template/'"$LIBFT"'/g' \
							| sed 's/rdl_template/'"$READLINE"'/g' \
							> Makefile;
	printf "\n✅ ${BOLD}${GREEN}Makefile created successfully...${RESET}\n";
	display_qr

elif [ $NAME = "9" ]; then
	TEMPLATE="https://raw.githubusercontent.com/aabduvak/42make/master/templates/general.template"
	
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
	
	curl -s $TEMPLATE | sed 's/name_template/'"main"'/g' \
							| sed 's/extension_template/'".cpp"'/g' \
							| sed 's/cc_template/'"c++"'/g' \
							| sed 's/cflags_template/'"-Wall -Wextra -Werror -std=c++98"'/g' \
							| sed 's/src_template/'"$SOURCES"'/g' \
							| sed 's/inc_template/'"$INCLUDE"'/g' \
							> Makefile;
	printf "\n✅ ${BOLD}${GREEN}Makefile created successfully...${RESET}\n";
	display_qr

else
	printf "⚠️${YELLOW} Exiting...${RESET}\n";
fi