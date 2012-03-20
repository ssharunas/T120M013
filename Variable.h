// Variables.h: interface for the Variables class.
//
//////////////////////////////////////////////////////////////////////

#ifndef _Variable_

class VarType
{
public:
	enum Type
	{
		TYPE_INTEGER,
		TYPE_REAL
	};
};

class Variable
{
private:
	const char *name;
	double value;
	
	VarType::Type type;

public:
	
	Variable(const char *name);
	virtual ~Variable();

	double getValue();
	VarType::Type getType();

	void setType(VarType::Type type);
	void setValue(double value);
	const char* getName();
};

#define _Variable_
#endif
