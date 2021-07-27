
#PROGRAM 5

#If there are 2 inputs ******
if [[ $# == 2 ]]
then
 
option=$1;
usePropertyR=$2
fi

#If there are 1 inputs ******
if [[ $# == 1 ]]
then

usePropertyNR=$1;
fi

control=0

#If the user enter many inputs,the code deletes previous copied files in order to prevent errors.
function deletePreviousCopied {
    cd "$1"
        rm -rf copied
                
    for d in * .[!.]* ..?*; do
        cd "$1"
        test -d "$1/$d" && deletePreviousCopied "$1/$d"
    done
}
deletePreviousCopied "`pwd`"




#If the option is -R, go to subdirectories recursively and copy the files to directory is named "copied"  with given property.
if [[ $option == "-R" && $# == 2 ]]
then

function goSubdirectory {

    cd "$1"
        mkdir copied
        cp -R $usePropertyR "copied" 
                
    for d in * .[!.]* ..?*; do
        if [[ $d != "copied" ]]
        then   
        cd "$1"
        test -d "$1/$d" && goSubdirectory "$1/$d"
        fi
    done
}

goSubdirectory "`pwd`"
control=1

#If there is not -R option and the total input number is 1 
elif [[ $# == 1 ]]
then
        mkdir copied
        cp $usePropertyNR "copied" 
control=1
fi


#ERROR CHECK
#If the user entered more than 2 input, the program will exit.
if [[ $control == 0 ]]
then
   echo "You entered wrong inputs, try again."
   exit 0
fi




