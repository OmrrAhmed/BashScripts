#!/bin/bash

read -p "Please Enter the username": user   

if id $user &> /dev/null ;then

	echo" This username '$user' is already exits"
	exit 1

else
	read -p "This User not exists,Do you want to add this User(y/n)?": ans

	if [ $ans == 'y' ]; then

		sudo useradd -m -s /bin/bash $user

		echo "user created sucessfully"

		read -p "Do you Want To create password(y/n)?": passcode

		if [ $passcode == 'y' ]; then
			sudo passwd $user
			
			echo "password created successfully"

			read -p "Do you Want To Add This User To Secondary Group(y/n)?": ans2

			if [ $ans2 == 'y' ]; then
				read -p "Please Enter The Group Name": Group
				sudo usermod -aG $Group $user
				echo "The User Added To Group '$Group' Successfully"
			else
				exit 1
			fi


			else
				exit 1
		fi

	else
		echo "The User Not Created"
		exit 1
	fi
fi
