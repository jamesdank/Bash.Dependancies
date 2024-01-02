#!/bin/bash

function banner.dependancies () {
    declare -A array=(
    ["figlet"]="/usr/bin/figlet"
    ["lolcat"]="/usr/games/lolcat")

    for i in "${!array[@]}"
    do
        command -v ${array[$i]} > /dev/null 2>&1 || { 
        echo >&2 "This program requires $i but it's not installed. Type 'install' or 'exit' to install the software or exit the program." ;

        read -rp "Option: " menu 

            case "$menu" in 

            install)
            echo -e "\nInstalling $i...\n" ;
            sleep 2 ;

            sudo apt install "$i" -y ;
            sleep 2 ;

            clear ;

            echo -e "\n$i installed, program will restart...\n" ;
            sleep 2 ;

            #change 
            banner.dependancies ;;

            exit)
            clear ;
            exit ;; 

            *) 
            echo -e "${red}Wrong option${nc}" ;;
            esac
            }
    done
}

banner.dependancies
