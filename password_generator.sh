#! /bin/bash

#This script generates password

#colors
red='\033[0;31m'
green='\033[0;32m'
nc='\033[0m'

generate_password() {
	character="A-Za-z0-9"
	password=$(head /dev/urandom | tr -dc "$character" | head -c "$1")
	echo "$password"
}
while true; do

	read -p "How much long password you need (Enter positive interger): " password_length

	if [[ $password_length =~ ^[0-9]+$ ]]; then
		generated_password=$(generate_password "$password_length")
		echo -e "${green}Generated Password: $generated_password${nc}"
		exit 0
	else
		echo -e "${red}Enter a valid integer${nc}"
	fi

done
