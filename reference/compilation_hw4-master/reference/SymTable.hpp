#ifndef __SymTable__
#define __SymTable__

#include <set>
#include <string>

struct TableLine {
	std::string id;
	int offset;
	std::string type;
};

class TableLineCompare {
public:
	bool operator() (TableLine l1, TableLine l2) const {
		return (l1.id.compare(l2.id) < 0);
	}
};

class SymTable {
	std::set<TableLine, TableLineCompare> table;
public:
		void insertVar(std::string id, int offset, std::string type);
		bool isVarDefined(std::string id) const;
		void printTableEntries() const;
		std::string getVarType(std::string id) const;
};

#endif