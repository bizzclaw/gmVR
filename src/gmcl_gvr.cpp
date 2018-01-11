#include <stdio.h>
#include <math.h>
#include <float.h>
#include "GarrysMod/Lua/Interface.h"
#include "openvr.h"

using namespace GarrysMod::Lua;
using namespace vr;

IVRSystem *m_pHMD;
HmdMatrix34_t HmdMatrix;

LUA_FUNCTION( IsHmdPresent )
{
	LUA->PushBool(VR_IsHmdPresent());
	return 1;
}
GMOD_MODULE_OPEN()
{
    //
    // Set Global[ "TextFunction" ] = MyExampleFunction
    //
    LUA->PushSpecial( SPECIAL_GLOB );
    LUA->PushString( "gmodvr" );
    LUA->PushCFunction( IsHmdPresent );
    LUA->SetTable( -3 );

    return 0;
}

GMOD_MODULE_CLOSE()
{
    return 0;
}
