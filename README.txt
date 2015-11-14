.\project.ps1
-Powershell script

This is a powershell script to be able to check a specific directoy (provided by the user) or it will default to the C:/ Drive. The default date range to look from is 1/1/15 - the current date. This will be if the user does not provide any arguments for the code before it runs. The user can specify a certain date to look for modified files from. 

There is a help option with the code and will display if the user.
The command is:
.\project.ps1 --help

The user's first argument in the code should be the directory path to search (this will also search all subdirectories and their files as well), while the second argument should be the date (in Windows format: mm/dd/yy). 
