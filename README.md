# gmVR
#### Garrysmod Virtual Reality
###### Joseph Tomlinson

Uses a C++ module to connect OpenVR methods with Gmod lua.

## Features

### complete
* Connect with SteamVR and tell if a headset is present

### In Progress
* Get the position/angle of the HMD

### todo
* Get the position/angle of the controllers
* Get the trigger/input state on the controllers
*

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

3. Create a new file called __"premake5.lua"__ in the project's main directory, with your favorite text editor, fill it with the following:

```LUA
workspace "gmcl_gvr"
	configurations { "Debug", "Release" }
	location ( "projects/" .. os.target() )

-- Directory where you've installed OVR and Source SDK Base 2013
local sdkPath = "SDK_PATH"

project "gmcl_gvr"
	kind         "SharedLib"
	architecture "x86"
	language     "C++"
links {
	sdkPath.."/openvr/lib/win32/openvr_api.lib"
}
includedirs  {
	"include/",
	sdkPath.."/openvr/headers",
}
	targetdir    "build"
	symbols      "On"

	if os.istarget( "windows" ) then targetsuffix "_win32" end
	if os.istarget( "macosx" )  then targetsuffix "_osx"   end
	if os.istarget( "linux" )   then targetsuffix "_linux" end

	configuration "Debug"
			optimize "Debug"

	configuration "Release"
			optimize "Speed"
			flags    "StaticRuntime"

	files
	{
			"src/**.*",
	"include/**.*"
	}

```
4 . on line 6, change
```LUA
	local sdkPath = "SDK_PATH"
```
to the directory that has your OpenVR SDK in it (Later, I'll be adding requirements for newer SDKs like the Oculus and Source ones.)
```Lua
	local sdkPath = "C:/Users/bizzc/desktop/SDKs" -- my SDKs path
```
now, simply run buildprojects.bat, the batch file will generate a project folder with a visual studio project that can be loaded.

__This Guide is a work in progress, I need to test with another computer to make sure everything works as it should when tested__
