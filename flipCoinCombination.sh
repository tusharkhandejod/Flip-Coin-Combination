#!/usr/local/bin/bash
echo "Welcome to the Flip Coin Combination program"
echo "This problem displays winning percentage of Head & Tail Combination in a Singlet & Doublet"

declare -A singlet
declare -A singletrecord
declare -A doublet
declare -A doubletrecord
read -p "Enter number of times u want to Flip the coin= " n
for (( i=1; i<=n; i++ ))
do
tossedcoin=$((RANDOM%2))
if (( $tossedcoin == 1 ))
then
echo "Head Appeared"
singlet[$i]='Head'
elif (( $tossedcoin == 0 ))
then
echo "Tail Appeared"
singlet[$i]='Tail'
fi
done

for j in ${!singlet[@]} 
do
if [[ ${singlet[$j]}:u == "Head:u" ]]
then
((head++))
elif [[ ${singlet[$j]}:u == "Tail:u" ]]
then
((tail++))
fi
done
perHead=$(awk "BEGIN{ print ( $head / $n ) * 100}")
perTail=$(awk "BEGIN{ print ( $tail / $n ) * 100}")
singletrecord[H]=$perHead
singletrecord[T]=$perTail

for k in ${!singletrecord[@]}
do
echo "$k =" ${singletrecord[$k]}"%"
done


echo "Flipping for Doublet"

for (( f=1; f<=n; f++ ))
do	
tossedcoin1=$((RANDOM%2))
tossedcoin2=$((RANDOM%2))
if (( $tossedcoin1 == 1 & $tossedcoin2 == 1 ))
then
echo "HH"
doublet[$f]='HH'
elif (( $tossedcoin1 == 1 & $tossedcoin2 == 0 ))
then
echo "HT"
doublet[$f]='HT'
elif (( $tossedcoin1 == 0 & $tossedcoin2 == 1 ))
then
echo "TH"
doublet[$f]='TH'
elif (($tossedcoin1 == 0 & $tossedcoin2 == 0 ))
then
echo "TT"
doublet[$f]='TT'
fi
done
HHcount=0
HTcount=0
THcount=0
TTcount=0
for k in ${!doublet[@]}
do
if [[ ${doublet[$k]}:u == "HH:u" ]]
then
((HHcount++))
elif [[ ${doublet[$k]}:u == "HT:u" ]]
then
((HTcount++))
elif [[ ${doublet[$k]}:u == "TH:u" ]]
then
((THcount++))
elif [[ ${doublet[$k]}:u == "TT:u" ]]
then
((TTcount++))
fi
done

perHH=$(awk "BEGIN{ print $HHcount / $n * 100}")
perHT=$(awk "BEGIN{ print $HTcount / $n * 100}")
perTH=$(awk "BEGIN{ print $THcount / $n * 100}")
perTT=$(awk "BEGIN{ print $TTcount / $n * 100}")

doubletrecord[HH]=$perHH
doubletrecord[HT]=$perHT
doubletrecord[TH]=$perTH
doubletrecord[TT]=$perTT

for k in ${!doubletrecord[@]}
do
echo "$k =" ${doubletrecord[$k]}"%"
done
