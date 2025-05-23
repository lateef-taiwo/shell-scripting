#!/bin/bash
#script to print the hypotenus of a triangle given the other two sides a, b

hypotenus(){
    # declare a and b as local variables
    local a=$1
    local b=$2
    #declare the hypotenus c as a local variable and compute it using the math function
    local c=$(echo "scale=8;sqrt($a*$a + $b*$b)" | bc -l)
    echo "the hypotenus is: $c"
}

# prompt user for input
echo "Enter the value of side a: "
read a
echo "Enter the value of side b: "
read b

hypotenus "$a" "$b"