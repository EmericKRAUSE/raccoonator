#!/bin/bash

green="\e[32m"
red="\e[31m"
reset="\e[0m"

cd ..
make re
clear

echo -e "\tTESTER\n"

norm_check=$(norminette | awk -F ': ' '{if ($2 == "OK!") {norm[NR]=0} else {norm[NR]=1}} 
END {for (i=1; i<=NR; i++) {total+=norm[i]}; printf "%d", total}')

if [ "$norm_check" -eq 0 ]; then
	echo -e "\tNorm:   $green[OK]$reset"
elif [ "$norm_check" -gt 0 ]; then
	echo -e "\tNorm:   $red[KO]$reset"
else
	echo -e "\tError\n"
fi

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