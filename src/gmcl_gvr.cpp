#include <stdio.h>
#include <math.h>
#include <float.h>
#include "GarrysMod/Lua/Interface.h"
#include "openvr.h"

int version = 1; //every release this will be incremented, in lua, the user will be warned to update the dll if they have a lua version ahead of the module.

using namespace GarrysMod::Lua;
using namespace vr;

IVRSystem *m_pHMD;


uint32_t m_nRenderWidth;
uint32_t m_nRenderHeight;

LUA_FUNCTION( GetVersion )
{
	LUA->PushNumber(version);
	return 1;
}

LUA_FUNCTION(InitVR)
{
	EVRInitError eError = VRInitError_None;
	m_pHMD = VR_Init(&eError, VRApplication_Scene);
	if (eError != VRInitError_None)
	{
		LUA->PushBool(false);
		return 1;
	}
	m_pHMD->GetRecommendedRenderTargetSize(&m_nRenderWidth, &m_nRenderHeight);
	LUA->PushBool(true);
	return 1;
}

LUA_FUNCTION( CountDevices )
{
	LUA->PushNumber(vr::k_unMaxTrackedDeviceCount);
	return 1;
}

LUA_FUNCTION( GetDevicePose )
{
	(LUA->CheckType(1, Type::NUMBER));
	int deviceId = LUA->GetNumber(1);
	
}

LUA_FUNCTION(GetDeviceClass)
{
	(LUA->CheckType(1, Type::NUMBER));
	int deviceId = LUA->GetNumber(1);
	ETrackedDeviceClass deviceClass = VRSystem()->GetTrackedDeviceClass(deviceId);
	
	if (deviceClass == ETrackedDeviceClass::TrackedDeviceClass_HMD)
	{
		LUA->PushNumber(1); // HMD
	}
	else if (deviceClass == ETrackedDeviceClass::TrackedDeviceClass_Controller)
	{
		LUA->PushNumber(2); // controler
	}
	else 
	{
		LUA->PushNumber(0); // Unknown
	}
	return 1;
}

LUA_FUNCTION( IsHmdPresent )
{
		LUA->PushBool(VR_IsHmdPresent());
		return 1;
}

GMOD_MODULE_OPEN()
{
	LUA->PushSpecial(GarrysMod::Lua::SPECIAL_GLOB);
		LUA->CreateTable();
			LUA->PushCFunction(GetVersion); LUA->SetField(-2, "GetVersion");
			LUA->PushCFunction(InitVR); LUA->SetField(-2, "InitVR");
			LUA->PushCFunction(IsHmdPresent); LUA->SetField(-2, "IsHmdPresent");
		LUA->SetField(-2, "gvr");
	LUA->Pop();
	return 0;
}
 
GMOD_MODULE_CLOSE()
{
    return 0;
}
