#!/bin/bash
echo Enter the number of flips
read flips
declare  -A singlet=(['HEAD']=0 ['TAIL']=0 )
declare -A doublet=( ["HH"]=0 ["TH"]=0 ["TH"]=0 ["TT"]=0 )
declare -A doubletpercentage=( ["HH"]=0 ["TH"]=0 ["TH"]=0 ["TT"]=0 )
declare -A triplet=( ["HHH"]=0 ["HHT"]=0 ["HTH"]=0 ["THH"]=0 \
          ["HTT"]=0 ["TTT"]=0 ["TTH"]=0 ["THT"]=0 )
declare -A tripletpercentage=( ["HHH"]=0 ["HHT"]=0 ["HTH"]=0 ["THH"]=0 \
          ["HTT"]=0 ["TTT"]=0 ["TTH"]=0 ["THT"]=0 )
declare MAXTRIPLET=0
declare MAXDOUBLET=0

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
    total=$1
     local previous=$((RANDOM%2))
        for (( i = 0 ; i < $((total -1)) ; i++ ))  ; do
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
total=$((total + 1))
hh=${doublet[HH]}
doubletpercentage[HH]=$(((hh * 100)/total))
ht=${doublet[HT]}
doubletpercentage[HT]=$(((ht * 100)/total))
th=${doublet[TH]}
doubletpercentage[TH]=$(((th * 100)/total))
tt=${doublet[TT]}
doubletpercentage[TT]=$(((tt * 100)/total))

max=0
for i in ${!doublet[@]}; do

    if [[ $max -le ${doublet[$i]} ]]; then
         max=${doublet[$i]} 
         MAXDOUBLET=$i
    fi
done
 }

 triplets(){
     total=$1
     local previous2=$((RANDOM%2))
     local previous1=$((RANDOM%2))
       for (( i = 0 ; i < $1 ; i++ )); do
            local present=$((RANDOM%2))
             if [[ $previous2 -eq '1' && $previous1 -eq '1' && $present -eq '1' ]]; then
                 ((triplet[HHH]++))
            elif [[ $previous2 -eq '1' && $previous1 -eq '1' && $present -eq '0' ]]; then
                 ((triplet[HHT]++))
            elif [[ $previous2 -eq '1' && $previous1 -eq '0' && $present -eq '1' ]]; then
                 ((triplet[HTH]++))
            elif [[ $previous2 -eq '0' && $previous1 -eq '1' && $present -eq '1' ]]; then
                 ((triplet[THH]++))
            elif [[ $previous2 -eq '1' && $previous1 -eq '0' && $present -eq '0' ]]; then
                 ((triplet[HTT]++))
            elif [[ $previous2 -eq '0' && $previous1 -eq '1' && $present -eq '0' ]]; then
                 ((triplet[THT]++))
            elif [[ $previous2 -eq '0' && $previous1 -eq '0' && $present -eq '1' ]]; then
                 ((triplet[TTH]++))
            elif [[ $previous2 -eq '0' && $previous1 -eq '0' && $present -eq '0' ]]; then
                ((triplet[TTT]++))
        fi
        echo $previous2 $previous1 $present 
        previous2=$previous1
        previous1=$present
        done
total=$((total + 2))
hhh=${triplet[HHH]}
tripletpercentage[HHH]=$(((hhh * 100)/total))
hht=${triplet[HHT]}
tripletpercentage[HHT]=$(((hht * 100)/total))
thh=${triplet[THH]}
tripletpercentage[THH]=$(((thh * 100)/total))
hth=${triplet[HTH]}
tripletpercentage[HTH]=$(((hth * 100)/total))
tth=${triplet[TTH]}
tripletpercentage[TTH]=$(((tth * 100)/total))
htt=${triplet[HTT]}
tripletpercentage[HTT]=$(((htt * 100)/total))
tht=${triplet[THT]}
tripletpercentage[THT]=$(((tht * 100)/total))
ttt=${triplet[TTT]}
tripletpercentage[TTT]=$(((ttt * 100)/total))
max=0
for i in ${!triplet[@]}; do

    if [[ $max < ${triplet[$i]} ]]; then
         max=${triplet[$i]} 
         MAXTRIPLET=$i
    fi
done
 }
 echo $MAX1

#Calling method to find the singlets
singlets $flips

#Calling method to find the combination of doublets
doublets $((flips - 1))

#calling method to find the combination of triplets
triplets $((flips - 2 ))






 
 