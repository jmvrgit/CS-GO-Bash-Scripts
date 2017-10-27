#!/bin/bash
#edit the top part if you have a different bash directory
#use the command "which bash" to find out
#Steam Launcher for Deranking
#Launches 5 csgo instances with different users
#To use this script, create 5 user accounts and input its usernames below
#LOOP is the number of accounts you want to use
LOOP=4
#If you are using a different terminal, check the echo in launchsteam function
#mate-terminal is the default terminal for Linux Mint
TERMINALNAME="mate-terminal"
ACCOUNT1="steam1"
ACCOUNT2="steam2"
ACCOUNT3="steam3"
ACCOUNT4="steam4"
ACCOUNT5=""

function disableaccesscontrol {
    echo "disabling access control, clients should be able to connect from any host"
    echo "Enter current user's password"
    #disables access control, allows clients to connect to current user's DE
    echo `xhost +`
}

function launchsteam {
    echo "Launching CS:GO"
    echo "Opening $LOOP instances of Terminal"
    LOOPCOUNT=1
    while [ $LOOPCOUNT -le $LOOP ]; do
        # the command: su -l $ACCOUNTNAME steam
        # is used to launch steam 

        #the command: mate-terminal -e
        #executes it to our terminal of choice
        case $LOOPCOUNT in
            1) echo `$TERMINALNAME -e "su -l $ACCOUNT1 steam -applaunch 730"`;;
            2) echo `$TERMINALNAME -e "su -l $ACCOUNT2 steam -applaunch 730"`;;
            3) echo `$TERMINALNAME -e "su -l $ACCOUNT3 steam -applaunch 730"`;;
            4) echo `$TERMINALNAME -e "su -l $ACCOUNT4 steam -applaunch 730"`;;
            5) echo `$TERMINALNAME -e "su -l $ACCOUNT5 steam -applaunch 730"`;;
            6) outofbounds
        esac
		sleep 30s
		removelockfiles
        let LOOPCOUNT=LOOPCOUNT+1

    done 
}
function removelockfiles {
	echo `rm -f /tmp/*.lock`
}
function outofbounds {
    echo "LOOP value is more than 5, don't use a value of more than 5"
    exit
}

function introduction{
    echo "This script launches 5 instances of steam using different linux users"
    echo "Bash script created by Jon Marco Reyes"
}

#FUNCTION CALLS
introduction
disableaccesscontrol
launchsteam

