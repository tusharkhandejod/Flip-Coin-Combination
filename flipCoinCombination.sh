#!/usr/local/bin/bash
echo "Welcome to the Flip Coin Combination program"
echo "This problem is showing winning percentage of head or tail in singlet"
declare -A singlet;
head=0
tail=0
read -p "Enter No. of times you want to flip a coin :" n
for (( i=1; i<=n; i++ ))
do
tossedcoin=$(($RANDOM%2))
if [[ $tossedcoin -eq 1 ]]
then
echo "Head appeared"
singlet[$i]="Head"
elif [[ $tossedcoin -eq 0 ]]
then
echo "Tail Appeared"
singlet[$i]="Tail"
fi
done
echo ${singlet[@]}
echo ${!singlet[@]}
echo ${#singlet[@]}
for j in ${!singlet[@]}
do
if [[ ${singlet[$j]}:u == "Head:u" ]]
then
head=$(($head+1))
elif [[ ${singlet[$j]}:u == "Tail:u" ]]
then
tail=$(($tail+1))
fi
done
echo "Percentage of Tail=" $(awk "BEGIN{ print ($tail / $n ) *100 }")
echo "Percentage of Head=" $(awk "BEGIN{ print ($head / $n ) *100 }")
