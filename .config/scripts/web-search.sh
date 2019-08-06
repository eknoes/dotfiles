#!/usr/bin/env bash

# -----------------------------------------------------------------------------
# Info:
#   author:    Miroslav Vidovic
#   file:      web-search.sh
#   created:   24.02.2017.-08:59:54
#   revision:  ---
#   version:   1.0
# -----------------------------------------------------------------------------
# Requirements:
#   rofi
# Description:
#   Use rofi to search the web.
# Usage:
#   web-search.sh
# -----------------------------------------------------------------------------
# Script:

declare -A URLS

URLS=(
  ["google"]="https://www.google.com/search?q="
  ["github"]="https://github.com/search?q="
  ["stackoverflow"]="http://stackoverflow.com/search?q="
  ["leo"]="https://dict.leo.org/englisch-deutsch/"
)

# List for rofi
gen_list() {
    for i in "${!URLS[@]}"
    do
      echo "$i"
    done
}

main() {
    echo $*;
    if [ -z "$1" ]; then
      # Pass the list to rofi
      platform=$( (gen_list) | rofi -dmenu -matching fuzzy -only-match -location 0 -p "Search > " )
    else
        platform=$1
    fi


  query=$( (echo ) | rofi  -dmenu -matching fuzzy -location 0 -p "Query $platform > " )
  if [[ -n "$query" ]]; then
    url=${URLS[$platform]}$query
    xdg-open "$url"
  else
    rofi -show -e "No query provided."
  fi
}

main $1

exit 0
