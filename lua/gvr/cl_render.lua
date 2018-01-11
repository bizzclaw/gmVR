function GVR.Render(ply, pos, ang, fov, znear, zfar)
	local ply = LocalPlayer()
	if not ply.VRPose then return end

	// Currently still Datamat's code, needs a bit of reworking to account for diffferent aspect ratios like ultrawide.
	local oldRT = render.GetRenderTarget()

	OpenVR.UpdateTracking()

	local vectors = ply.VRPose["head"].pos or Vector(0,0,0)
	local angles = ply.VRPose["head"].ang or Angle(0,0,0)
	if not height then
		height = vectors.y
	end
	local ang = Angle(angles.pitch*-120, angles.yaw*120+eyeang.yaw, angles.roll*-120)
	local vec = Vector(vectors.x*-50, vectors.z*50, ((vectors.y-height)*50))

	vec:Rotate(Angle(0,ang.yaw,0))

	eyepos = eyepos+Vector(0,20,20)
	eyeang = ang
	--view.fov = fov


	local dist = eyeang:Right() * dist
	dist:Rotate(Angle(0,0,ang.roll))

	--Right
	render.RenderView( {
		origin = eyepos+dist,
		angles = eyeang,
		x = 0,
		y = 0,
		w = w/part,
		h = h
	 } )
	--
	render.RenderView( {
		origin = eyepos-dist,
		angles = eyeang,
		x = w/part,
		y = 0,
		w = w/part,
		h = h
	 } )
	return true

end

hook.Add("RenderScene", "GVR_Render", GVR.Render)
