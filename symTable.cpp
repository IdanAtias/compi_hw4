    
#include "symTable.hpp"
#include "output.hpp"

void SymTable::insertVar(string id, string type, int offset) {
	TableLine line;
	line.name = id;
	line.type = type;
	line.offset = offset;
	table.insert(std::pair<string, TableLine>(id, line));
	//~ this->printTable();
}

bool SymTable::isVarDefined(string id) const {
	return table.end() != table.find(id);
}

void SymTable::printTable() const {
	for (map<string, TableLine>::const_iterator iter = table.begin() ; iter != table.end() ; ++iter) {
		output::printVar((iter->first).c_str(), iter->second.offset, (iter->second.type).c_str());
	}
}

string SymTable::getVarType(string id) const {

	if (table.find(id) != table.end()){
			return (table.find(id))->second.type;
	}
	
	return string("");
}