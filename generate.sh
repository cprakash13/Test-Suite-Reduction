#!/bin/bash
cat /dev/null > test/T.in
rm bin/*
echo "Enter the size N:"
read n

for (( cnt=1;cnt < n+1;cnt++ ))
do
	a=$(( $(shuf -i 0-4294967294 -n 1) - 2147483647 ))
	b=$(( $(shuf -i 0-4294967294 -n 1) - 2147483647 ))
       	echo $a $'\t'$b >> test/T.in
done
./reduce.sh
