arr=()
file=$1
re='^[0-9]+$'
if [ -z "$file" ]
	then 
	echo "There is no input. Program is ended"
		elif [ -n "$1" ]
			then
			# reading inputs word
			while read line; do
			    for word in $line; do
			    	#if words are number 
			    	if  [[ $word =~ $re ]] ; then
			    		last=""
					for (( j=0 ; j<${#word} ; j++)) {
						digit=${word:j:1}
						case $digit in
							0) num='zero' ;;
							1) num='one' ;;
			       			2) num='two' ;;
			       			3) num='three' ;;
			       			4) num='four' ;;
			       			5) num='five' ;;
			       			6) num='six' ;;
			       			7) num='seven' ;;
			      				8) num='eight' ;;
			       			9) num='nine' ;;
			 			esac
			 			last="$last$num"
					}
					word="$last"
			    	fi
			       arr[i]="$word"
			       i=$((i+1))
				 
			    done
			done <"$file"
			#writing to file
			 > $file
			echo ${arr[@]} >> $file
fi
