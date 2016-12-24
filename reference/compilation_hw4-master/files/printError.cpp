
#include <iostream>
#include <map>
#include <string>
#include <assert.h>
#include "printError.h"

using std::cout;
using std::endl;
using std::map;

using std::string;


static map<ErrorCode, string> initError();
static map<ArgumentType, string> initArg();

static map<ErrorCode, string> error = initError();
static map<ArgumentType, string> argType = initArg();



 //Use this for all errors except ArgumentTypeMismatch, ArgumentSizeMismatch, UndefinedVariable, RedefinedVariable, and IndexOutOfBounds
void printError(ErrorCode code){	
	assert(code != ArgumentTypeMismatch && code != ArgumentSizeMismatch);
	assert(code != UndefinedVariable && code != RedefinedVariable);
	assert(code != IndexOutOfBounds);
	cout << error[code] << endl;
}

// Use this only for ArgumentTypeMismatch
void printError(ErrorCode code, std::string op, ArgumentType leftArg, ArgumentType rightArg){	
	assert(code == ArgumentTypeMismatch);
	cout << error[code] << " with operation " << op << ". left argument " << argType[leftArg] 
		 << " and right argument " << argType[rightArg] 
		 << endl;
}

// Use this only for ArgumentSizeMismatch
void printError(ErrorCode code, std::string op, int leftArgSize, int rightArgSize){
	assert(code == ArgumentSizeMismatch);
	cout << error[code] << " with operation " << op << ". left argument size " << leftArgSize
		 << " and right argument size " << rightArgSize
		 << endl;
}

// Use this only for UndefinedVariable and RedefinedVariable
void printError(ErrorCode code, std::string name){
	assert(code == UndefinedVariable || code == RedefinedVariable);
		cout << error[code] << name
		 << endl;
	}

// Use this only for IndexOutOfBounds
void printError(ErrorCode code, std::string name, int index){
	assert(code == IndexOutOfBounds);
		cout << error[code] << " in var " << name << " with index " << index
		 << endl;

}

 map<ErrorCode, string> initError(){
	map<ErrorCode, string> m;
	 m[LexicalError]="LexicalError";
	 m[SyntaxError]="SyntaxError";
	 m[ArgumentTypeMismatch]="ArgumentTypeMismatch";
	 m[MatrixSemanticError]="MatrixSemanticError";
	 m[ScalarExpected]="ScalarExpected";
	 m[MatrixExpected]="MatrixExpected";
	 m[DivisionByZero]="DivisionByZero";
	 m[ArgumentSizeMismatch]="ArgumentSizeMismatch";
	 m[PositiveNumberExpected]="PositiveNumberExpected";
	 m[ConstantExpressionExpected]="ConstantExpressionExpected";
	 m[UndefinedVariable]="UndefinedVariable";
	 m[RedefinedVariable]="RedefinedVariable";
	 m[IndexOutOfBounds]="IndexOutOfBounds";
	 m[GeneralSemanticError]="GeneralSemanticError";
	 return m;
}

 map<ArgumentType, string> initArg(){

	map<ArgumentType, string> m;
	 m[TypeInt]="TypeInt";
	 m[TypeMatrix]="TypeMatrix";
	 return m;
}