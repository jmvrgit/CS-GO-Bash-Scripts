#!/bin/bash
#edit the top part if you have a different bash directory
#use the command "which bash" to find out

#Steam Launcher for trading
#Launches 5 Steam Client instances with different users
#To use this script, create 5 user accounts and input its usernames below
ACCOUNT1="steam1"
ACCOUNT2="steam2"
ACCOUNT3="steam3"
ACCOUNT4="steam4"

#LOOP is the number of other user accounts you want to use, without the current logged in user
LOOP=4

#If you are using a different terminal, check the echo in launchsteam function
#mate-terminal is the default terminal for Linux Mint
TERMINALNAME="mate-terminal"

function disableaccesscontrol {
    echo "disabling access control, clients should be able to connect from any host"
    echo "Enter current user's password"
    #disables access control, allows clients to connect to current user's DE
    echo `xhost +`
    sleep 1s
}

function launchsteam {
    echo "Launching CS:GO Accounts"
    echo "Opening $LOOP instances of Terminal"
    echo "Enter the passwords for the accounts"
    sleep 1s
	#Use LOOPCOUNT = 1 to skip the current logged in user
    LOOPCOUNT=0
    while [ $LOOPCOUNT -le $LOOP ]; do
        # the command: su -l $ACCOUNTNAME steam is used to launch steam with the user $ACCOUNTNAME

        #the command: mate-terminal -x
        #executes it to our terminal of choice
        echo "Terminal Instance: $LOOPCOUNT"
        case $LOOPCOUNT in
            0) echo `$TERMINALNAME -x steam`;;
            1) echo `$TERMINALNAME -x su -l $ACCOUNT1 -c "steam"`;;
            2) echo `$TERMINALNAME -x su -l $ACCOUNT2 -c "steam"`;;
            3) echo `$TERMINALNAME -x su -l $ACCOUNT3 -c "steam"`;;
            4) echo `$TERMINALNAME -x su -l $ACCOUNT4 -c "steam"`;;
            *) echo "User entry does not exist! Edit script to add accounts"
        esac
		sleep 1s
        let LOOPCOUNT=LOOPCOUNT+1
    done 
}

function introduction {
    echo "This script launches 5 instances of steam using different linux users"
    echo "Bash script created by Jon Marco Reyes"
    sleep 2s
}

#FUNCTION CALLS
introduction
disableaccesscontrol
launchsteam