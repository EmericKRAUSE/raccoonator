#!/bin/bash

green="\e[32m"
red="\e[31m"
reset="\e[0m"

make re
cd ..
make re
clear

echo -e "\n
\t██████╗  █████╗  ██████╗ ██████╗ ██████╗  ██████╗ ███╗   ██╗ █████╗ ████████╗ ██████╗ ██████╗ 
\t██╔══██╗██╔══██╗██╔════╝██╔════╝██╔═══██╗██╔═══██╗████╗  ██║██╔══██╗╚══██╔══╝██╔═══██╗██╔══██╗
\t██████╔╝███████║██║     ██║     ██║   ██║██║   ██║██╔██╗ ██║███████║   ██║   ██║   ██║██████╔╝
\t██╔══██╗██╔══██║██║     ██║     ██║   ██║██║   ██║██║╚██╗██║██╔══██║   ██║   ██║   ██║██╔══██╗
\t██║  ██║██║  ██║╚██████╗╚██████╗╚██████╔╝╚██████╔╝██║ ╚████║██║  ██║   ██║   ╚██████╔╝██║  ██║
\t╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═══╝╚═╝  ╚═╝   ╚═╝    ╚═════╝ ╚═╝  ╚═╝
\n"

if ! [ -e ./push_swap ]; then
    echo "Le fichier ./push_swap n'existe pas."
    exit 1
fi

if ! [ -f ./push_swap ]; then
    echo "Le fichier ./push_swap n'est pas un fichier régulier."
    exit 1
fi

if ! [ -x ./push_swap ]; then
    echo "Le fichier ./push_swap n'est pas exécutable."
    exit 1
fi

#########
#
# NORM

norm_check=$(norminette | awk -F ': ' '{if ($2 == "OK!") {norm[NR]=0} else {norm[NR]=1}} 
END {for (i=1; i<=NR; i++) {total+=norm[i]}; printf "%d", total}')

if [ "$norm_check" -eq 0 ]; then
	echo -e "\tNorm:   $green[OK]$reset"
elif [ "$norm_check" -gt 0 ]; then
	echo -e "\tNorm:   $red[KO]$reset"
else
	echo -e "\tError\n"
fi

#########
#
# TEST 1

error_check=0

if [ "$(./push_swap "Hello World")" != "Error" ]; then
	error_check=1
elif [ "$(./push_swap Hello World)" != "Error" ]; then
	error_check=1
elif [ "$(./push_swap "0 2 1 7 9 5 4 2")" != "Error" ]; then
	error_check=1
elif [ "$(./push_swap 0 2 1 7 9 5 4 2)" != "Error" ]; then
	error_check=1
elif [ "$(./push_swap "0 2 1 7 9 5 4 2147483648")" != "Error" ]; then
	error_check=1
elif [ "$(./push_swap 0 2 1 7 9 5 4 2147483648)" != "Error" ]; then
	error_check=1
elif [ "$(./push_swap "0 2 1 7 9 5 4 -2147483649")" != "Error" ]; then
	error_check=1
elif [ "$(./push_swap 0 2 1 7 9 5 4 -2147483649)" != "Error" ]; then
	error_check=1
elif [ "$(./push_swap "")" != "" ]; then
	error_check=1
elif [ "$(./push_swap)" != "" ]; then
	error_check=1
fi

if [ "$error_check" == 0 ]; then
	echo -e "\tTest 1: $green[OK]$reset"
elif [ "$error_check" == 1 ]; then
	echo -e "\tTest 1: $red[KO]$reset"
fi

#########
#
# TEST 2

sorted_check=0

if [ "$(./push_swap 42)" != "" ]; then
	sorted_check=1
elif [ "$(./push_swap 2 3)" != "" ]; then
	sorted_check=1
elif [ "$(./push_swap 0 1 2 3)" != "" ]; then
	sorted_check=1
elif [ "$(./push_swap 0 1 2 3 4 5 6 7 8 9)" != "" ]; then
	sorted_check=1
elif [ "$(./push_swap 8 12 14 17 24 94 128 247)" != "" ]; then
	sorted_check=1
fi

if [ "$sorted_check" == 0 ]; then
	echo -e "\tTest 2: $green[OK]$reset"
elif [ "$sorted_check" == 1 ]; then
	echo -e "\tTest 2: $red[KO]$reset"
fi

#########
#
# TEST 3

cd raccoonator

if [ "$(../push_swap 2 1 0 | wc -l)" -lt 4 ] && 
[ $(../push_swap 2 1 0 | ./checker 2 1 0) == "OK" ]; then
	echo -e "\tTest 3: $green[OK]$reset"
elif [ "$(../push_swap 2 1 0 | wc -l)" -gt 4 ] || 
[ $(../push_swap 2 1 0 | ./checker 2 1 0) == "KO" ]; then
	echo -e "\tTest 3: $red[KO]$reset"
fi

#########
#
# TEST 4

if [ "$(../push_swap 123 456 -58 | wc -l)" -lt 4 ] && 
[ $(../push_swap 123 456 -58 | ./checker 123 456 -58) == "OK" ]; then
	echo -e "\tTest 4: $green[OK]$reset"
elif [ "$(../push_swap 123 456 -58 | wc -l)" -gt 4 ] || 
[ $(../push_swap 123 456 -58 | ./checker 123 456 -58) == "KO" ]; then
	echo -e "\tTest 4: $red[KO]$reset"
fi

#########
#
# TEST 5

if [ "$(../push_swap 1 5 2 4 3 | wc -l)" -lt 12 ] && 
[ $(../push_swap 1 5 2 4 3 | ./checker 1 5 2 4 3) == "OK" ]; then
	echo -e "\tTest 5: $green[OK]$reset"
elif [ "$(../push_swap 1 5 2 4 3 | wc -l)" -gt 4 ] || 
[ $(../push_swap 1 5 2 4 3 | ./checker 1 5 2 4 3) == "KO" ]; then
	echo -e "\tTest 5: $red[KO]$reset"
fi

#########
#
# TEST 6

if [ "$(../push_swap 89 -63 21 97 17 | wc -l)" -lt 12 ] && 
[ $(../push_swap 89 -63 21 97 17 | ./checker 89 -63 21 97 17) == "OK" ]; then
	echo -e "\tTest 6: $green[OK]$reset"
elif [ "$(../push_swap 89 -63 21 97 17 | wc -l)" -gt 4 ] || 
[ $(../push_swap 89 -63 21 97 17 | ./checker 89 -63 21 97 17) == "KO" ]; then
	echo -e "\tTest 6: $red[KO]$reset"
fi