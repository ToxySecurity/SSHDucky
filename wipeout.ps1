 # Get the path to the Windows Temp folder
 $tempFolderPath = [System.IO.Path]::GetTempPath()

 # Delete all files and subfolders within the Temp folder
 Get-ChildItem -Path $tempFolderPath -File -Force | Remove-Item -Force
 Get-ChildItem -Path $tempFolderPath -Directory -Force | Remove-Item -Recurse -Force

 # Display a message indicating the completion of the cleanup process
 Write-Host "Windows Temp folder has been cleared."
 exit