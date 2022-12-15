#!/bin/bash

trap "tput reset; tput cnorm; exit" 2
clear
tput civis
lin=2
col=$(($(tput cols) / 2))
c=$((col-1))
est=$((c-2))
color=0

# star
for ((i=1; i<20; i+=2)){
tput setaf 11 cup $((lin - 1)) $c; echo "(+)"
}

# tree
for ((i=1; i<20; i+=2))
{
tput setaf 2; tput bold
    tput cup $lin $col
    for ((j=1; j<=i; j++))
    {
        echo -n "%"
    }
    let lin++
    let col--
}

# trunk and gifts
tput sgr0; tput setaf 3
    tput cup $((lin++)) $((c - 6)); echo "    | |    "

# text
tput setaf 7; tput bold
    tput cup $((lin)) $((c - 6)); echo "merry christmas!"

# decorations
k=1
while true; do
    for ((i=1; i<=35; i++)) {
        # Turn off the lights
        [ $k -gt 1 ] && {
            tput setaf 2; tput bold
            tput cup "${line[$((k-1))$i]}" "${column[$((k-1))$i]}"; echo "%"
            unset 'line[$[k-1]$i]'; unset column'[$[k-1]$i]'
        }

        li=$((RANDOM % 9 + 3))
        start=$((c-li+2))
        co=$((RANDOM % (li-2) * 2 + 2 + start))
        tput setaf $color; tput bold
        tput cup $li $co
        echo ""
        line[$k$i]=$li
        column[$k$i]=$co
        color=$(((color+3)%7))
        sh=1
    }
    k=$((k % 2 + 1))
done
