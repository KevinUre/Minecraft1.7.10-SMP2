# If the current script is not elevated reload the script in an elevated environment
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if(-NOT ($currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator))) {
   Write-Host 'rebooting as admin powershell'
   Start-Process -FilePath "powershell" -ArgumentList "$('-File ""')$($PSScriptRoot)$('\')$($MyInvocation.MyCommand.Name)$('""')" -Verb runAs
   Exit 0
}

# Set up a temp directory for us to work out of
New-Item -Name C:\temp-minecraft -ItemType Directory
Set-Location C:\temp-minecraft

# Install git if it is not already present
if (!(Get-Command git)) {
   # Download git
   Invoke-WebRequest -Uri  https://github.com/git-for-windows/git/releases/download/v2.34.1.windows.1/Git-2.34.1-64-bit.exe -OutFile "GitInstaller.exe"
   # Create config for silent install
   $GitInf = @'
[Setup]
Lang=default
Dir=C:\Program Files\Git
Group=Git
NoIcons=0
SetupType=default
Components=gitlfs,assoc
Tasks=
'@
   Out-File -FilePath '.\simple.inf' -InputObject $GitInf
   # Install git using config (and pause while it works)
   .\GitInstaller.exe /SP- /VERYSILENT /NOCANCEL /NORESTART /LOADINF="simple.inf" | Out-Null
   # Wait for git to make it on the path
   while (!(Get-Command git 2>$null)) { 
      Write-Host 'Waiting for git install to complete'
      Start-Sleep -Seconds 1
      $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
   }
}

# Install 64-bit JRE if not already present
$javaDoesntWriteToStandardOutInPowershell = & cmd /c "java -version 2>&1"
if (!(Get-Command java) -or !($javaDoesntWriteToStandardOutInPowershell -match '64-bit')) {
   # Download java 64-bit jre
   Invoke-WebRequest -Uri https://javadl.oracle.com/webapps/download/AutoDL?BundleId=245479_4d5417147a92418ea8b615e228bb6935 -OutFile jre64.exe
   # Create config for silent install
   $JavaConfig = @'
INSTALL_SILENT=Enable
AUTO_UPDATE=Disable
REBOOT=Disable
NOSTARTMENU=Enable
WEB_ANALYTICS=Disable
'@
   Out-File -FilePath '.\java.cfg' -InputObject $JavaConfig
   # Install JRE using config (and pause while it works)
   .\jre64.exe INSTALLCFG="$pwd\java.cfg" | Out-Null
   # Wait for git to make it on the path
   while (!(Get-Command java 2>$null)) { 
      Write-Host 'Waiting for java install to complete'
      Start-Sleep -Seconds 1
      $env:Path = [System.Environment]::GetEnvironmentVariable("Path", "Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path", "User")
   }
}

# Install Minecraft
$ShouldInstallMinecraft = [System.Windows.MessageBox]::Show('Clicking OK will launch the minecraft java edition installer, click cancel if you already have minecraft java edition', 'Install Minecraft Legacy Launcher', 'OkCancel')
if ($ShouldInstallMinecraft -eq 'OK') {
   Invoke-WebRequest -Uri https://launcher.mojang.com/download/MinecraftInstaller.msi -OutFile minecraftinstall.msi
   # Start install GUI and wait until it closes
   Start-Process .\minecraftinstall.msi -Wait
}

# Make sure they have 1.7.10
[System.Windows.MessageBox]::Show('When the Launcher Opens, log into your account, DO NOT UPGRADE THE LAUNCHER, change you minecraft to version 1.7.10 in the installations tab and launch the game. once you load to the main menu close the game and launcher')
Start-Process 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Minecraft Launcher\Minecraft Launcher.lnk' -Wait

# Install Forge
[System.Windows.MessageBox]::Show('Simply click OK on the next installer')
Invoke-WebRequest -Uri https://maven.minecraftforge.net/net/minecraftforge/forge/1.7.10-10.13.4.1614-1.7.10/forge-1.7.10-10.13.4.1614-1.7.10-installer.jar -OutFile forgeInstall.jar

# Install the Mods
git lfs install
git clone https://github.com/KevinUre/Minecraft1.7.10-SMP2.git
Get-ChildItem .\Minecraft1.7.10-SMP2 | % { Copy-Item -Path $_.FullName -Destination "$Env:Appdata\.minecraft" -Force -Recurse }

# Create Launcher Profile
Push-Location "$Env:Appdata\.minecraft"
$profileFile = Get-Content .\launcher_profiles.json | ConvertFrom-Json
$newProfile = @{}
$newProfile.Add("created", "2021-10-14T14:27:39.252Z")
$newProfile.Add("gameDir", "C:\Users\$env:username\AppData\Roaming\.minecraft\1.7.10.DM900-2")
$newProfile.Add("icon", "Bookshelf")
$newProfile.Add("javaArgs", "-Xverify:none -Xmx4G -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:-UseAdaptiveSizePolicy -Xmn512M")
$newProfile.Add("lastUsed", "2021-11-28T03:06:18.589Z")
$newProfile.Add("lastVersionId", "1.7.10-Forge10.13.4.1614-1.7.10")
$newProfile.Add("name", "Kevins 1.7.10 SMP 2")
$newProfile.Add("type", "custom")
$profileFile.profiles | Add-Member -Name "DM900SMP2" -MemberType NoteProperty -Value $newProfile
ConvertTo-Json -InputObject $profileFile -Compress | Out-File .\launcher_profiles.json -Encoding ascii
Pop-Location

# Make Update link
$WshShell = New-Object -comObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Update Minecraft Mods.lnk")
$Shortcut.TargetPath = "C:\Users\$env:username\AppData\Roaming\.minecraft\powershellScripts\UpdateMinecraftMods.ps1"
$Shortcut.Save()

# Clean up after installs
Set-Location C:
Remove-Item -Recurse -Force C:\temp-minecraft
