    
#include "symTable.hpp"
#include "output.hpp"

void SymTable::insertVar(string id, string type, int offset) {
	TableLine line;
	line.id = id;
	line.type = type;
	line.offset = offset;
	table.push_back(line);
	//~ this->printTable();
}

bool SymTable::isVarDefined(string id) const {
	for (vector<TableLine>::const_iterator it = table.begin(); it != table.end(); it++){
		if (it->id == id){
			return true;
		}
	}
	return false;
}

void SymTable::printTable() const {
	for (vector<TableLine>::const_iterator it = table.begin(); it != table.end(); it++){
		output::printVar(it->id.c_str(), it->offset, it->type.c_str());
	}
}

string SymTable::getVarType(string id) const {
	for (vector<TableLine>::const_iterator it=table.begin(); it != table.end(); it++){
		if (it->id == id){
			return it->type;
		}
	}
	return string("");
}
