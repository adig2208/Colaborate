#bin/bash

echo "<------------>"
echo "Setup Virtual Environment and then continue setup (Recommended)"
echo "<------------>"
echo
echo "<------------>"
echo "Select method to run Colaborate :"
echo "1) Normal run (without Docker)"
echo "2) Docker Run (with Docker)"
read -p " Option [Press 1 or 2 and Enter ]:  " option
echo "<------------>"
echo

if [ $option == '1' ]
then 
    echo "<------------>"
    echo "Checking and Installing Requirements"
    echo "<------------>"
    echo
    pip install -r requirements.txt
    echo "Starting Colaborate (without Docker) ..."
    echo "<------------>"
    echo
    python app.py
else 
    if [[ "$(docker images -q Colaborate 2> /dev/null)" == "" ]]; 
    then
        echo "<------------>"
        echo "Creating Docker container 'Colaborate' ..."
        echo "<------------>"
        echo
        sudo docker build -t Colaborate:latest .
        
    fi
    echo "<------------>"
    echo "Starting Colaborate (with Docker)..."
    echo "<------------>"
    sudo docker run -d -p 8080:8080 Colaborate
    echo
    
    echo "<------------>"
    echo "Colaborate Running ..."
    echo
    echo 'Visit http://127.0.0.1:5001'
    echo "<------------>"
    echo 

    echo "<------------>"
    echo "Press '1' to stop docker (Colaborate)"
    read -p " Stop Colaborate ? [Press 1 and Enter] " choice
    echo "<------------>"
    
    if [ $choice == '1' ]
    then
        echo
        echo "<------------>"
        echo "Stopping Colaborate ."
        echo "<------------>"
        sudo docker stop $(docker ps -q --filter ancestor=Colaborate )
    fi
fi

echo
echo
echo "<------------>"
echo "Successfully Stopped Colaborate . Byee!!"
echo "<------------>"