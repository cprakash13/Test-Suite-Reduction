#!/bin/bash
echo "Enter only the file name:"
read file_name
echo "Enter the value K:"
read k
cat /dev/null > test/S.in
file=$file_name
ext=$(echo $file | cut -d'.' -f 2)
if [ ext == cpp ]
then
	gxx=g++
else
	gxx=gcc
fi
${gxx} -fprofile-arcs -ftest-coverage test/${file_name} -o bin/coverage
while read -r line
do
	echo "$line" | ./bin/coverage;
done < test/T.in

gcov -b -c ${file_name} | head -n 4 | tail -1 > data.txt
str=$(cat data.txt)
final_coverage=$(echo ${str:20} | cut -d'%' -f 1)
rm *.gcda

for(( cnt=0;cnt<k;cnt++ ))
do
	cat /dev/null > data.txt
	while read -r line
	do
		if [[ cnt != 0 ]]
        	then
			while read -r new_line
                	do
				echo "$new_line" | ./bin/coverage;
			done < test/S.in
		fi
		echo "$line" | ./bin/coverage;
		gcov -b -c ${file_name} | head -n 4 | tail -1 >> data.txt
		rm *.gcda
	done < test/T.in
	python3 reduce2.py
	max_c=$(cat max_cov.txt) 
	if (( $(echo "$final_coverage <= $max_c" | bc) ))
	then
		break
	fi
done
rm *.gcov *.gcno
