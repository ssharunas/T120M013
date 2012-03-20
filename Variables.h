
#include "Variable.h"

#ifndef _Variables_
#define _Variables_

namespace Variables
{
	void startDeclaration();
	void setType(VarType::Type type);
	
	Variable* Create(const char* name);
	Variable* Get(const char* name);
}

#endif 
