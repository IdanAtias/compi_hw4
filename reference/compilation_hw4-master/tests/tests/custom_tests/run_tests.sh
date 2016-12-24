#!/bin/bash




echo "Running example tests:"
for i in `ls examples/ | grep -iP 'example_\d+.in' | sort -n -t_ -k2 | cut -d. -f1`; do
    echo -n "Running $i ... "
    if  ../../ex4.exe < examples/$i.in | diff - examples/$i.out > /dev/null; then
        echo "PASSED"
    else
        echo "FAILED:"
        ../..//ex4.exe < examples/$i.in | diff -y - examples/$i.out
    fi
done

echo ""
echo "Running our tests:"
for i in `ls tests/ | grep -iP 'test_\d+.in' | sort -n -t_ -k2 | cut -d. -f1`; do
    echo -n "Running $i ... "
    if ../../ex4.exe < tests/$i.in | diff - tests/$i.out > /dev/null; then
        echo "PASSED"
    else
        echo "FAILED:"
       ../../ex4.exe < tests/$i.in | diff -y - tests/$i.out
    fi
done
