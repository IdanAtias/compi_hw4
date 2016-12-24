#ifndef _PRINT_ERROR_H
#define _PRINT_ERROR_H

#include <string>

typedef enum { 
		LexicalError, SyntaxError, ArgumentTypeMismatch, MatrixSemanticError, 
		ScalarExpected, MatrixExpected, DivisionByZero, ArgumentSizeMismatch, 
		PositiveNumberExpected, ConstantExpressionExpected, UndefinedVariable, 
		RedefinedVariable, IndexOutOfBounds, GeneralSemanticError 
	} ErrorCode;
	
typedef enum { TypeInt, TypeMatrix } ArgumentType;
	// Use this for all errors except ArgumentTypeMismatch, ArgumentSizeMismatch, UndefinedVariable, RedefinedVariable, and IndexOutOfBounds
void printError(ErrorCode code);

	// Use this only for ArgumentTypeMismatch
void printError(ErrorCode code, std::string op, ArgumentType leftArg, ArgumentType rightArg);

	// Use this only for ArgumentSizeMismatch
void printError(ErrorCode code, std::string op, int leftArgSize, int rightArgSize);

	// Use this only for UndefinedVariable and RedefinedVariable
void printError(ErrorCode code, std::string name);

	// Use this only for IndexOutOfBounds
void printError(ErrorCode code, std::string name, int index);

#endif

