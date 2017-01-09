#ifndef __symTable__
#define __symTable__

#include <vector>
#include <stdio.h>
#include <iostream>
#include <string>
using namespace std;

struct TableLine {
	string id;
	string type;
	int offset;
};

class SymTable {
	vector<TableLine> table;
public:
		void insertVar(string id, string type, int offset);
		bool isVarDefined(string id) const;
		void printTable() const;  
		string getVarType(string id) const;  //Remark: probably for type chacking
};

#endif
