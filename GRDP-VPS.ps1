Set-NetFirewallProfile -Profile Domain,Public,Private -Enabled False
& {$P = $env:TEMP + '\chromeremotedesktophost.msi'; Invoke-WebRequest 'https://dl.google.com/edgedl/chrome-remote-desktop/chromeremotedesktophost.msi' -OutFile $P; Start-Process $P -Wait; Remove-Item $P}
& {$P = $env:TEMP + '\chrome_installer.exe'; Invoke-WebRequest 'https://dl.google.com/chrome/install/latest/chrome_installer.exe' -OutFile $P; Start-Process -FilePath $P -Args '/install' -Verb RunAs -Wait; Remove-Item $P}

if ($args[1]) { WMIC computersystem where caption=$(hostname) rename $args[1] }
sc start audiosrv
sc config Audiosrv start= auto
New-Item -Path "C:\Users\Public\Desktop" -Name "DLLandInjector" -ItemType Directory
New-Item -Path "C:\Users\Public\Desktop\DLLandInjector" -Name "PH" -ItemType Directory
Invoke-WebRequest https://cdn.discordapp.com/attachments/705282342817628210/879337264323379200/fixed_Inject_Teohook.bat -OutFile "C:\Users\Public\Desktop\Inject Teohook.bat"
Invoke-WebRequest https://cdn.discordapp.com/attachments/705282342817628210/880514815209140305/TeoHook_v1.2.dll -OutFile "C:\Users\Public\Desktop\DLLandInjector\teohook.dll"
Invoke-WebRequest https://cdn.discordapp.com/attachments/878777578251505714/879325134572363836/ProcessHacker.zip -OutFile "C:\Users\Public\Desktop\DLLandInjector\PH\ProcessHacker.zip"
Invoke-WebRequest https://cdn.discordapp.com/attachments/878777578251505714/879324754123825242/items.dat -OutFile "C:\Users\Public\Desktop\items.dat"
Invoke-WebRequest https://cdn.discordapp.com/attachments/705282342817628210/879346980613156874/Growtopia.zip -OutFile "C:\Users\Public\Desktop\Growtopia.zip"
Expand-Archive -Path C:\Users\Public\Desktop\DLLandInjector\PH\ProcessHacker.zip -DestinationPath C:\Users\Public\Desktop\DLLandInjector\PH
Expand-Archive -Path C:\Users\Public\Desktop\Growtopia.zip -DestinationPath C:\Users\runneradmin\Appdata\Local
New-Item -ItemType SymbolicLink -Path "C:\Users\Public\Desktop" -Name "Normal Growtopia.lnk" -Value "C:\Users\runneradmin\Appdata\Local\Growtopia.exe"
Remove-Item C:\Users\Public\Desktop\DLLandInjector\PH\ProcessHacker.zip -Recurse
Remove-Item C:\Users\Public\Desktop\Growtopia.zip -Recurse