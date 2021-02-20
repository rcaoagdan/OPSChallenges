#!/bin/bash

#Script Name: OPS 201 Challenge 5
#Author: Ray Caoagdan
#Date of last revision: 02/20/2021
#Description of Purpose: Use Loops- Ask user for PID then kills process with PID

#declare variables
target=$(ps aux)

#main

#asks to kill
ask_to_kill() {
	echo -e "Shall we kill a process? y/n?: "
	read -r  option
	while :
	do
 		if [ "$option" == n ] ; then #if option is n  run commands below
		echo -e "The Process lives another day"
		break  #needed to  break the loop
		else
			kill_process #go to kill process if y is the option
		fi
	done
}

#proceed to execute
kill_process() {
	if [ "$option" == y ]; then #if option is y then run commands below
		echo -e "$target" 
		echo -e "Select your target"
		read -r PID
		kill -9  "$PID" #kills the process

		ask_to_kill
	fi
}
 
ask_to_kill 

#end