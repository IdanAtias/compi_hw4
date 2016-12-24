#ifndef __SymTable__
#define __SymTable__

#include <map>
#include <string>
#include <iostream>
#include "matrix.h"
using namespace std;

class TableValue {
public:
	string id;
	string type;
	int val;
	QSMatrix<int> matrix;	
};


class SymTable {
	map<string, TableValue> table;
public:
		void insertVar(string id, string type, int val);
		void insertVar(string id, string type, QSMatrix<int>& matrix);
		bool isVarDefined(string id) const;
		void printTableEntries(string id) const;
		string getVarType(string id) const;
		int getVarVal(string id) const;
		QSMatrix<int> getVarMatrix(string id) const;
};

#endif