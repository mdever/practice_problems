#include "bst.h"

Tree::Tree() {
  head = new Node();
  head->left  = 0;
  head->right = 0;
  head->value = 0;
}

Tree::Tree(int value) {
  head = new Node();
  head->left  = 0;
  head->right = 0;
  head->value = value;
}

int Tree::top() {
  return head->value;
}

void Tree::insert(int val) {
  insert(val, &(this->head));
}

void Tree::insert(int val, Node** top) {
    if(!(*top)) {
        (*top) = new Node();
        (*top)->left  = 0;
        (*top)->right = 0;
        (*top)->value  = val;
    } else if(val < (*top)->value)
        insert(val, &((*top)->left));
      else if(val > (*top)->value) 
        insert(val, &((*top)->right));  
      else { /* Eventually throw error or return sentinel value */ }
}

void Tree::print() const {
  print(head);
}

void Tree::print(const Node* head) {
  Node* runner = head;
  if(runner == 0) 
    return;
  if(runner->left)
    print(runner->left);
  if(runner->right)
    print(runner->right);
  std::cout << runner->value << "\n";
}


