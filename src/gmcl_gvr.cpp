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

LUA_FUNCTION( MyExampleFunction )
{
    if ( LUA->IsType( 1, Type::NUMBER ) )
    {
        char strOut[512];
        double fNumber = LUA->GetNumber( 1 );
        sprintf_s( strOut, "Thanks for the number - I love %f!!", fNumber );
        LUA->PushString( strOut );
        return 1;
    }

    LUA->PushString( "This string is returned" );
    return 1;
}

//
// Called when you module is opened
//
GMOD_MODULE_OPEN()
{
    //
    // Set Global[ "TextFunction" ] = MyExampleFunction
    //
    LUA->PushSpecial( SPECIAL_GLOB );        // Push global table
    LUA->PushString( "gmodvr" );			// Push Name
    LUA->PushCFunction( MyExampleFunction ); // Push function
    LUA->SetTable( -3 );                     // Set the table 

    return 0;
}

//
// Called when your module is closed
//
GMOD_MODULE_CLOSE()
{
    return 0;
}
