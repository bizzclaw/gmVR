local RECIEVE_ALL = 1 // player vr fully recieved
local RECIEVE_PARTIAL = 2 // only recieve the position of the player's head and hands, no gestures.
local RECIEVE_LOWFPS = 3 // partial at a lower framerate
local RECIEVE_NONE = 4 // just appear as a regular (Non VR) player

if CLIENT then
	require("GmodVR")
else
	util.AddNetworkString("GVR_UpdatePose")


	net.Receive("GVR_UpdateTracking", function(len, ply)
		local updateRate = GVR.GetConfig("updaterate")
		local lastUpdate = ply.VRLastUpdate or 0
		if CurTime() < lastUpdate + updateRate then return false end

		for k, v in pairs(player.GetAll()) do
			local filter = GVR.GetFilter()
			if filter == RECIEVE_NONE then continue end
		end
		ply.VRLastUpdate = CurTime()
	end)
end


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
	ply.VRPose = {
		head = {
			pos = GmodVR.GetHeadsetVector(),
			ang = GmodVR.GetHeadsetAngle()
		}
	}

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
		local vrClient = GVR.UpdatePose()


	end
end

hook.Add("StartCommand", "GVR_ProcessTracking", GVR.StartCommand)
