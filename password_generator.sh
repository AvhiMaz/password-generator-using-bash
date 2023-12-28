#! /bin/bash
#
#colors
red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
nc='\033[0m'

generate_password() {
	character="A-Za-z0-9"
	password=$(head /dev/urandom | tr -dc "$character" | head -c "$1")
	echo "$password"
}

read -p "How much long password you need (Enter positive interger): " password_length

if [[ $password_length =~ ^[0-9]+$ ]]; then
	generated_password=$(generate_password "$password_length")
	echo -e "${green}Generated Password: $generated_password${nc}"
else
	echo -e "${red}Enter a valid integer${nc}"
fi