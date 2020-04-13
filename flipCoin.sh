#!/bin/bash
echo Enter the number of flips
read flips
declare  -A singlet[HEAD]=0
declare -A  singlet[TAIL]=0
declare -A doublet[HH]=0
declare -A doublet[HT]=0
declare -A doublet[TH]=0
declare -A doublet[TT]=0
declare -A percentage[HH]=0
declare -A percentage[HT]=0
declare -A percentage[TH]=0
declare -A percentage[TT]=0
singlets(){
    for (( i = 0 ; i < $1 ; i++ ))  ; do
        if [[ $((RANDOM%2)) -eq '1' ]]; then
            ((singlet[HEAD]++))
        else
            ((singlet[TAIL]++))
        fi
    done
 }

doublets(){
     local previous=$((RANDOM%2))
        for (( i = 0 ; i < $1 ; i++ ))  ; do
            local present=$((RANDOM%2))
             if [[ $previous -eq '1' && $present -eq '1' ]]; then
                 ((doublet[HH]++))
            elif [[ $previous -eq '1' && $present -eq '0' ]]; then
                 ((doublet[HT]++))
            elif [[ $previous -eq '0' && $present -eq '1' ]]; then
                 ((doublet[TH]++))
             else
                ((doublet[TT]++))
        fi
        previous=$present
done
total=$1
hh=${doublet[HH]}
percentage[HH]=$(((hh * 100)/total))
ht=${doublet[HT]}
percentage[HH]=$(((ht * 100)/total))
th=${doublet[TH]}
percentage[HH]=$(((th * 100)/total))
tt=${doublet[TT]}
percentage[HH]=$(((tt * 100)/total))
 }

#Calling method to find the singlets
singlets $flips

#Calling method to find the combination of doublets
doublets $flips


 
 