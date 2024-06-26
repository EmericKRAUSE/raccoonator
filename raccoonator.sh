#!/bin/bash

green="\e[32m"
red="\e[31m"
yellow="\e[33m"
cyan="\e[36m"
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
	echo -e "\tError handling: $green[OK]$reset"
elif [ "$error_check" == 1 ]; then
	echo -e "\tError handling: $red[KO]$reset"
else
	echo -e "\tError handling: $yellow[ERROR]$reset"
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
	echo -e "\tTest with sorted numbers:  $green[OK]$reset"
elif [ "$sorted_check" == 1 ]; then
	echo -e "\tTest with sorted numbers:  $red[KO]$reset"
else
	echo -e "\tTest with sorted numbers:  $yellow[ERROR]$reset"
fi

#########
#
# TEST 3

cd raccoonator

if [ "$(../push_swap 2 1 0 | wc -l)" -lt 4 ] && 
[ $(../push_swap 2 1 0 | ./checker 2 1 0) == "OK" ]; then
	echo -e "\tTest with 3 given values:  $green[OK]$reset"
elif [ "$(../push_swap 2 1 0 | wc -l)" -gt 3 ] || 
[ $(../push_swap 2 1 0 | ./checker 2 1 0) == "KO" ]; then
	echo -e "\tTest with 3 given values:  $red[KO]$reset"
else
	echo -e "\tTest with 3 given values:  $yellow[ERROR]$reset"
fi

#########
#
# TEST 4

min=-100000
max=100000
declare three_numbers

while [ $(echo "$three_numbers" | wc -w) != 3 ]; do
	three_numbers=$(seq $min 1 $max | shuf -n 3 | uniq | tr '\n' ' ')
done

if [ "$(../push_swap $three_numbers | wc -l)" -lt 4 ] && 
[ $(../push_swap $three_numbers | ./checker $three_numbers) == "OK" ]; then
	echo -e "\tTest with 3 random values: $green[OK]$reset"
elif [ "$(../push_swap $three_numbers | wc -l)" -gt 3 ] || 
[ $(../push_swap $three_numbers | ./checker $three_numbers) == "KO" ]; then
	echo -e "\tTest with 3 random values: $red[KO]$reset"
else
	echo -e "\tTest with 3 random values: $yellow[ERROR]$reset"
fi

#########
#
# TEST 5

if [ "$(../push_swap 1 5 2 4 3 | wc -l)" -lt 13 ] && 
[ $(../push_swap 1 5 2 4 3 | ./checker 1 5 2 4 3) == "OK" ]; then
	echo -e "\tTest with 5 given values:  $green[OK]$reset"
elif [ "$(../push_swap 1 5 2 4 3 | wc -l)" -gt 12 ] || 
[ $(../push_swap 1 5 2 4 3 | ./checker 1 5 2 4 3) == "KO" ]; then
	echo -e "\tTest with 5 given values:  $red[KO]$reset"
else
	echo -e "\tTest with 5 given values:  $yellow[ERROR]$reset"
fi

#########
#
# TEST 6

declare five_numbers

while [ $(echo "$five_numbers" | wc -w) != 5 ]; do
	five_numbers=$(seq $min 1 $max | shuf -n 5 | uniq | tr '\n' ' ')
done

if [ "$(../push_swap $five_numbers | wc -l)" -lt 12 ] && 
[ $(../push_swap $five_numbers | ./checker $five_numbers) == "OK" ]; then
	echo -e "\tTest with 5 random values: $green[OK]$reset"
elif [ "$(../push_swap $five_numbers | wc -l)" -gt 11 ] || 
[ $(../push_swap $five_numbers | ./checker $five_numbers) == "KO" ]; then
	echo -e "\tTest with 5 random values: $red[KO]$reset"
else
	echo -e "\tTest with 5 random values: $yellow[ERROR]$reset"
fi

#########
#
# Push_swap - Middle version (100 random numbers)

declare one_hundred_numbers

while [ $(echo "$one_hundred_numbers" | wc -w) != 100 ]; do
	one_hundred_numbers=$(seq $min 1 $max | shuf -n 100 | uniq | tr '\n' ' ')
done

echo -e "\n\tPush_swap - Middle version (100 random numbers)\n"

if [ "$(../push_swap $one_hundred_numbers | wc -l)" -lt 1500 ] && 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 1500: $green[OK]$reset"
elif [ "$(../push_swap $one_hundred_numbers | wc -l)" -gt 1499 ] || 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 1500: $red[KO]$reset"
else
	echo -e "\tLess than 1500: $yellow[ERROR]$reset"
fi

if [ "$(../push_swap $one_hundred_numbers | wc -l)" -lt 1300 ] && 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 1300: $green[OK]$reset"
elif [ "$(../push_swap $one_hundred_numbers | wc -l)" -gt 1299 ] || 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 1300: $red[KO]$reset"
else
	echo -e "\tLess than 1300: $yellow[ERROR]$reset"
fi

