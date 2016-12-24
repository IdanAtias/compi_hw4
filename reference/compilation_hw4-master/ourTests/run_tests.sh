#!/bin/bash

echo "Compiling..."

make

echo "Compling Done!"

echo "===================Do dos2unix===================="
dos2unix tests/*.*
echo "===================Do dos2unix===================="


echo "Running tests"

function run_test {
    for ((i=1;i<=$2;i++)); do
        ./ex4.exe < "tests/$1_$i.in" > "tests/$1_$i.temp"
        result=`diff "tests/$1_$i.out" "tests/$1_$i.temp"`
        if [ -n "$result" ]; then
                echo "Test $1_$i: failed"
        else
                echo "Test $1_$i: passed"
        fi
    done

    rm -f tests/*.temp
}


run_test matrixScalarTest 1

run_test matrixTest 1

run_test scalarTest 1

echo "Done testing"
