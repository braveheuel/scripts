#! /bin/sh
# Average CPU Temperature 
out=$(sensors "coretemp-isa-*")

temp_0=$(echo "$out" | grep 'Core 0' | awk '{printf $3}' | cut -c1-3)
temp_1=$(echo "$out" | grep 'Core 1' | awk '{printf $3}' | cut -c1-3)
temp_2=$(echo "$out" | grep 'Core 2' | awk '{printf $3}' | cut -c1-3)
temp_3=$(echo "$out" | grep 'Core 3' | awk '{printf $3}' | cut -c1-3)

# Duo core
echo $temp_0 $temp_1 | awk '{printf sprintf(int($1/2 + $2/2))}'

# N cores
#echo $temp_0 $temp_1 $temp_2 $temp_3 | awk '{printf sprintf(int(($1+$2+$3+$4)/4))}'

