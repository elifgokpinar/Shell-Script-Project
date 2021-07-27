#This is a menu for all programs
while :
  do
     clear
     echo "-------------------------------------"
     echo " Main Menu "
     echo "-------------------------------------"
     echo "1. Create histogram"
     echo "2. Encryption"
     echo "3. Delete oldest"
     echo "4. Convert numbers"
     echo "5. Organized files"
     echo "6. Exit"
     echo "======================="
     echo -n "Enter your menu choice [1-6]: "
     read yourch
     case $yourch in
        1) echo "Please write the txt name like input.txt:"
 	   read input1
           bash ./1.sh $input1  
           echo "Press a key to continue. . ."; read ;;
        
 	2) echo "Please write a string :"
	   read input2
           echo "Please write a number :"
	   read input3
	   bash ./2.sh $input2 $input3 
	   echo "Press a key to continue. . ."; read ;;
	   
 	3) echo "Please write the folder name that you want to open or don't write anything, press enter only ! :"
 	   read input4
 	   bash ./3.sh $input4 
 	   echo "Press a key to continue. . ."; read ;;
 	   
 	4) echo "Please write the txt name like input.txt:"
 	   read input5
 	   bash ./4.sh $input5
 	   echo "Press a key to continue. . ." ; read ;;
 	  
 	5) 	
 	  echo 'Write input like these : -R "*.txt" or "*.txt"'
          read input6 input7
          #If first input -R , it means recursively copy
          if [[ $input6 == "-R" || $input6 == "-r" ]]
          then
          string=$input7
          string="${string#?}" && string="${string%%?}"
          bash ./5.sh $input6 "$string"
          #For nonrecursive copy
          else
          string2=$input6
          string2="${string2#?}" && string2="${string2%%?}"
          bash ./5.sh "$string2"
          fi 
 	   echo "Press a key to continue. . ." ; read ;;
 	  
 	6) exit 0 ;;
 	*) echo "Opps!!! Please select choice 1,2,3,4,5, or 6";
  esac
  done
