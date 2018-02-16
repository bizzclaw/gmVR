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
