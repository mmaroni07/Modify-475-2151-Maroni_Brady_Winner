$num = $args.Length
if($num -eq 0){
	$dirpath="c:\"
	$time="week"
	Write-Host "Executing with default values: Location: C:\, Time range: 1 week"
}
elseif($num -eq 1){
	if("$($args[0])" -eq "--help"){
		Write-Host "Usage: .\project.ps1 c:\directory time-range"
		Write-Host "Default values: c:\ 1 week back"
		exit(0)
	}
	$dirpath = "$($args[0])"
	$time="week"
	Write-Host "Executing with default time range of 1 week"
}
else{
	$time="$($args[1])"
	$dirpath = "$($args[0])"
}

Write-Host $dirpath
If (Test-Path $dirpath -pathType container){
}
Else{
		Write-Host "Error: Please specify valid Directory Path"
	}
function DirCheck( $dir )
{
		foreach ($item in Get-ChildItem $dir){
			if (Test-Path $item.FullName -PathType Container)
			{
				Write-Host "Directory: " $item.FullName
				DirCheck $item.FullName
				}
			else{
				Write-Host "File: " $item.FullName
			}
		}
}
DirCheck $dirpath
