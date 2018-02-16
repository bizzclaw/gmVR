GVR.Device = GVR.Device or {
	List = {}
}
GVR.Device.__index = GVR.Device

GVR.Device.new = function(id, deviceType)
	local newDevice = {
		Id = id,
		DeviceType = deviceType,
	}
	setmetatable(newDevice, GVR.Device)
	table.insert(GVR.Device.List, newDevice)
end

function GVR.Device:getType()

end

function GVR.Device:updatePose()


end

require("gvr")

TrackedDeviceClass_HMD = 1
TrackedDeviceClass_Controller = 2

local function attemptInit()
	table.Empty(GVR.Device.List)

	if not gvr.IsHmdPresent() then
		return false
	end

	if not gvr.InitVR() then
		return false
	end

	for i = 0, gvr.CountDevices() do
		local class = gvr.GetDeviceClass(i)
		if class != 0 then

			local role = gvr.GetDeviceRole(i)
			local deviceType
			if class == 1 then
				deviceType = DEVICETYPE_HMD
			elseif role == 1 then
				deviceType = DEVICETYPE_LHAND
			elseif role == 2 then
				deviceType = DEVICETYPE_RHAND
			else
				continue
			end

			GVR.Device.new(i, deviceType)
		end
	end

	return true
end
GVR.isReady = attemptInit()

PrintTable(GVR.Device.List)
