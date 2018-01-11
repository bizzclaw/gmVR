#include <stdio.h>
#include <math.h>
#include <float.h>
#include "GarrysMod/Lua/Interface.h"
#include "openvr.h"

int version = 1; //every release this will be incremented, in lua, the user will be warned to update the dll if they have a lua version ahead of the module.

using namespace GarrysMod::Lua;
using namespace vr;

IVRSystem *m_pHMD;
HmdMatrix34_t HmdMatrix;

LUA_FUNCTION( GetVersion )
{
	LUA->PushNumber(version);
	return 1;
}

LUA_FUNCTION( IsHmdPresent )
{
		LUA->PushBool(VR_IsHmdPresent());
		return 1;
}

GMOD_MODULE_OPEN()
{
    LUA->PushSpecial( SPECIAL_GLOB );
    LUA->PushString( "gmodvr" );
	LUA->PushCFunction( GetVersion );
	LUA->PushCFunction( IsHmdPresent );
    LUA->SetTable( -3 );

    return 0;
}

GMOD_MODULE_CLOSE()
{
    return 0;
}
