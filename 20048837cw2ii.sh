#!/bin/bash
name=$1 # first command line argument
ID=$2	# second command line argument
secretkey=123 # the secret key is 123

# This function asks the user if he/she wants to repeat or exit the program
function rep(){
	echo
	echo "Type Y to repeat or E to exit"
	read input
	case $input in
		Y)
		band  # function band is being called if the user input is Y
		;;
		E)
		exit  # exiting the program if user input is E
		;;
		*)
		echo -e "\033[0;31m Wrong input \033[0;32m"
		rep	# Repeating the same function
		;;
	esac
}


# This function displays the detail about the selected band member
function membercode(){
	if [[ $name1 != "" ]] && [[ $name2 != "" ]] && [[ $name3 != "" ]]
	then
		if [[ $name1 == $name2 ]] || [[ $name1 == $name3 ]] || [[ $name2 == $name3 ]]
		then
			echo
			echo -e "\033[0;31m Same code used twice or more \033[0;32m"
			memcode # function memcode is being called if the same band member code is being ued twice or more
		fi
		PS3="Choose a file by entering the number: "
		select fil in $name1 $name2 $name3
		do
			if [ -z $fil ]
			then
				echo
				echo -e "\033[0;31m Please select a file from the options given \033[0;32m"
			else
				if [ $fil == AY ]
				then
					echo
					echo "AY: The player you selected is Angus Young"
					echo
					cat AY #  The description of the player Angus Young is shown from a file, which is stored in the same directory
					echo
					rep	# function rep is being called if this condition is satisfied
				elif [ $fil == JL ]
				then
					echo
					echo "JL: The player you selected is John Lenon"
					echo
					cat JL	#  The description of the player John Lenon is shown from a file, which is stored in the same directory
					echo
					rep	
				elif [ $fil == FM ]
				then
					echo
					echo "FM: The player you selected is Freddie Mercury"
					echo
					cat FM	#  The description of the player Freddie Mercury is shown from a file, which is stored in the same directory
					echo
					rep	
				elif [[ $fil == KC ]] || [[ $fil == DH ]]
				then
					echo
					echo -e "\033[0;31m The file with this name is either absent or not readable \033[0;32m"
					echo
					band	# function band is being called
				else
					echo
					echo -e "\033[0;31m No such name found \033[0;32m"
					echo
					band
				fi
			fi	
		done
	fi
}

# This function asks the user to enter three band members name
function memcode(){
	read -p "Enter three codes of the members from the above options in the same line seperating by spaces: " name1 name2 name3 
	if [[ $name1 == JL ]] || [[ $name1 == AY ]] || [[ $name1 == FM ]] || [[ $name1 == DH ]] || [[ $name1 == KC ]] && [[ $name2 == JL ]] || [[ $name2 == AY ]] || [[ $name2 == FM ]] || [[ $name2 == DH ]] || [[ $name2 == KC ]] && [[ $name3 == JL ]] || [[ $name3 == AY ]] || [[ $name3 == FM ]] || [[ $name3 == DH ]] || [[ $name3 == KC ]]
	then
		echo
		membercode	# function membercode is being called if this condition is satisfied
	else
		echo
		echo -e "\033[0;31m Enter 3 codes of the band members shown above correctly. \033[0;32m"
		memcode # Repeating the same function
	fi
}

# This function displays the band members name
function members(){
	echo
	figlet -t "Select band members"
	echo
	echo "		 ___________________________________________		"
	echo "		|          	Band members		    |		"
	echo "		|___________________________________________|		"
	echo "		|Code			|	Name	    |		"
	echo "		|_______________________|___________________|		"
	echo "		|JL     		|  John lenon	    |		"
	echo "		|AY     		|  Angus Young	    |		"
	echo "		|FM    		    	|  Freddie Mercury  |		"
	echo "		|DH     		|  Debbie Harry	    |		"
	echo "		|KC     		|  Kurt Cobain	    |		"
	echo "		|_______________________|___________________|		"
	echo
	memcode # function memcode is being called
}

# This function asks the user to enter the best band code
function bestband(){
	while true
	do
	echo "Enter the band code:"
	read code
		if [[ $code == BEA ]]
		then
			echo
			echo "The beatles were an English rock band, formed in liverpool in 1960"
			echo "They are considered to be one of the most influential band of all time."
			members # function members is called if the user selects BEA as best band
			break
		elif [[ $code == AD ]] || [[ $code == QUE ]] || [[ $code == BLO ]] || [[ $code == NIR ]]
		then
			echo
			echo -e "\033[0;31m The selected is not the best band. Please try again. \033[0;32m"
		else
			echo
			echo -e "\033[0;31m Wrong band code. Enter correct code \033[0;32m"
		fi
	done 
}

# This function displays the band names
function band(){
	figlet -t "Choose the best band"
	echo "			 ___________________________________		"
	echo "			|Band Code 	    |	Band Name   |		"
	echo "			|	    	    |		    |		"
	echo "			|___________________|_______________|		"
	echo "			|BEA	    	    |	Beatles     |		"
	echo "			|AD	    	    |	AC/DC       |		"
	echo "			|QUE	            |	QUEEN       |		"
	echo "			|BLO	            |	Blondie	    |		"
	echo "			|NIR	            |	Nirvana	    |		"
	echo "			|___________________|_______________|		"
	echo
	bestband # function bestband is being called
}

# This function asks the user for the secret key required to start the program
function userkey(){
	count=0 # initializing count as 0
	until [ $count -gt 2 ] # condition for the loop to work
	do
		read -sp "please enter the secret key: " key
		if [ $key == $secretkey ]
		then
			echo -e "\033[0;32m"
			figlet -t "+++++++++++++++++++++++++++"
			figlet -t "WELCOME TO THE PROGRAM"
			figlet -t "+++++++++++++++++++++++++++"
			figlet -t "User ID: $ID"
			figlet -t "User Name: $name"
			figlet -t -f small $(date +"Year: %Y, Month: %m, Day: %d")
			figlet -t -f small "TIME : $(date "+%T")"
			figlet -t "+++++++++++++++++++++++++++"
			band
			break
		else
			if [ $count == 2 ]
			then
				echo -e "\e[1;31m More than three errors \033[0m"
				echo
				exit # exiting the program after 3 errors
			else
				echo -e "\e[1;31m Key did not match please try again. \033[0m "
				((count++)) # increasing count
			fi	
		fi
	done		

}

# This function asks the user to enter their name and ID as arguments before running the program
function main(){
	if [[ $name == "" ]] || [[ $ID == "" ]]
	then
		echo -e "\e[1;31m Enter your name and ID as arguments."
	elif [[ $ID != "" ]]
	then
		userkey # calling function userkey if name and ID is provided
	else
		echo -e "\e[1;31m No ID"
	fi
}
main # calling the main function 


