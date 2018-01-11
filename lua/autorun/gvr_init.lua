GVR = GVR or {}
GVR.__index = OpenVR

if SERVER then
	AddCSLuaFile("gvr/sh_tracking.lua")
	AddCSLuaFile("gvr/cl_render.lua")
	include("gvr/sv_config.lua")
else

	GVR.Set = function(enable)
		if enable then
			OpenVR.InitVR()
		end
	end

	include("gmvr/cl_render.lua")
end
include("gmvr/sh_tracking.lua")
