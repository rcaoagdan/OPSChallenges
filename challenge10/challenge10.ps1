#Script Name : Challenge 10
#Autor: Raymond Caoagdan
#Date of last revision : 03/10/2021
#Purpose : System Process Powershell commands 

#Variables
$CPUTIME = Get-Process | Format-Table -View priority


Write-Output $CPUTIME