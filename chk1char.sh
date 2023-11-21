#!/usr/bin/env bash
#
# chk1char.sh
#
# Version:    1.0.0
# History:    2023-11-21
#
# Project Description:
#
# List all accounts from '/etc/passwd' whose account name does not begin with a letter.
#
# Author:     Bernd Storck
# Contact:    https://www.facebook.com/BStLinux/
#
# Copyright:  2023, Bernd Storck
# License:    GNU General Public License 3.0

readonly WHITE='\e[0;37m'
readonly WHITE_BOLD='\e[1;37m'
readonly YELLOW_BOLD_INTENS='\e[1;93m'
readonly COLOROFF='\e[0m'

install_missed_program () {
  local wanted_program
  local is_installed=false
  
  if [ -z "$1" ]; then
    return 1
  fi
  
  wanted_program="$1"
  
  if ! command -v "$wanted_program" > /dev/null 2>&1; then
    printf "Das Programm '%b%b%b' wird benötigt!\n" "$WHITE_BOLD" "$wanted_program" "$COLOROFF"
    for pmanager in "apt" "aptitude" "apt_get"; do
      if command -v "$pmanager" > /dev/null 2>&1; then
        if ! sudo -vn > /dev/null 2>&1; then
          break
        fi      
        if sudo "$pmanager" install "$wanted_program"; then
          is_installed=true
        fi
        break
      fi
    done
    if ! "$is_installed"; then
      printf "WARNING: You have to install '%b%b%b' for full functionality!\n" "${WHITE_BOLD}" "$wanted_program" "${COLOROFF}"
    fi
  fi
}

find_non_alpha_start () {
  local data_file
  local answer

  [ ! "$1" ] && data_file="/etc/passwd" || data_file="$1"
  
  while IFS=: read -r accountname rest; do
    first_char="${accountname:0:1}"
    if [[ ! $first_char =~ [[:alpha:]] ]]; then
        answer+="$accountname: $rest\n"
        found=true
    fi
  done < "$data_file"
  echo "$answer"
}


line_with_character_description () {
  local answer
  printf "${WHITE_BOLD}%s\n${COLOROFF}%s\n" "$1" "$(ascii "${1:0:1}" | head -n 1)"
}

install_missed_program "ascii"

lines="$(find_non_alpha_start)"
if [ -n "$lines" ]; then
  if command -v ascii > /dev/null 2>&1; then
    printf "${YELLOW_BOLD_INTENS}%s${COLOROFF}\n\n" "Folgende Zeilen beginnen nicht mit einem Buchstaben:"
    while read -r line; do
      line_with_character_description "$line"
    done <<< "$lines"
  else
    printf "Folgende Zeilen beginnen nicht mit einem Buchstaben:\n\n%s\n" "$lines"
  fi
fi

exit 0