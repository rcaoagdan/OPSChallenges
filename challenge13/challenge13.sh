#! /bin/sh

#Script: Ops Challenge 13
#Author: Ray Caoagdan
#Date of Last Revision: 03/23/21
#Purpose: Arrays : Bash Domain analysis 

#variables
echo -e "\nPlease enter a domain name?"
read -r ipvar 


#Main Function utilizeing whois, dig, nslookup

main_function (){
    whoisfunction
    dig $ipvar
    host $ipvar
    nslookup $ipvar
}

# whois function using grep to only display usefull infor
whoisfunction (){
    whois $ipvar| grep -m1  'Domain Name'
    whois $ipvar| grep -m1  'Registry Domain ID'
    whois $ipvar| grep -m1  'Registrar WHOIS Server'
    whois $ipvar| grep -m1  'Registrar URL'
    whois $ipvar| grep -m1  'Updated Date'
    whois $ipvar| grep -m1  'Creation Date'
    whois $ipvar| grep -m1  'Registry Exipry Date'
    whois $ipvar| grep -m1  'Registrar'
    whois $ipvar| grep -m1  'Registrar IANNA ID'
    whois $ipvar| grep -m1  'Registrar Abuse Contact Email'
    whois $ipvar| grep -m1  'Registrar Abuse Contact Phone'
    whois $ipvar| grep -m1  'Domain Status'
    whois $ipvar| grep -m1 'Name Server'
    whois $ipvar| grep -m1  'DNSSEC'
}
#main
if [[ $(curl $ipvar) ]] 2>/dev/null; #sees url valid
 then
  main_function >> challenge13.txt
 else
  echo "This page does not exist."
fi 
#end

