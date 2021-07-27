

#PROGRAM 1

input=$1
index=0
inputArray=( );
#READ INPUT FILE AND SAVE THE DIGITS TO ARRAY.
while IFS= read -r line
do
[[ $line ]] || break  # break if line is empty
#Input numbers are stored in inputArray
inputArray+=("$line")
done < "$input"


#ERROR CHECK : Control the whether input numbers are invalid.
for i in "${inputArray[@]}"
do

     if [[ $i -le -1  || $i -ge 10 ]]
     then
	echo "The inputs are invalid.Try again."
	exit 0
     fi
done


#Find length of the array
len=${#inputArray[@]}

#ERROR CHECK : If the array is null,it means there are no inputs.It gives a error.
      if [ $len -eq 0 ]
      then
	echo "The input file is null.Try again"
	exit 0
      fi


#Generate new array.
baseArray=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9");


indexCount=0
count=0

for((i=0; i<10; i++)) #outer loop
do
echo -ne "${baseArray[$i]} "
   for((j=0 ; j<$len ; j++)) #inner loop
   do
    if [ ${baseArray[$i]} -eq ${inputArray[$j]} ]
    then
     echo -ne "*"
    fi
   done
  echo ""
done

