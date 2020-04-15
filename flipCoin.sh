#!/bin/bash
echo Enter the number of flips
read flips
read combination
declare -A let
declare -A sortedCombinationValues

#METHOD FOR SORTING
Sort(){
  printf '%s\n' "$@" | sort -n 
}

#METHOD FOR SINGLET
main(){
    for (( i = 0 ; i < $1 ; i++ ))  ; do
        if [[ $((RANDOM%2)) -eq '1' ]]; then
            coin[((count++))]=H
        else
            coin[((count++))]=T
        fi
    done
 }

# METHOD TO CREATE ANY NUMBER OF COMBINATIONS 
#(LIKE SINGLET DOUBLET TRIPLET OR 4 OR 5 OR EVEN MORE COMBINATIONS IF YOU WANT) 
lets(){
    f=$1
    c=$2
    for (( i = 0; i < $((f - c))  ; i++ )); do
    combi=""
        for (( j = $i ; j < $((c + i)) ; j++)); do
        combi="$combi${coin[j]}" 
        done
        (('let[$combi]++'))
        combine[((count++))]=$combi
    
    done 
    #CALLING METHOD TO SORT THE DICTIONARY WITH RESPECT TO VALUES
    sortedCombinationValues=$(Sort ${let[@]})


}

main $flips
echo ${coin[@]}
lets $flips $combination
# TO CHECK THE OUTPUT UNCOMMENT THE BELOW TWO LINES
#echo ${let[@]}
#echo ${!let[@]}
#echo ${sortedCombinationValues[@]}




