#!/bin/bash

make clean
make
if [[ ! -d tst_res ]]; then
	mkdir tst_res
fi
test_dirs=("all_tests/tests" "all_tests/my_tests" "all_tests/ts" "all_tests/our_tests")
for d in ${test_dirs[@]}; do
	echo "### current tests dir: $d ### "
	for f in `ls $d | grep in`; do
		echo "running $d/$f"
		./hw4 $d/$f > tst_res/out
		f_name=`echo $f | cut -d"." -f1`
		f_out=${d}/${f_name}.out
		diff out $f_out > tst_res/diff
		if [[ `cat diff` != "" ]]; then
			echo "test $f FAILED"
			echo " ### test is: ### "
			cat $f
			echo ""
			echo " ### expected out: ### "
			cat $f_out
			echo ""
			echo " ### real out: ### "
			cat tst_res/out
			echo ""
			echo " ### diff is: ### "
			cat tst_res/diff
			echo ""
			exit 1
		fi
		echo "test $f PASSED"
	done
	echo " ### test in dir $d PASSED !! ### "
	echo -e "\n\n"
done
