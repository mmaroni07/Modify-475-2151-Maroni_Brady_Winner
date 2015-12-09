#Default start and end 
$EndDate = Get-Date
$StartDate = $(Get-Date).AddDays(-10) #10 days ago 

#Default Output type
$OutputType = "csv" #csv or txt

#Default Search Type
$SearchType = 1 #Modify

#Default Directory is C:\ drive
$DirPath = "C:\"
#Default Output Type is .csv
$OutFile = "modifytool.csv"

#checks for help command
foreach ($n in $args){
	if ($n -eq "-h" -or $n -eq "--help"){ Write-Host "Print help here" ; exit(0) }
	}
#setup
foreach ($n in $args){
	#TODO: Writ ensuing README ugh....
	if($n -like '*--startdate==*'){
		$StartDate = Get-Date -Date $n.Substring(13)
		}
	elseif ($n -like '*--enddate==*'){
		$EndDate = Get-Date -Date $n.Substring(11)
		}
	elseif ($n -like '*--searchtype==*'){
		$n = $n.Substring(14)
		if (($n -lt 8) -and ($n -gt 0)){$SearchType = $n} #Just Create Date Compare
		
		else {Write-Host "Error: Search Type invalid, using default of 1"}
		}
	elseif ($n -like '*--dirpath==*'){
		$DirPath = $n.Substring(11)
		}
	elseif ($n -like '*--outfile==*'){
		$OutFile = $n.Substring(11)
		}
}
Write-Host "Search Start date: $StartDate"
Write-Host "Search End date: $EndDate"
Write-Host "Search type: $SearchType"
Write-Host "Directory Searching: $DirPath"
Write-Host "Will Write results to: $OutFile"

If (Test-Path $DirPath -pathType leaf){ #if the user provided directory does not exist, write an error and exit the script
    Write-Host "Error: Please specify valid Directory Path"
    exit(1)
    }

if ($SearchType -eq 1) { 
	Get-ChildItem $DirPath -rec | where-object{($_.LastAccessTime -gt $StartDate) -and ($_.LastAccessTime -lt $EndDate)} | select-object FullName,  LastWriteTime, LastAccessTime, CreationTime, Length | export-csv -notypeinformation -path $OutFile
	}
elseif($SearchType -eq 2) {
	Get-ChildItem $DirPath -rec | where-object{($_.LastWriteTime -gt $StartDate) -and ($_.LastWriteTime -lt $EndDate)} | select-object FullName, LastWriteTime, LastAccessTime, CreationTime, Length | export-csv -notypeinformation -path $OutFile
	}
elseif($SearchType -eq 3) {
	Get-ChildItem $DirPath -rec | where-object{($_.CreationTime -gt $StartDate) -and ($_.CreationTime -lt $EndDate)} | select-object FullName, LastWriteTime, LastAccessTime, CreationTime, Length | export-csv -notypeinformation -path $OutFile
	}
elseif($SearchType -eq 4) {
	Get-ChildItem $DirPath -rec | where-object{($_.LastAccessTime -gt $StartDate) -and ($_.LastAccessTime -lt $EndDate) -and ($_.LastWriteTime -gt $StartDate) -and ($_.LastWriteTime -lt $EndDate)} | select-object FullName,  LastWriteTime, LastAccessTime, CreationTime, Length | export-csv -notypeinformation -path $OutFile
}
elseif($SearchType -eq 5) {
	Get-ChildItem $DirPath -rec | where-object{($_.CreationTime -gt $StartDate) -and ($_.CreationTime -lt $EndDate) -and ($_.LastWriteTime -gt $StartDate) -and ($_.LastWriteTime -lt $EndDate)} | select-object FullName,  LastWriteTime, LastAccessTime, CreationTime, Length | export-csv -notypeinformation -path $OutFile
}
elseif($SearchType -eq 6) {
	Get-ChildItem $DirPath -rec | where-object{($_.CreationTime -gt $StartDate) -and ($_.CreationTime -lt $EndDate) -and ($_.LastAccessTime -gt $StartDate) -and ($_.LastAccessTime -lt $EndDate)} | select-object FullName,  LastWriteTime, LastAccessTime, CreationTime, Length | export-csv -notypeinformation -path $OutFile
}
elseif($SearchType -eq 7) {
	Get-ChildItem $DirPath -rec | where-object{($_.LastWriteTime -gt $StartDate) -and ($_.LastWriteTime -lt $EndDate) -and ($_.CreationTime -gt $StartDate) -and ($_.CreationTime -lt $EndDate) -and ($_.LastAccessTime -gt $StartDate) -and ($_.LastAccessTime -lt $EndDate)} | select-object FullName,  LastWriteTime, LastAccessTime, CreationTime, Length | export-csv -notypeinformation -path $OutFile
}
					
