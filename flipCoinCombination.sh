#!/usr/local/bin/bash
echo "Welcome to the Flip Coin Combination program"
echo "This problem displays winning percentage of Head & Tail Combination in a Singlet,Doublet & Triplet"

declare -A singlet
declare -A singletrecord
declare -A doublet
declare -A doubletrecord
declare -A triplet
declare -A tripletrecord
read -p "Enter number of times u want to Flip the coin= " n
for (( i=1; i<=n; i++ ))
do
tossedcoin=$((RANDOM%2))
if (( $tossedcoin == 1 ))
then
echo "H"
singlet[$i]='Head'
elif (( $tossedcoin == 0 ))
then
echo "T"
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

echo "Winning % in singlets="

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

echo "Winning % in doublets="

for k in ${!doubletrecord[@]}
do
echo "$k =" ${doubletrecord[$k]}"%"
done

echo "Flipping for Triplet"

for (( f=1; f<=n; f++ ))
do
tossedcoin1=$((RANDOM%2))
tossedcoin2=$((RANDOM%2))
tossedcoin3=$((RANDOM%2))
if (( $tossedcoin1 == 1 & $tossedcoin2 == 1 & $tossedcoin3 == 1 ))
then
echo "HHH"
triplet[$f]='HHH'
elif (( $tossedcoin1 == 1 & $tossedcoin2 == 1 & $tossedcoin3 == 0 ))
then
echo "HHT"                
triplet[$f]='HHT'
elif (( $tossedcoin1 == 1 & $tossedcoin2 == 0 & $tossedcoin3 == 1 ))
then
echo "HTH"    
triplet[$f]='HTH'
elif (( $tossedcoin1 == 0 & $tossedcoin2 == 1 & $tossedcoin3 == 1 ))
then
echo "THH"
triplet[$f]='THH'
elif (( $tossedcoin1 == 1 & $tossedcoin2 == 0 & $tossedcoin3 == 0 ))
then
echo "HTT"
triplet[$f]='HTT'
elif (( $tossedcoin1 == 0 & $tossedcoin2 == 1 & $tossedcoin3 == 0 ))
then
echo "THT"
triplet[$f]='THT'
elif (( $tossedcoin1 == 0 & $tossedcoin2 == 0 & $tossedcoin3 == 1 ))
then
echo "TTH"
triplet[$f]='TTH'
elif (( $tossedcoin1 == 0 & $tossedcoin2 == 0 & $tossedcoin3 == 0 ))
then
echo "TTT"
triplet[$f]='TTT'
fi
done
HHHcount=0
HHTcount=0
HTHcount=0
THHcount=0
HTTcount=0
THTcount=0
TTHcount=0
TTTcount=0
for k in ${!triplet[@]}
do
if [[ ${triplet[$k]}:u == "HHH:u" ]]
then
((HHHcount++))
elif [[ ${triplet[$k]}:u == "HHT:u" ]]
then
((HHTcount++))
elif [[ ${triplet[$k]}:u == "HTH:u" ]]
then
((HTHcount++))
elif [[ ${triplet[$k]}:u == "THH:u" ]]                        
then
((THHcount++))
elif [[ ${triplet[$k]}:u == "HTT:u" ]]
then
((HTTcount++))
elif [[ ${triplet[$k]}:u == "THT:u" ]]
then
((THTcount++))
elif [[ ${triplet[$k]}:u == "TTH:u" ]]
then
((TTHcount++))
elif [[ ${triplet[$k]}:u == "TTT:u" ]]
then
((TTTcount++))
fi
done

perHHH=$(awk "BEGIN{ print $HHHcount / $n * 100}")
perHHT=$(awk "BEGIN{ print $HHTcount / $n * 100}")
perHTH=$(awk "BEGIN{ print $HTHcount / $n * 100}")
perTHH=$(awk "BEGIN{ print $THHcount / $n * 100}")
perHTT=$(awk "BEGIN{ print $HTTcount / $n * 100}")
perTHT=$(awk "BEGIN{ print $THTcount / $n * 100}")
perTTH=$(awk "BEGIN{ print $TTHcount / $n * 100}")
perTTT=$(awk "BEGIN{ print $TTTcount / $n * 100}")

tripletrecord[HHH]=$perHHH
tripletrecord[HHT]=$perHHT
tripletrecord[HTH]=$perHTH
tripletrecord[HTT]=$perTHH
tripletrecord[THH]=$perHTT
tripletrecord[THT]=$perTHT
tripletrecord[TTH]=$perTTH
tripletrecord[TTT]=$perTTT

echo "Winning % in triplets="

for k in ${!tripletrecord[@]}
do
echo "$k =" ${tripletrecord[$k]}"%"
done
