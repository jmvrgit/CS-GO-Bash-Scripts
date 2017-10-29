#!/bin/bash
#edit the top part if you have a different bash directory
#use the command "which bash" to find out
#Steam Launcher for Trading
#Login Multiple Users through Steam Client
#To use this script, create user accounts and input its usernames below
#LOOP is the number of accounts you want to use
LOOP=4
#If you are using a different terminal, check the echo in launchsteam function
TERMINALNAME="mate-terminal"
ACCOUNT1="steam1"
ACCOUNT2="steam2"
ACCOUNT3="steam3"
ACCOUNT4="steam4"
ACCOUNT5="steam5"

function disableaccesscontrol {
    echo "disabling access control, clients should be able to connect from any host"
    echo "Enter current user's password"
    #disables access control, allows clients to connect to current user's DE
    echo `xhost +`
}

function launchsteam {
    echo "Launching Steam"
    echo "Opening $LOOP instances of Terminal"
    LOOPCOUNT=0 # start at 0 to include current user, start at 1 to just execute other user steam profiles
    while [ $LOOPCOUNT -le $LOOP ]; do
        # the command: su -l $ACCOUNTNAME steam
        # is used to launch steam

        #the command: mate-terminal -e
        #executes it to our terminal of choice
        case $LOOPCOUNT in
            #add more if you need
            0) echo `steam`;;
            1) echo `$TERMINALNAME -e "su -l $ACCOUNT1 steam"`;;
            2) echo `$TERMINALNAME -e "su -l $ACCOUNT2 steam"`;;
            3) echo `$TERMINALNAME -e "su -l $ACCOUNT3 steam"`;;
            4) echo `$TERMINALNAME -e "su -l $ACCOUNT4 steam"`;;
            5) echo `$TERMINALNAME -e "su -l $ACCOUNT5 steam"`;;
        esac
        let LOOPCOUNT=LOOPCOUNT+1

    done 
}

function introduction {
    echo "This script launches instances of steam using different linux users"
    echo "Bash script created by Jon Marco Reyes"
}

#FUNCTION CALLS
introduction
disableaccesscontrol
launchsteam

