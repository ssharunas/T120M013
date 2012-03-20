%{
#include <stdio.h>
#include <string.h>

#include "formal_lex.h"
#include "formal_yacc.hpp"

%}

%option yylineno

white [\n\r\t\b ]

digit [0-9]
letter [a-zA-Z_]
name {letter}({letter}|{digit})*

%%

{white}*program {
	yylval.sval=strdup(yytext);
	return T_PROGRAM;
	}
{white}*var {
	yylval.sval=strdup(yytext);
	return T_VAR;
	}
{white}*integer {
	yylval.sval=strdup(yytext);
	return T_INTEGER;
	}
{white}*double {
	yylval.sval=strdup(yytext);
	return T_DOUBLE;
	}
	
{white}*begin {
	yylval.sval=strdup(yytext);
	return T_BEGIN;
	}

{white}*end {
	yylval.sval=strdup(yytext);
	return T_END;
	}
	
{white}*input {
	yylval.sval=strdup(yytext);
	return T_INPUT;
	}
	
{white}*output {
	yylval.sval=strdup(yytext);
	return T_OUTPUT;
	}

{white}*tanh {
	yylval.sval=strdup(yytext);
	return T_FUNCTION_TANH;
	}
	
{white}*\({white}* 	{
	yylval.sval=strdup(yytext);
	return T_LEFTBR;
	}
{white}*\){white}* 	{
	yylval.sval=strdup(yytext);
	return T_RIGHTBR;
	}
	
{white}*\+{white}* 	{
	yylval.sval=strdup(yytext);
	return T_PLUS;
	}
	
{white}*\*{white}* 	{
	yylval.sval=strdup(yytext);
	return T_MULT;
	}

\' 	{
	yylval.sval=strdup(yytext);
	return T_QUOTE;
	}	
	
{white}*\,{white}* 	{
	yylval.sval=strdup(yytext);
	return T_COMA;
	}	
	
{white}*:={white}* 	{
	yylval.sval=strdup(yytext);
	return T_ASSIGNMENT;
	}

{white}*:{white}* 	{
	yylval.sval=strdup(yytext);
	return T_TWOPOINTS;
	}

{white}*;{white}* 	{
	yylval.sval=strdup(yytext);
	return T_COMAPOINT;
	}

{name}	{
	yylval.sval=strdup(yytext);
	return T_NAME;
	}

%%
