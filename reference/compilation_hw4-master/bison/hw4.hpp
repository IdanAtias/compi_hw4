#ifndef HW4
#define HW4

#include <iostream>
#include <string>
#include <list>
#include "matrix.h"

using namespace std;

typedef struct {
	bool constVar;
	string type;
	string id;
	int val;
	QSMatrix<int> matrix;
} yystype;

#define YYSTYPE yystype

#endif
