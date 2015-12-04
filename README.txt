.\project.ps1
-Powershell script

This is a powershell script that checks a specified directory for files modified within a date range.

By default, with no arguments, the script will check the C drive for any modifications since 1/1/15 to the current date.

Given a directory, the script will check that directory for any modifications since 1/1/15 to the current date.

Given a directory and two dates, the script will check that directory for any modifications from the first date until the second date.

There is a help option within the code. The command is:
.\project.ps1 --help

The user's first argument in the code should be the directory path to search (this will also search all subdirectories and their files), while the second argument should be the starting date (in Windows format: mm/dd/yy) and third argument should be the ending date.
