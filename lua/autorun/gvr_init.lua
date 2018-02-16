GVR = GVR or {}
GVR.__index = GVR

DEVICETYPE_HMD = 1
DEVICETYPE_LHAND = 2
DEVICETYPE_RHAND = 3

if SERVER then
	AddCSLuaFile("gvr/sh_tracking.lua")
	AddCSLuaFile("gvr/cl_tracking.lua")
	AddCSLuaFile("gvr/cl_render.lua")
	include("gvr/sv_config.lua")
	include("gvr/sv_tracking.lua")
else
	GVR.Set = function(enable)
		if enable then
			OpenVR.InitVR()
		end
	end

	include("gvr/cl_tracking.lua")
	include("gvr/cl_render.lua")
end
include("gvr/sh_tracking.lua")
