#include "SymTable.hpp"
#include "output.hpp"
using namespace std;

void SymTable::insertVar(string id, int offset, string type) {
	TableLine line;
	line.id = id;
	line.offset = offset;
	line.type = type;
	
	table.insert(line);
}

bool SymTable::isVarDefined(string id) const {
	TableLine line;
	line.id = id;
	line.offset = 0; //unused
	line.type = ""; //unused
	
	return table.end() != table.find(line);
}

void SymTable::printTableEntries() const {
	for (set<TableLine, TableLineCompare>::const_iterator iter = table.begin() ; iter != table.end() ; ++iter) {
		output::printVar((iter->id).c_str(), iter->offset, (iter->type).c_str());
	}
}

std::string SymTable::getVarType(std::string id) const {
	TableLine line;
	line.id = id;
	line.offset = 0; //unused
	line.type = ""; //unused
	
	if (table.find(line) != table.end()){
			return (table.find(line))->type;
	}
	
	return string("");
}