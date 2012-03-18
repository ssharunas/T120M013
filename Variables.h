// Variables.h: interface for the Variables class.
//
//////////////////////////////////////////////////////////////////////

#if !defined(AFX_VARIABLES_H__0D6ACE83_4E09_11D6_A26D_00201888F2BD__INCLUDED_)
#define AFX_VARIABLES_H__0D6ACE83_4E09_11D6_A26D_00201888F2BD__INCLUDED_

#if _MSC_VER > 1000
#pragma once
#endif // _MSC_VER > 1000

class Variables  
{

	char *name;
	int value;

public:
	Variables(char *name);
	virtual ~Variables();

	int getValue();
	int getValue(char *name);

	void setValue(int value);
	void setValue(char *name, int value);
	void addVariable(Variables *v);
	Variables *top;

};

#endif // !defined(AFX_VARIABLES_H__0D6ACE83_4E09_11D6_A26D_00201888F2BD__INCLUDED_)
