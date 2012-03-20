%union
{
	char* sval;
	int ival;
}

%{
#define YYTEXT yytext
#include <stdio.h>
#include <string.h>
#include <malloc.h>

#include "preprocessor.h"
#include "Variables.h"

extern int yylineno;
extern "C" int yylex();

//Variables *topVariable;

extern "C"    
{ 
void yyerror(const char *str)    
{    
	fprintf(stderr,"Error: %s at line %d\n",str, yylineno);
}    

int yywrap()    
{    
	return 1;    
}    
}

%}

%start program


%token <sval>	T_PROGRAM
%token <sval>	T_INTEGER
%token <sval>	T_DOUBLE
%token <sval>	T_BEGIN
%token <sval>	T_END
%token <sval>	T_INPUT
%token <sval>	T_OUTPUT
%token <sval>	T_LEFTBR
%token <sval>	T_RIGHTBR
%token <sval>	T_QUOTE
%token <sval>	T_COMA
%token <sval>	T_ASSIGNMENT
%token <sval>	T_COMAPOINT
%token <sval>	T_NAME
%token <sval>	T_VAR
%token <sval>	T_PLUS
%token <sval>	T_MULT
%token <sval>	T_TWOPOINTS
%token <sval>	T_FUNCTION_TANH

%type <sval> program
%type <sval> variable_declaration
%type <sval> variable_declaration_section

%type <sval> variable_declaration_list
%type <sval> declare_variable
%type <sval> input_variable
%type <sval> variable_input_list
%type <sval> output_variable
%type <sval> variable_output_list
%type <sval> variable_type
%type <sval> statement_list
%type <sval> statement
%type <sval> expression_statement
%type <sval> input_statement
%type <sval> output_statement
%type <ival> expression

%left T_PLUS T_MULT

%%

program: T_PROGRAM T_QUOTE T_NAME T_QUOTE T_COMAPOINT variable_declaration_section T_BEGIN statement_list T_END T_COMAPOINT ;

variable_declaration_section : variable_declaration_section variable_declaration
				| variable_declaration ;

variable_declaration: T_VAR variable_declaration_list T_TWOPOINTS variable_type T_COMAPOINT
{
	Variables::startDeclaration();
};

variable_declaration_list: variable_declaration_list T_COMA declare_variable
				| declare_variable ;

declare_variable: T_NAME {
	Variables::Create($1);
};

variable_input_list: variable_input_list T_COMA input_variable
				| input_variable ;

input_variable: T_NAME {
	int value;
	printf("\nEnter value of %s: ", $1);
	scanf("%d", &value);
	Variable* var = Variables::Get($1);
	
	var->setValue(value);
};

variable_output_list: variable_output_list T_COMA output_variable
				| output_variable ;

output_variable: T_NAME {
	Variable* var = Variables::Get($1);
	printf("\n%s = %d [type = %d] \n",$1, var->getValue(), var->getType());
};

variable_type: T_INTEGER 
{
	Variables::setType(VarType::TYPE_INTEGER);
} 
| T_DOUBLE 
{
	Variables::setType(VarType::TYPE_REAL);
};

statement_list: statement_list statement
			| statement ;

statement: expression_statement
		| input_statement
		| output_statement ;

expression_statement: T_NAME T_ASSIGNMENT expression T_COMAPOINT 
{
	Variable* var = Variables::Get($1);
	var->setValue($3);
};

input_statement: T_INPUT T_LEFTBR variable_input_list T_RIGHTBR T_COMAPOINT ;

output_statement: T_OUTPUT T_LEFTBR variable_output_list T_RIGHTBR T_COMAPOINT ;

expression: expression T_PLUS expression {
	$$=$1+$3;
}
		| expression T_MULT expression {
	$$=$1*$3;
}
		| T_NAME 
{
	Variable* var = Variables::Get($1);
	$$=var->getValue();
};

%%
