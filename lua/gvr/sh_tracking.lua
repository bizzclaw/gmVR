local RECIEVE_ALL = 1 -- player vr fully recieved
local RECIEVE_PARTIAL = 2 -- only recieve the position of the player's head and hands, no gestures.
local RECIEVE_LOWFPS = 3 -- partial at a lower framerate
local RECIEVE_NONE = 4 -- just appear as a regular (Non VR) player

function GVR.GetFilter(plyInVR, ply)
	if plyInVR == ply then return false end
	local plyInVRPos = plyInVR:GetPos()
	local dist = plyInVRPos:Distance(ply)

	if (SERVER and not ply:TestPVS(plyInVRPos)) or dist > 2048 then
		return RECIEVE_NONE
	elseif dist >= 1024 then
		return RECIEVE_LOWFPS
	elseif dist >= 512 then
		return RECIEVE_PARTIAL
	else
		return RECIEVE_ALL
	end
end

function GVR.UpdatePose(ply)
	if SERVER or ply != LocalPlayer() then return false end
	ply.VRPose = {}

	for id, device in pairs(GVR.Device.List) do
		local index = device.deviceType
		ply.VRPose[index] = device.updatePose()
	end

	net.Start("GVR_UpdatePose")
	net.WriteTable(ply.VRPose)
	net.SendToServer()
	return true
end

function GVR.GetVRPose(ply)
	return ply.VRPose or false
end

function GVR.StartCommand(ply, cmd)
	if ply.InVR then
		GVR.UpdatePose()

		if ply.VRPose then

		end
	end
end

hook.Add("StartCommand", "GVR_ProcessTracking", GVR.StartCommand)