if [ "$(../push_swap $one_hundred_numbers | wc -l)" -lt 1100 ] && 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 1100: $green[OK]$reset"
elif [ "$(../push_swap $one_hundred_numbers | wc -l)" -gt 1099 ] || 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 1100: $red[KO]$reset"
else
	echo -e "\tLess than 1100: $yellow[ERROR]$reset"
fi

if [ "$(../push_swap $one_hundred_numbers | wc -l)" -lt 900 ] && 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 900:  $green[OK]$reset"
elif [ "$(../push_swap $one_hundred_numbers | wc -l)" -gt 899 ] || 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 900:  $red[KO]$reset"
else
	echo -e "\tLess than 900:  $yellow[ERROR]$reset"
fi

if [ "$(../push_swap $one_hundred_numbers | wc -l)" -lt 700 ] && 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 700:  $green[OK]$reset"
elif [ "$(../push_swap $one_hundred_numbers | wc -l)" -gt 699 ] || 
[ $(../push_swap $one_hundred_numbers | ./checker $one_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 700:  $red[KO]$reset"
else
	echo -e "\tLess than 700:  $yellow[ERROR]$reset"
fi

#########
#
# Push_swap - Advanced version (500 random numbers)

declare five_hundred_numbers

while [ $(echo "$five_hundred_numbers" | wc -w) != 500 ]; do
	five_hundred_numbers=$(seq $min 1 $max | shuf -n 500 | uniq | tr '\n ' ' ')
done

echo -e "\n\tPush_swap - Advanced version (500 random numbers)\n"

if [ "$(../push_swap $five_hundred_numbers | wc -l)" -lt 11500 ] && 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 11500: $green[OK]$reset"
elif [ "$(../push_swap $five_hundred_numbers | wc -l)" -gt 11499 ] || 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 11500: $red[KO]$reset"
else
	echo -e "\tLess than 11500: $yellow[ERROR]$reset"
fi

if [ "$(../push_swap $five_hundred_numbers | wc -l)" -lt 10000 ] && 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 10000: $green[OK]$reset"
elif [ "$(../push_swap $five_hundred_numbers | wc -l)" -gt 9999 ] || 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 10000: $red[KO]$reset"
else
	echo -e "\tLess than 10000: $yellow[ERROR]$reset"
fi

if [ "$(../push_swap $five_hundred_numbers | wc -l)" -lt 8500 ] && 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 8500:  $green[OK]$reset"
elif [ "$(../push_swap $five_hundred_numbers | wc -l)" -gt 8499 ] || 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 8500:  $red[KO]$reset"
else
	echo -e "\tLess than 8500:  $yellow[ERROR]$reset"
fi

if [ "$(../push_swap $five_hundred_numbers | wc -l)" -lt 7000 ] && 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 7000:  $green[OK]$reset"
elif [ "$(../push_swap $five_hundred_numbers | wc -l)" -gt 6999 ] || 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 7000:  $red[KO]$reset"
else
	echo -e "\tLess than 7000:  $yellow[ERROR]$reset"
fi

if [ "$(../push_swap $five_hundred_numbers | wc -l)" -lt 5500 ] && 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "OK" ]; then
	echo -e "\tLess than 5500:  $green[OK]$reset"
elif [ "$(../push_swap $five_hundred_numbers | wc -l)" -gt 5499 ] || 
[ $(../push_swap $five_hundred_numbers | ./checker $five_hundred_numbers) == "KO" ]; then
	echo -e "\tLess than 5500:  $red[KO]$reset"
else
	echo -e "\tLess than 5500:  $yellow[ERROR]$reset"
fi

#########
#
# Additional tests

echo -e "\n\tAdditional tests\n"

if [ $(../push_swap 0 -0 1) == "Error" ]; then
	echo -e "\tZero & minus zero: $green[OK]$reset"
else
	echo -e "\tZero & minus zero: $red[KO]$reset"
fi

if [ $(../push_swap 9 8 2 2147483647 | ./checker 9 8 2 2147483647 == "OK")  ]; then
	echo -e "\tMax int: $green[OK]$reset"
else
	echo -e "\tMax int: $red[KO]$reset"
fi

if [ $(../push_swap 9 8 2 -2147483648 | ./checker 9 8 2 -2147483648 == "OK")  ]; then
	echo -e "\tMin int: $green[OK]$reset"
else
	echo -e "\tMin int: $red[KO]$reset"
fi


#########
#
# Summary

echo -e "\n${cyan}The list of 3 numbers that have been used used:${reset}\n\n$three_numbers
\n${cyan}The list of 5 numbers that have been used used:${reset}\n\n$five_numbers
\n${cyan}The list of 100 numbers that have been used used:${reset}\n\n$one_hundred_numbers
\n${cyan}The list of 500 numbers that have been used used:${reset}\n\n$five_hundred_numbers" >> numbers.txt

echo -e "\n\tto see the numbers that have been used: ${cyan}cat numbers.txt${reset}\n"