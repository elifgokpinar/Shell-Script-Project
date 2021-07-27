#if there is no input
if [ -z "$1" ]
then 
#finding the oldest file in the folder
oldest=$(find -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort  | cut -d" " -f5-| head -1 | cut -d"/" -f2-) 
	#remove the oldest file if you want
	echo "Do you want to delete $oldest ? (y/n)"
	read answer
		if [ "$answer" = "y" ] || [ "$answer" = "Y" ];
		then
		rm $oldest		
		echo "$oldest is deleted"
			elif [ $answer = "n" ] || [  $answer = "N" ];
			then
			echo "$oldest is not deleted"
				else 
				echo "wrong input"
		fi
exit 1
	#if there is an input
	elif [ -n "$1" ]
	then
		#enter the folder that you write
		cd "$(pwd)/$1"
		#finding the oldest file in the folder
		oldest=$(find -type f -print0 | xargs -0 stat --format '%Y :%y %n' | sort  | cut -d" " -f5-| head -1 | cut -d"/" -f2- ) 
		#remove the oldest file if you want
		echo "Do you want to delete $oldest ? (y/n)"
		read answer
			if [ "$answer" = "y" ] || [ "$answer" = "Y" ];
			then
			rm $oldest
			echo "$oldest is deleted"
				elif [ $answer = "n" ] || [  $answer = "N" ];
				then
				echo "$oldest is not deleted"
					else 
					echo "wrong input"
			fi


	exit 2
fi 

