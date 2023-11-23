#!/usr/bin/env bash
#
# chk1char.sh
#
# Version:    1.0.2
# History:    2023-11-21, 2023-11-23
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

file2check="/etc/passwd"
if [ -n "$1" ] && [ -f "$1" ]; then
  file2check="$1"
fi

install_missed_program () {
  local wanted_program
  local is_installed=false

  if [ -z "$1" ]; then
    return 1
  fi

  wanted_program="$1"

  if ! command -v "$wanted_program" > /dev/null 2>&1; then
    printf "Das Programm '%b%b%b' wird benötigt!\n" "$WHITE_BOLD" "$wanted_program" "$COLOROFF"
    pmanager=$(command -v apt aptitude apt-get | head -n 1)
    if [ -n "$pmanager" ]; then
      if ! sudo -vn > /dev/null 2>&1; then  # Der Anwender ist kein Sudoer
        return 1
      fi
      if sudo "$pmanager" install "$wanted_program"; then
        is_installed=true
      fi
    fi
    if ! "$is_installed"; then
      printf "WARNING: You have to install '%b%b%b' for full functionality!\n" "$WHITE_BOLD" "$wanted_program" "$COLOROFF"
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
    fi
  done < "$data_file"
  echo "$answer"
}


line_with_character_description () {
  printf "${WHITE_BOLD}%b${COLOROFF}%s\n" "$1" "$(ascii "${1:0:1}" | head -n 1)"
}

install_missed_program "ascii"

lines="$(find_non_alpha_start "$file2check")"
if [ -n "$lines" ]; then
  if command -v ascii > /dev/null 2>&1; then
    printf "${YELLOW_BOLD_INTENS}%s${COLOROFF}\n\n" "Folgende Zeilen aus '$file2check' beginnen nicht mit einem Buchstaben:"
    while read -r line; do
      line_with_character_description "$line"
    done <<< "$lines"
  else
    printf "Folgende Zeilen aus '$file2check' beginnen nicht mit einem Buchstaben:\n\n%s\n" "$lines"
  fi
fi

exit 0
