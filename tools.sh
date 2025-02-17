#!/bin/bash

DEF='\033[0;39m'       #  ${DEF}
DGRAY='\033[1;30m'     #  ${DGRAY}
LRED='\033[1;31m'      #  ${LRED}
LGREEN='\033[1;32m'    #  ${LGREEN}
LYELLOW='\033[1;33m'   #  ${LYELLOW}
LBLUE='\033[1;34m'     #  ${LBLUE}
LMAGENTA='\033[1;35m'  #  ${LMAGENTA}
LCYAN='\033[1;36m'     #  ${LCYAN}
WHITE='\033[1;37m'     #  ${WHITE}

set -o pipefail

echo -ne "\n"
echo -ne "\n${LGREEN}===========================!!!====================================================="
echo -ne "\n"

# SYSTEM INFO

kern=$(uname -s)
case "${kern}" in
	        Linux)
                if [ -f /etc/redhat-release ]; then
                        RELEASE=$(sed -n 's/^\([A-Za-z]*\)[^0-9]*\([0-9]*\).*/\1 \2/p' /etc/redhat-release)
                elif [ -f /etc/centos-release ]; then
                        RELEASE=$(sed -n 's/^\([A-Za-z]*\)[^0-9]*\([0-9]*\).*/\1 \2/p' /etc/centos-release)
                elif [ -f /etc/oracle-release ]; then
                        RELEASE=$(sed -n 's/^\([A-Za-z]*\)[^0-9]*\([0-9]*\).*/\1 \2/p' /etc/oracle-release)
	              elif [ -f /etc/rocky-release ]; then
                        RELEASE=$(sed -n 's/^\([A-Za-z]*\)[^0-9]*\([0-9]*\).*/\1 \2/p' /etc/rocky-release)
                elif [ -f /etc/system-release ]; then
                        RELEASE=$(sed -n 's/^\([A-Za-z]*\)[^0-9]*\([0-9]*\).*/\1 \2/p' /etc/system-release)
                elif [ "lsb_release -d" ]; then
                        RELEASE=$(lsb_release -d 2> /dev/null | awk -F ':\t' '{print $2}')
                elif [ -f /etc/os-release ]; then
                        RELEASE=$((grep -w NAME /etc/os-release| awk -F= '{print $2}' && grep -w VERSION_ID /etc/os-release| awk -F= '{ print $2 }')| tr -s '\n' ' ' | tr -d \")
                fi
                ;;
        FreeBSD)
                if [ -f /etc/os-release ]; then
                        RELEASE=$((grep -w NAME /etc/os-release| awk -F= '{print $2}' && grep -w VERSION_ID /etc/os-release| awk -F= '{ print $2 }')| tr -s '\n' ' ' | tr -d \")
	              fi
                ;;
esac
