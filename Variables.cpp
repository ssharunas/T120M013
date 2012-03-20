// Variables.cpp: implementation of the Variables class.
//
//////////////////////////////////////////////////////////////////////

#include <stdlib.h>
#include <vector>
#include <string.h>
#include <stdio.h>
#include "Variables.h"

namespace Variables
{
	//private variables:
	namespace
	{
		std::vector<Variable*> vars;
		int declarationStart = -1;
	}
	
	void startDeclaration()
	{
		declarationStart = vars.size() - 1;
	}
	
	void setType(VarType::Type type)
	{
		printf("Setting type..\n");
		
		for(int i = vars.size() - 1; i > declarationStart; i--)
		{
			vars[i]->setType(type);
		}
	}
	
	Variable* Create(const char* name)
	{
		std::vector<Variable*>::iterator i;
		
		for(i = vars.begin(); i != vars.end(); ++i)
		{
			if(strcmp((*i)->getName(), name) == 0)
			{
				fprintf(stderr, "Variable '%s' was defined more than one time.\n", name);
				exit(1);
			}
		}
		
		Variable* var = new Variable(name);
		vars.push_back(var);
		return var;
	}
	
	Variable* Get(const char* name)
	{
		Variable* var = 0;
		
		std::vector<Variable*>::iterator i;
		
		for(i = vars.begin(); i != vars.end(); ++i)
		{
			if(strcmp((*i)->getName(), name) == 0)
			{
				var = *i;
				break;
			}
		}
		
		if(!var)
		{
			fprintf(stderr, "Undefined variable: %s\n", name);
			exit(1);
		}
		
		return var;
	}
}
