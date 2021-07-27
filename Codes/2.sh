
str=$1
num=$2
arr=( )
new=( )
numarr=( )
alph=(a b c d e f g h i j k l m n o p q r s t u v w x y z)
for ((i=0; i < ${#str} ; i++)){
	arr[$i]=${str:i:1}
}
for ((i=0 ; i < ${#num} ; i++)){
	numarr[$i]=${num:i:1}
}

if [[ ${#numarr[@]} == 1 ]];
then
	for ((k=0 ; k < ${#arr[@]} ; k++)){
		for (( j=0 ;j< ${#alph[@]}; j++)){
			if [[ "${arr[$k]}" = "${alph[$j]}" ]];
			then
				if [[ $(( ${numarr[0]}+${j})) > 26 ]]
				then
					new[$k]=${alph[$((${numarr[0]}+${j}-26))]}
				else
					new[$k]=${alph[${numarr[0]}+$j]}
				fi		
			fi
		}
	}

else
	for ((k=0 ; k < ${#arr[@]} ; k++)){
		for (( j=0 ;j< ${#alph[@]}; j++)){
			if [[ "${arr[$k]}" = "${alph[$j]}" ]];
			then
				if [[ $(( ${numarr[0]}+${j})) > 26 ]]
				then
					new[$k]=${alph[$((${numarr[$k]}+${j}-26))]}
				else
					new[$k]=${alph[${numarr[$k]}+$j]}
				fi			
			fi
		}
	}
fi

printf %s "${new[@]}" $'\n'
