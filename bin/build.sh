#!/bin/bash

rm -f *.o *.c *.cpp *.hpp

lex  --outfile=formal_lex.c ../formal_lex.l   &&
yacc -d ../formal_yacc.y -o formal_yacc.cpp   &&
gcc -c formal_lex.c -I .. -o formal_lex.o     &&
g++ -c formal_yacc.cpp -I .. -o formal_yacc.o &&
g++ -c ../preprocessor.cpp -o preprocessor.o  &&
g++ -c ../Variables.cpp -o variables.o        &&
g++ *.o -o prep
