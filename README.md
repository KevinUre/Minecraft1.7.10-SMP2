# My Minecraft Modpack

This repo is everything you need to play on one of my modded minecraft servers

## How to Install

Sadly the install script is broken right now so buckle up.

### Install Git

[Download and install Git](https://gitforwindows.org/). Default settings should be fine but make sure you enable **LFS** if asked.

Once complete open a command prompt and run `git lfs install`

### Install 64-bit Java

By default java does some annoying shit like auto update, or claim the computer needs to restart, we can disable all of that by installing it with a config. [Download and install the 64-bit version of the java runtime environment](https://javadl.oracle.com/webapps/download/AutoDL?BundleId=245807_df5ad55fdd604472a86a45a217032c7d). Take these contents and put them in a file called `java.cfg` in the same directory as the downloaded installer.
```
INSTALL_SILENT=Enable
AUTO_UPDATE=Disable
REBOOT=Disable
NOSTARTMENU=Enable
WEB_ANALYTICS=Disable
```
Open a powershell in that directory and run `.\jre64.exe INSTALLCFG="$pwd\java.cfg"`

### Minecraft installer & 1.7.10

This modpack needs the **old** minecraft launcher, the new one will not work. [Download it here](https://launcher.mojang.com/download/MinecraftInstaller.msi). 

After installing the launcher run it. Log into your account and make sure to decline the upgrade to the new launcher. Make a profile for `1.7.10` and run it to download the base game. 

Once at the main menu just close minecraft.

### Clone the Modpack

The modpack cannot be cloned directly into your `.minecraft` because the directory is not empty and git is particular. [clone the repo](https://github.com/KevinUre/Minecraft1.7.10-SMP2) to a temp directory. 

once cloned take the entire contents of the directory (including the .git directory which may be hidden) and past them into/over top of your `.minecraft`. The directory should be at `%appdata%\.minecraft`.

### Forge 

The installer for forge should now be in your `.minecraft` directory (forge-1.7.10-10.13.4.1614-1.7.10-installer.jar). run it and select OK (we want a client install).

### Profile Setup

Open the launcher and sign in if required. Make a new profile for the modpack. Select Version `release 1.7.10-Forge10.13.4.1614-1.7.10` from the dropdown (at the very bottom). set the game directory to `C:/Users\Death\AppData\Roaming\.minecraft\1.7.10.DM900-2` (but with your username instead of mine). Under java Executable make sure to set this to your 64-bit java install. if you installed at the default location its `C:\Program Files (x86)\Common Files\Oracle\Java\javapath\javaw.exe`. Under more options Set the JVM Args to the following: `-Xverify:none -Xmx4G -XX:+UseConcMarkSweepGC -XX:+CMSIncrementalMode -XX:-UseAdaptiveSizePolicy -Xmn512M`

Launching this profile should load 80-some mods, if this happens you are ready :)
