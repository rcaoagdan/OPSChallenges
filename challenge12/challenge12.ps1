#Script Name : Challenge 12
# Author : Raymond Caoagdan
# Date 03/16/2021
# Purpose : Powershell IP Analysis | String

#variables
$break = Write-Output " " #line break var
$incorrect = Write-Output "Incorrect Input" #incorrect var

#functions
function mainone {
    Write-Output "Main Menu"
    Write-Output "Hello, please look at the options below"
    Write-Output "1. IP Address"
    Write-Output "2. Test Network Adapater"
    Write-Output "3. Test Internet Connectivity"
    Write-Output "4. Exit"
    $maininput = Read-Host "Please select a numbered option"

    if ($maininput -eq 1) {
        ipconfigurations
    }
    elseif ($maininput -eq 2) {
        $break
        Get-NetAdapter # overview of sent and recieved packets
        $break
        mainone
    }
    elseif ($maininput -eq 3) {
        testinternet
    }
    elseif ($maininput -eq 4) {
        exit 
    }
    else {
        $break
        $incorrect
        $break
        mainone
    }
}

function ipconfigurations {
    Write-Output "Please Look at the Options Below"
    Write-Output "1. IPv4"
    Write-Output "2. IPv6"
    Write-Output "3. Subnet"
    Write-Output "4. Default Gateway"
    Write-Output "5. Return to main menu"
    $ipinput = Read-Host "What would you like to do?"
    
    if ($ipinput -eq 1) {
        $break
        ipconfig /all | findstr /v 00-00-00 | Select-String IPv4 | select-object -First 1
        $break
        ipconfigurations
    }
    elseif ($ipinput -eq 2) {
        $break
        ipconfig /all | findstr /v 00-00-00 | Select-String IPv6 | select-object -First 1
        $break
        ipconfigurations
       
    }
    elseif ($ipinput -eq 3) {
        $break
        ipconfig /all | findstr /v 00-00-00 | Select-String "Subnet Mask" | select-object -First 1
        $break
        ipconfigurations
    }
    elseif ($ipinput -eq 4) {
        $break
        ipconfig /all | findstr /v 00-00-00 | Select-String "Default Gateway" | select-object -First 1
        $break
        ipconfigurations
    }
    elseif ($ipinput -eq 5) {
        $break
        mainone
    }
   
    else {
        $break
        $incorrect
        $break
        ipconfigurations
    }
} #this function has all ipconfig use pipping to store information to be called upon

function testinternet {
    Write-Output "Shall we test internet connection?"
    Write-Output "1. NetConnection"
    Write-Output "2. Ping website"
    Write-Output "3. Return to Main Menu"
    $testinter = Read-Host "What would you like to do?"
    if ($testinter -eq 1){
        Test-NetConnection 
	testinternet
    }
    elseif ($testinter -eq 2) {
        pingfunc
    }
    elseif ($testinter -eq 3) {
        $break
        mainone
    }
    else {
        $break
        $incorrect
        $break
    }
}

function pingfunc {
   $pingYN = Read-Host "shall we ping a website y/n?"
   if ($pingYN -eq 'y') {
       $pingVar = Read-Host "Please enter website"
       $break
       ping $pingVar
       $break
       pingfunc
   }
   elseif ($pingYN -eq 'n') {
       $break
       mainone
   }
   else {
       $break
       $incorrect
       $break
   }
    
}
#main
mainone
#end


#original code

#ipconfig /all > network_report.txt
#Select-String -path "network_report" -pattern 'Ipv4'


# sources
# ipconfig https://www.meridianoutpost.com/resources/articles/command-line/ipconfig.php
# net packets https://devblogs.microsoft.com/scripting/gathering-network-statistics-with-powershell/



