#Part 1:writes file with unique gender-years-experience combinations in wages.csv
#Part 2:prints info for highest and lowest earners and number of females in top ten
#Part 3:effect of graduating college on min wage 
#Usage: bash hwk6.sh wages.csv

#Part 1
cat wages.csv | grep -v "gender" | cut -d, -f 1,2 | sort -d | uniq | sort -n > step1.txt

#Part 2
#highest earner
cat wages.csv | grep -v "gender" | cut -d, -f 1,2,4 | sort -n -k 4 | tail -1

#lowest earner
cat wages.csv | grep -v "gender" | cut -d, -f 1,2,4 | sort -n -k 4 | head -1

#number of ladies in top 10
cat wages.csv | grep -v "gender" | cut -d, -f 1,2,4 | sort -n -k 4 | head -10 | grep "female" | wc -l


#Part 3
low=$(cat wages.csv | cut -d, -f 3,4 | grep -w ^1[26] | sort -k1 | cut -d, -f 2 | head -1)
high=$(cat wages.csv | cut -d, -f 3,4 | grep -w ^1[26] | sort -k1 | cut -d, -f 2 | tail -1) 
echo "$(($high - $low))"
