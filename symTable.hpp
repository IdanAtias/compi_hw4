#ifndef __SymTable__
#define __SymTable__

#include <set>
#include <string>
using namespace std;

/////////Idan- I used c++11
//////// TODO- change file name to "SymTable.hpp".

struct TableLine {
	string name;
	string type;
	int offset;
};


class SymTable {
	map<string, TableLine> table;
public:
		void insertVar(string id, string type, int offset);
		bool isVarDefined(string id) const;
		void printTable() const;  
		string getVarType(string id) const;  //Remark: probably for type chacking
};

#endif
