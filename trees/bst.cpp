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
  Node* temp = head;
  print(temp);
}

