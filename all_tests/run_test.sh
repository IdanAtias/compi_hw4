for in in `ls our_tests/*.test`
do
	./../hw4 < $in > ${in}.userOut;
	echo -e "\e[37m checking $in "
    diff ${in}.out  ${in}.userOut > diff.txt
	if [ -s diff.txt ]
	then
	   echo  -e "\e[31mFAILED!\e[31m"
	else
       echo  -e "\e[32mSUCCESS!\e[32m"
	fi
done

echo -e "\e[37m"
