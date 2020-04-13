#!/bin/bash
 echo Enter the number of flips
 read flips
 declare  -A singlet[HEAD]=0
 declare -A  singlet[TAIL]=0

 singlets(){
for (( i = 0 ; i < $1 ; i++ ))  ; do
        if [[ $((RANDOM%2)) -eq '1' ]]; then
            ((singlet[HEAD]++))
        else
            ((singlet[TAIL]++))
        fi
done
 }

 singlets $flips



