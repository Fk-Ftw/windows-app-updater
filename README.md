# Windows-app-updater  
Purpose- Updates all apps on Windows using both Winget and Microsoft Store!  

#Features  
Updates Winget apps: The script updates all apps installed via winget (Windows Package Manager).  
Updates Microsoft Store apps: It checks for updates to apps from the Microsoft Store and opens the updates page.  
Logs the process: All actions and results are logged into a file (update_log.txt) for later reference.  

#Requirements  
Windows 10 or 11: This script requires Winget to be installed (available by default on Windows 10 version 2004 and higher, and Windows 11).  
PowerShell: PowerShell is used to open the Microsoft Store update page.  

#How to Use  
1. Download the Script  
Download the update_all_apps.bat file from this repository.  

2. Run the Script  
Right-click on the update_all_apps.bat file and select Run as Administrator.  
The script will automatically:  
Check for updates to all apps installed via Winget (including apps with unknown versions).  
Open the Microsoft Store updates page so you can easily update Store apps.  
Log all the actions and results to a file (update_log.txt).
