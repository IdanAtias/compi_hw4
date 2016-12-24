#include "SymTable.h"
using namespace std;

void SymTable::insertVar(string id, string type, int val) {
	TableValue newValue;
	newValue.id = id;
	newValue.type = type;
	newValue.val = val;	
	table.insert(pair<string,TableValue>(id,newValue));
}

void SymTable::insertVar(string id, string type, QSMatrix<int>& matrix) {
	TableValue newValue;
	newValue.id = id;
	newValue.type = type;
	newValue.matrix = matrix;
	table.insert(pair<string,TableValue>(id,newValue));
}

bool SymTable::isVarDefined(string id) const {	
	return (table.find(id) != table.end());
}

void SymTable::printTableEntries(string id) const {
	map<string, TableValue>::const_iterator iter = table.find(id);
	if (iter != table.end()) {
		TableValue tmp = (iter->second);
		cout << tmp.id << "=" << endl;
		if (tmp.type == "int") {
			cout << tmp.val << endl;
		} else {
			tmp.matrix.printMatrix();
		}	
	}
	
}

string SymTable::getVarType(string id) const {
	map<string, TableValue>::const_iterator iter = table.find(id);
	if (iter != table.end()){
			return (iter->second).type;
	}	
	return string("");
}

int SymTable::getVarVal(string id) const {
	map<string, TableValue>::const_iterator iter = table.find(id);
	if (iter != table.end()){
			return (iter->second).val;
	}	
	return 0;
}

QSMatrix<int> SymTable::getVarMatrix(string id) const {
	map<string, TableValue>::const_iterator iter = table.find(id);
	if (iter != table.end()){
			return (iter->second).matrix;
	}		
	return QSMatrix<int>(1,1,0);
}
