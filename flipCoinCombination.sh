#!/bin/bash
echo "Welcome to the Flip Coin Combination program"
tossedcoin=$(($RANDOM%2))
if [[ $tossedcoin -eq 1 ]]
then
echo "Head appeared"
elif [[ $tossedcoin -eq 0 ]]
then
echo "Tail appeared"
fi
