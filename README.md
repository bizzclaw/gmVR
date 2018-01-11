# gmVR
#### Garrysmod Virtual Reality
###### Joseph Tomlinson

Uses a C++ module to connect OpenVR methods with Gmod lua.

## Features

### complete
* __(C++)__ Connect with SteamVR and tell if a headset is present

### In Progress
* __(C++)__ Get the position/angle of the HMD

### Todo
* __(C++)__ Get the position/angle of the controllers
* __(C++)__ Get the trigger/input state on the controllers
* __(GLUA/ C++)__ Represent the player in VR by using the SteamVR supplied variables and animating them as such
* __(GLUA)__ Picking up props
* __(GLUA)__ Simple SWEP usage
* __(GLUA / C++)__ Rendering in VR without relying on VorpX/Virtual Desktop

## Requirements for usage

* Latest [openvr_api.dll](https://github.com/ValveSoftware/openvr/raw/master/bin/win32/openvr_api.dll)

* [SteamVR](http://store.steampowered.com/steamvr) on steam

## Usage

##### Gmod Root
Throughout this readme, a directory known as the "Garrysmod Root" or "gmod root" will be referenced for installation and usage, to find this directory, Right click on Garrysmod in steam, click "properties" select the "Local Files" Tabs and click "Browse Local Files". This will take you to the Garrysmod root.

Download the latest `openvr_api.dll` and place it directly in your gmod root, the same directory that has `hl2.exe` in it.

## Requirements for source Editing
* Windows (Tested with Windows 10)
* [Visual Studio](https://www.visualstudio.com) With Windows SDK v8.1 or higher (Tested with version 2017)
* [Valve OpenVR SDK](https://github.com/ValveSoftware/openvr) (read instructions before cloning)
* [Premake 5.0+](https://github.com/premake/premake-core/releases) extracted to your _C:\Windows_ folder, or the project directory (it will be gitignored)

## Installation for Source Editing
1. Clone Repo with a [git CLI](https://git-scm.com/downloads)
	```bash
	$ git clone https://github.com/bizzclaw/gmVR.git
	```

2. Clone the Valve OpenVR sdk to a folder and take note of that folder's location.
3. Create a new file called `"buildconfig.lua"` in the project's main directory with your favorite text editor, fill it with the following:

	*NOTE:* you cannot use backslashes for the path! You'll have to replace any "\"s with "/"s		

	```LUA
	sdkPaths = "Set this as the path to the folder that contains your cloned OpenVR SDK"

	```

4. now, simply run buildprojects.bat, the batch file will generate a project folder with a visual studio project that can be loaded.

## Compiling and Testing

* When you're ready to compile, build from visual studio and move the compiled gmcl_gvr_win32.dll from the `build` folder into your `steam/steamapps/common/garrysmod/garrysmod/lua/bin` folder

___

###### This README is a work in progress, I need to test with another computer to make sure everything works as it should when followed.

## Credits
__Datamats__ - Created the original [gmcl_openvr](https://github.com/Datamats/gmcl_openvr) that this is largely based off of and used as reference.

__Joseph (Bizz) Tomlinson__ - Lua scripting, Stringing C++ components together and finding out how to get it to work on windows.
