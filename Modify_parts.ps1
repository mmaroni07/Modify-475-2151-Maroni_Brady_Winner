#Write-Host "here's arg 0: $($args[0])"
#Write-Host "here's arg 1: $($args[1])"

#Default start and end 
$EndDate = Get-Date
$StartDate = Get-Date -Month 1 -Day 1 -Year 2015 -Hour 0 -Min 0 -Sec 0

#Default Output type
$OutputType = "csv" #csv or txt

#Default Search Type
$SearchType = 1 #Modify

#checks for help command
foreach ($n in $args){
	if ($n -eq "-h" -or $n -eq "--help"){ Write-Host "Print help here" ; exit(0) }
	}

#setup
foreach ($n in $args){
	if($n -like '*--startdate==*'){
		$StartDate = Get-Date -Date $n.Substring(13)
		Write-Host "New Start date: $StartDate"
		}
	elseif ($n -like '*--enddate==*'){
		$EndDate = Get-Date -Date $n.Substring(11)
		Write-Host "New End date: $EndDate"
		}
	elseif ($n -like '*--searchtype==*'){
		if ($n -eq '3'){$SearchType = 3} #Just Create Date Compare
		elseif ($n -eq "5"){$SearchType = 5} #Just Access Date Compare
		elseif ($n -eq '8'){$SearchType = 8} #Create AND Access Date Compare
		elseif ($n -eq '4'){$SearchType = 4} #Mod AND Create Date Compare
		elseif ($n -eq '6'){$SearchType = 6} #Mod and Access
		elseif ($n -eq '9'){$SearchType = 9} #All
		Write-Host "Searchtype: $SearchType"
		}
	
}
