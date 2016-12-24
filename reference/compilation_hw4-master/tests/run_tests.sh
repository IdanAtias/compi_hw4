#!/bin/bash

echo "Compiling..."

make

echo "Compling Done!"

echo "Running tests"

function run_test {
    for ((i=1;i<=$2;i++)); do
        ./ex4.exe < "tests/check_errors/$1_$i.in" > "tests/check_errors/$1_$i.temp"
        result=`diff "tests/check_errors/$1_$i.out" "tests/check_errors/$1_$i.temp"`
        if [ -n "$result" ]; then
                echo "Test $1_$i: failed"
        else
                echo "Test $1_$i: passed"
        fi
    done

    rm -f tests/check_errors/*.temp
}

function run_yuri_tests {
    for ((i=1;i<=$2;i++)); do
        ./ex4.exe < "tests/orig_tests/$1$i.in" > "tests/orig_tests/$1$i.temp"
        result=`diff "tests/orig_tests/$1$i.out" "tests/orig_tests/$1$i.temp"`
        if [ -n "$result" ]; then
                echo "Test $1$i: failed"
        else
                echo "Test $1$i: passed"
        fi
    done

    rm -f tests/orig_tests/*.temp
}

run_yuri_tests example 6

run_test ArgumentSizeMismatch 5

run_test ArgumentTypeMismatch 5

run_test ConstantExpressionExpected 4

run_test DivisionByZero 1

run_test IndexOutOfBounds 2

run_test LexicalError 2

run_test MatrixExpected 3

run_test MatrixSemanticError 4

run_test PositiveNumberExpected 4

run_test RedefinedVariable 4

run_test ScalarExpected 4

run_test UndefinedVariable 7

echo "Done testing"
