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
echo -e "\tA tester for the Push_swap project from 42 - By ekrause\n"

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
elif [ "$(../push_swap 1 5 2 4 3 | wc -l)" -gt 12 ] || 
[ $(../push_swap 1 5 2 4 3 | ./checker 1 5 2 4 3) == "KO" ]; then
	echo -e "\tTest 5: $red[KO]$reset"
fi

#########
#
# TEST 6

if [ "$(../push_swap 89 -63 21 97 17 | wc -l)" -lt 12 ] && 
[ $(../push_swap 89 -63 21 97 17 | ./checker 89 -63 21 97 17) == "OK" ]; then
	echo -e "\tTest 6: $green[OK]$reset"
elif [ "$(../push_swap 89 -63 21 97 17 | wc -l)" -gt 12 ] || 
[ $(../push_swap 89 -63 21 97 17 | ./checker 89 -63 21 97 17) == "KO" ]; then
	echo -e "\tTest 6: $red[KO]$reset"
fi

#########
#
# Push_swap - Middle version

min=-100000
max=100000
declare one_hundred_numbers

while [ $(echo "$one_hundred_numbers" | wc -l) != 100 ]; do
	one_hundred_numbers=$(seq $min 10 $max | shuf -n 100 | uniq)
done

echo -e "\n\tPush_swap - Middle version\n"

if [ "$(../push_swap $one_hundred_numbers | wc -l)" -lt 1500 ] && 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 1500: $green[OK]$reset"
elif [ "$(../push_swap $one_hundred_numbers | wc -l)" -gt 1500 ] || 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 1500: $red[KO]$reset"
fi

if [ "$(../push_swap $one_hundred_numbers | wc -l)" -lt 1300 ] && 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 1300: $green[OK]$reset"
elif [ "$(../push_swap $one_hundred_numbers | wc -l)" -gt 1300 ] || 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 1300: $red[KO]$reset"
fi

if [ "$(../push_swap $one_hundred_numbers | wc -l)" -lt 1100 ] && 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 1100: $green[OK]$reset"
elif [ "$(../push_swap $one_hundred_numbers | wc -l)" -gt 1100 ] || 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 1100: $red[KO]$reset"
fi

if [ "$(../push_swap $one_hundred_numbers | wc -l)" -lt 900 ] && 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 900:  $green[OK]$reset"
elif [ "$(../push_swap $one_hundred_numbers | wc -l)" -gt 900 ] || 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 900:  $red[KO]$reset"
fi

if [ "$(../push_swap $one_hundred_numbers | wc -l)" -lt 700 ] && 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 700:  $green[OK]$reset"
elif [ "$(../push_swap $one_hundred_numbers | wc -l)" -gt 700 ] || 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 700:  $red[KO]$reset"
fi

#########
#
# Push_swap - Advanced version

declare five_hundred_numbers

while [ $(echo "$five_hundred_numbers" | wc -l) != 500 ]; do
	five_hundred_numbers=$(seq $min 10 $max | shuf -n 500 | uniq)
done

echo -e "\n\tPush_swap - Advanced version\n"

if [ "$(../push_swap $five_hundred_numbers | wc -l)" -lt 11500 ] && 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 11500: $green[OK]$reset"
elif [ "$(../push_swap $five_hundred_numbers | wc -l)" -gt 11500 ] || 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 11500: $red[KO]$reset"
fi

if [ "$(../push_swap $five_hundred_numbers | wc -l)" -lt 10000 ] && 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 10000: $green[OK]$reset"
elif [ "$(../push_swap $five_hundred_numbers | wc -l)" -gt 10000 ] || 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 10000: $red[KO]$reset"
fi

if [ "$(../push_swap $five_hundred_numbers | wc -l)" -lt 8500 ] && 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 8500:  $green[OK]$reset"
elif [ "$(../push_swap $five_hundred_numbers | wc -l)" -gt 8500 ] || 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 8500:  $red[KO]$reset"
fi

if [ "$(../push_swap $five_hundred_numbers | wc -l)" -lt 7000 ] && 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 7000:  $green[OK]$reset"
elif [ "$(../push_swap $five_hundred_numbers | wc -l)" -gt 7000 ] || 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 7000:  $red[KO]$reset"
fi

if [ "$(../push_swap $five_hundred_numbers | wc -l)" -lt 5500 ] && 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 5500:  $green[OK]$reset"
elif [ "$(../push_swap $five_hundred_numbers | wc -l)" -gt 5500 ] || 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 5500:  $red[KO]$reset"
fi

#########
#
# Summary

read -p $'\n\tPress Enter to see the summary\n'
echo -e "\tThe list of 100 numbers used:\n$one_hundred_numbers"
echo -e "\tThe list of 500 numbers used:\n$five_hundred_numbers"