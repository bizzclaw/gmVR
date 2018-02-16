require("gvr")

TrackedDeviceClass_HMD = 1
TrackedDeviceClass_Controller = 2

local function attemptInit()
	GVR.devices = {}

	if not gvr.IsHmdPresent() then
		return false
	end

	if not gvr.InitVR() then
		return false
	end

	for i = 0, gvr.CountDevices() do
		local class = gvr.GetDeviceClass(i)
		if class != 0 then
			local device = {
				id = i,
				class = class
			}
			table.insert(GVR.devices, device)
		end
	end

	return true
end
attemptInit()

PrintTable(GVR.devices)
