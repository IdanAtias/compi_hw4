for in in `ls my_tests/*.in`
do
	out=`echo -n ${in/.in/.out}`
	myout=`echo -n ${in/.in/.myout}`
	echo -e "\e[37m checking $in "
	./../hw4 < $in > $myout;
	diff $out $myout > diff.txt
	if [ -s diff.txt ]
	then
	   echo  -e "\e[31mFAILED!\e[31m"
	else
       echo  -e "\e[32mSUCCESS!\e[32m"
	fi
done

echo -e "\e[37m"

