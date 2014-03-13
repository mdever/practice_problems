#include "bst.h"
#include <iostream>

int main(int argc, char* argv[]) {

  Tree myTree(5);
  myTree.insert(4);
  myTree.insert(6);
  myTree.insert(10);
  myTree.insert(24);
  myTree.print();

  return 0;  
}
