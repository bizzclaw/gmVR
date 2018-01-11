workspace "gmcl_gvr"
    configurations { "Debug", "Release" }
    location ( "projects/" .. os.target() )

-- Directory where you've installed OVR and Source SDK Base 2013
local repoPaths = "C:/Users/bizzc/source/repos"
	
project "gmcl_gvr"
    kind         "SharedLib"
    architecture "x86"
    language     "C++"
	links {
		repoPaths.."/openvr/lib/win32/openvr_api.lib"
	}
	includedirs  {
		"include/",
		repoPaths.."/openvr/headers",
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
