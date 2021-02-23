#!/bin/bash

#Script Name: OPS 201 Challenge 6
#Author: Ray Caoagdan
#Date of last revision: 02/22/2021
#Description of Purpose: Show Listening Ports

#variables
openports=$(netstat --listen)

#print listening ports
listening_ports () {
    echo -e "$openports"
}

listening_ports
