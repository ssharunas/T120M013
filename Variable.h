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
	int value;
	VarType::Type type;

public:
	
	Variable(const char *name);
	virtual ~Variable();

	int getValue();
	VarType::Type getType();

	void setType(VarType::Type type);
	void setValue(int value);
	const char* getName();
};

#define _Variable_
#endif
