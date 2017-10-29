Bash Scripts for Counter-Strike: Global offensinve
====================


These collection of Linux Bash scripts are used to launch multiple instances of Counter-Strike: Global Offensive using different users in Linux. 

----------


Developer's Machine
-------------------

MSI GE70-2OE running Linux Mint 16 MATE

## Requirements ##

 - Steam for Linux
 - Different user accounts
 - Linux user with administrative privileges
 - Steam Accounts with Counter-Strike: Global Offensive

## Information ##

trader.sh

> Launches Steam Clients
> Useful for configuring accounts, setting up Steam Client settings, setting launch options.

deranker.sh
>Launches (up to 5) Counter-Strike: Global Offensive game instances

## Recommended Settings ##

User Clients
> - Passwords should be easy to type. (Note: you may use NOPASSWD, but I wouldn't recommend it)

Steam Clients

> - Always enable "Remember the password"
> - Disable the Steam News and updates pop-up
> - Setup a shared directory for Counter-Strike: Global Offensive and add it to the library as default

Counter-Strike: Global Offensive
>- Set everything to the lowest possible setting
>- Launch Option: `-novid -nojoy -nod3d9ex -w 640 -h 480 -window +exec autoexec.cfg`
>- add `+duck` on autoexec.cfg
>
