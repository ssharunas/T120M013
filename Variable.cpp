#include <string.h>
#include <stdio.h>
#include "Variable.h"

Variable::Variable(const char *name)
	: type(VarType::TYPE_INTEGER)
{
	this->name=name;
}

Variable::~Variable()
{

}

double Variable::getValue()
{
	return value;
}

VarType::Type Variable::getType()
{
	return type;
}

void Variable::setValue(double value)
{
	this->value=value;
}

void Variable::setType(VarType::Type type)
{
	this->type = type;
}

const char* Variable::getName()
{
	return name;
}
