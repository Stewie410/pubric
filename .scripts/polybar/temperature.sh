#!/bin/bash

# Pulls CPU temps, averages them, and outputs them

let count=0
sum=0.0
for temp in $(sensors | grep "^Core" | grep -e '+.*C' | cut -f 2 -d '+' | cut -f 1 -d ' ' | sed 's/°C//'); do
	sum=$(echo $sum+$temp | bc)
	let count+=1
done
avg=$(qalc -t $sum/$count)
echo "${avg}°C"
