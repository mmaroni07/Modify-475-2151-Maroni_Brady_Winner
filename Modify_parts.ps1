#Write-Host "here's arg 0: $($args[0])"
#Write-Host "here's arg 1: $($args[1])"

#Default start and end 
$EndDate = Get-Date
$StartDate = Get-Date -Month 1 -Day 1 -Year 2015 -Hour 0 -Min 0 -Sec 0

#Default Output type
$OutputType = "csv" #csv or txt

#Default Search Type
$SearchType = 1 #Modify

#Default Directory is C:\ drive
$DirPath = "C:\"

#checks for help command
foreach ($n in $args){
	if ($n -eq "-h" -or $n -eq "--help"){ Write-Host "Print help here" ; exit(0) }
	}

#setup
foreach ($n in $args){
	#TODO: add a plethora of more options for -n type options
	#TODO: Writ ensuing README ugh....
	if($n -like '*--startdate==*'){
		$StartDate = Get-Date -Date $n.Substring(13)
		Write-Host "New Start date: $StartDate"
		}
	elseif ($n -like '*--enddate==*'){
		$EndDate = Get-Date -Date $n.Substring(11)
		Write-Host "New End date: $EndDate"
		}
	elseif ($n -like '*--searchtype==*'){
		$n = $n.Substring(14)
		if ($n -eq 3){$SearchType = 3} #Just Create Date Compare
		elseif ($n -eq 5){$SearchType = 5} #Just Access Date Compare
		elseif ($n -eq 8){$SearchType = 8} #Create AND Access Date Compare
		elseif ($n -eq 4){$SearchType = 4} #Mod AND Create Date Compare
		elseif ($n -eq 6){$SearchType = 6} #Mod and Access
		elseif ($n -eq 9){$SearchType = 9} #All
		else {Write-Host "Error: Search Type invalid, using default of 1"}
		Write-Host "Searchtype: $SearchType"
		}
	elseif ($n -like '*--dirpath==*'){
		$DirPath = $n.Substring(11)
		Write-Host "New Dirpath: $DirPath"
		}
}
Write-Host $DirPath
If (!(Test-Path $DirPath -pathType container)){ #if the user provided directory does not exist, write an error and exit the script
    Write-Host "Error: Please specify valid Directory Path"
    exit(1)
    }
function DirCheck( $dir )
{
              foreach ($item in Get-ChildItem $dir){ #recursively checks each object in the directory
                     if (Test-Path $item.FullName -PathType Container) #if the object is a folder
                     {
                           DirCheck $item.FullName #recursively check that folder as well
                           }
                     else{
						#TODO: Make some goddamn functions this is soooo ugly
						#TODO: Add to list, then write to file
						#^Thats pretty much it
						if (($SearchType -eq 1) -and ($item.lastwritetime -gt $StartDate) -and ($item.lastwritetime -lt $EndDate)) { #if the object is a file, and the file was last modified date is since the time we are checking
							Write-Host "File: " $item.FullName "Last Modified: " $item.lastwritetime
						}
						elseif(($SearchType -eq 3)){}
						elseif(($SearchType -eq 3)){}
						elseif(($SearchType -eq 3)){}
						elseif(($SearchType -eq 3)){}
						elseif(($SearchType -eq 3)){}
						elseif(($SearchType -eq 3)){}
					 }
              }
}
DirCheck $DirPath #calls the function within the script
