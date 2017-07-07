# Powershell-FileMonitor
This is my attempt at building a PoSH script that will monitor a file location and copy any newly created or newly updated files to a destination folder. The goal is to get the script to be able to read multiple source folders as arguments and copy everything over while also keeping the folder structure. 

# Usage
Seems to only work via a cmd window that has been elevated.
  Type the following in the cmd window: Set-ExecutionPolicy RemoteSigned and hit enter.
  Type the following in the cmd window: powershell -noexit -file <PATH TO THE SCRIPT> filecopy.ps1 -srcfolder <PATH TO SOURCE FOLDER> -dstfolder <PATH TO DESTINATION FOLDER> and hit enter.
  
#Known issues
- It will monitor ONLY one source folder currently. The work around is to run multiple instances of the script pointing to the different folders you want monitored (ie: C:\Users\%usernamee%\AppData\Roaming and C:\Users\%usernamee%\AppData\Local\Temp).

- Source and destination folders need to be created first or the script will fail.

# Resources used
- Props to the person that wrote the script (cannot remember where I found it)
- https://stackoverflow.com/questions/16426688/passing-a-variable-to-a-powershell-script-via-command-line
- https://devcentral.f5.com/articles/powershell-abcs-p-is-for-parameters
- https://technet.microsoft.com/en-us/library/jj554301.aspx

# Fixed
2017-07-06: Script now copies ALL of the source folder to the destination folder and updates accordingly. 