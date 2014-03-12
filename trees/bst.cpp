#include "bst.h"

Tree::Tree() {
  head->left  = 0;
  head->right = 0;
  head->value = 0;
}

Tree::Tree(int value) {
  head->left  = 0;
  head->right = 0;
  head->value = value;
}

int Tree::top() {
  return head->value;
}

void Tree::insert(int val) {
  insert(val, head);
}

void Tree::insert(int val, Node* top) {
  Node* temp = top;
  if(temp) {
    temp->value = val;
  } else if(val < temp->value) {
    insert(val, (temp->left));
  } else {
    insert(val, (temp->right));
  }
}

void Tree::print(Node* head) {
  Node* temp = head;
  if(temp == 0) 
    return;
  if(temp->left)
    print(temp->left);
  if(temp->right)
    print(temp->right);
  std::cout << temp->value << "\n";
}

void Tree::print() {
  print(head);
}

