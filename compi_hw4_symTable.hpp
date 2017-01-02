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

class TableLineCompare {
public:
	bool operator() (TableLine l1, TableLine l2) const {
		return (l1.id.compare(l2.id) < 0);
	}
};

class SymTable {
	map<string, TableLine> table;
public:
		void insertVar(string id, string type, int offset);
		bool isVarDefined(string id) const;
//		void printVar(type,offset,id) const;  // TODO: check if we need to define this function. Maybe it already defined.
		string getVarType(string id) const;  //Remark: פרםנשנךט כםר אטפק ביקבלןמע
};

#endif
