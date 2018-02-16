local VRC = {}

VRC["updaterate"] = 1 / 25

function GVR.GetConfig(id)
	return VRC[id]
end
