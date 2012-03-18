// Variables.cpp: implementation of the Variables class.
//
//////////////////////////////////////////////////////////////////////

#include <string.h>
#include "Variables.h"

//////////////////////////////////////////////////////////////////////
// Construction/Destruction
//////////////////////////////////////////////////////////////////////

Variables::Variables(char *name)
{
	this->name=name;
	top=this;
}

Variables::~Variables()
{

}

int Variables::getValue()
{
	return value;
}

int Variables::getValue(char *name)
{
	if (!strcmp (this->name, name)) return getValue();
		else if (top)	return top->getValue(name);
			else throw -1;
}

void Variables::setValue(int value)
{
	this->value=value;
}

void Variables::setValue(char *name, int value)
{
	if (!strcmp (this->name, name)) setValue(value);
	else if (top)	top->setValue(name,value);
			else throw -1;
}

void Variables::addVariable(Variables *v)
{
	v->top=top;
	top=v;
}