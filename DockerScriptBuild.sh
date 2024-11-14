#!/bin/bash

echo "Welcome to Docker"

echo -n "Select Operation To Perform:\n 1-Build Image Only \n 2-Build Image And Push To Docker Hub\n"
read -p "choose operation": opernum

if [ "$opernum" = "1" ]; then
    read -p "Please insert image name": imgname
    read -p "please insert dockerfile path": dockfile
    sudo docker build -t $imgname $dockfile

elif [ "$opernum" = "2" ]; then
    read -p "Please Enter Your Docker Hub Username": user
    stty -echo
    read -p "Please Enter Your Docker Hub Password": password
    stty echo
    sudo docker login --username $user  --password $password \n

    read -p "Please insert image name": imgname
    read -p "please insert dockerfile path": dockfile
    sudo docker build -t $user/$imgname $dockfile 
    sudo docker push $user/$imgname
else
    echo "Invalid option. Please choose either 1 or 2."
fi



