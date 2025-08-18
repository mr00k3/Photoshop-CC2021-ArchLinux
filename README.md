# Photoshop-CC2021-ArchLinux
# Dont use it now script is not ready now
### In this fork i will focus on Arch Linux installation of ps21 and some improvements to install script
### Updated fork. **MUST DOWNLOAD** manually the file AdobePhotoshop2021.tar.xz
### Make sure you place AdobePhotoshop2021.tar.xz in the same directory as this script

#### **Refer to this [GitHub comment](https://github.com/LinSoftWin/Photoshop-CC2022-Linux/pull/128#issuecomment-3172556015) for a download source**

-  **SHA256 SUM for checking file authenticity:** 8321b969161f2d2ad736067320d493c5b6ae579eaab9400cd1fda6871af2c033


## Important

#### PLEASE WHEN OPENING AN ISSUE FILL THE TEMPLATE OR GIVE ENOUGHT INFORMATION !!! "It doesn't work" ISN'T ENOUGH **

**DISCLAIMER:**
**Please use this software only if you have an active Photoshop subscription. I'm not responsable of any use without subscription.**

This git repo contains an installer for photoshop CC 2021 on linux with wine.

[CC 2021](https://github.com/MiMillieuh/Photoshop-CC2022-Linux/releases/tag/2.1.3) Works almost like on Windows

![Screenshot from 2022-05-17 00-02-27](https://user-images.githubusercontent.com/52078885/168690419-274020b0-c993-4b86-a58f-f0f07237aa4f.png)

*File download is about 2GB*

## Requirements

- wine
- zenity
- appmenu-gtk-module
- tar
- wget
- curl
- All R/W rights on your home folder and the installer folder
- Vulkan capable GPU or APU (Older GPUs might encounter [This issue #100](https://github.com/MiMillieuh/Photoshop-CC2022-Linux/issues/100))
(Wine 8.0+ are causing an issue with the windows version see workaround [here](https://github.com/MiMillieuh/Photoshop-CC2022-Linux/issues/94#issuecomment-1426776219))

## Usage: 

**CLI:**

`sh photoshop2021install.sh /path/to/your/install/folder`

**Camera Raw**
You can install Camera Raw this way:

`curl -L "https://download.adobe.com/pub/adobe/photoshop/cameraraw/win/12.x/CameraRaw_12_2_1.exe" > CameraRaw_12_2_1.exe` <br>
`WINEPREFIX=/Path/To/Your/Photoshop/Install/Adobe-Photoshop wine CameraRaw_12_2_1.exe`

To use camera raw you need to change a settings
Edit -> preferences -> Camera raw... -> performance -> Use graphic processor: Off

If camera raw is sometimes grayed out, just go to: Edit -> preferences -> Tools, and uncheck show Tooltips.


**Uninstalling:**

To uninstall remove the photoshop desktop file in *~/.local/share/applications/* then your installation folder


## Special thanks to
- The WineHQ team: For making wine
- LinSoftWin: For Photoshop-CC2022-Linux
- Gictorbit: For initial inspiration
- HansKristian-Work: For making VKD3D-Proton
- Adobe: For making Photoshop (also please release an official version for linux...)