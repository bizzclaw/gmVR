# gmVR
#### Garrysmod Virtual Reality
###### Joseph Tomlinson

Uses a C++ module to connect OpenVR methods with Gmod lua.

## Features

### complete
* Connect with SteamVR and tell if a headset is present

### In Progress
* __(C++)__ Get the position/angle of the HMD

### Todo
* __(C++)__ Get the position/angle of the controllers
* __(C++)__ Get the trigger/input state on the controllers
* __(C++)__ Represent the player in VR by using the SteamVR supplied variables and animating them as such
* __(GLUA)__ Picking up props
* __(GLUA)__ Simple SWEP usage
* __(GLUA/ C++)__ Rendering in VR without relying on VorpX/Virtual Desktop

## Requirements for editing
* Windows (Tested with Windows 10)
* [Visual Studio](https://www.visualstudio.com)(Tested with 2017)
* [Valve OpenVR SDK](https://github.com/ValveSoftware/openvr) (read instructions before cloning)
* [Premake 5.0+](https://github.com/premake/premake-core/releases) (must be extracted to your _C:\Windows_ folder)

## Installation
1. Clone Repo with a [git CLI](https://git-scm.com/downloads)
	```bash
	$ git clone https://github.com/bizzclaw/gmVR.git
	```

2. Clone the Valve OpenVR sdk to a folder and take note of that folder's location.
3. Create a new file called __"buildconfig.lua"__ in the project's main directory with your favorite text editor, fill it with the following:

	```LUA
	sdkPaths = "Set this as the path to the folder that contains your cloned OpenVR SDK"

	```

4. now, simply run buildprojects.bat, the batch file will generate a project folder with a visual studio project that can be loaded.

__This Guide is a work in progress, I need to test with another computer to make sure everything works as it should when tested__
