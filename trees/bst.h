#ifndef BST_H 
#define BST_H

#include <iostream>


/***********************************************************
/*  A binary search tree implemented in a C++ class. The 
/*  Tree class is essentially a container holding a 
/*  private pointer to the head Node* of the tree. All of 
/*  public interface functions act on the private tree. 
/*  Manipulating the tree structure directly is no allowed.
/*  You must use the public API.
/*
/*  Eventually, I would like to make this a Tree of 
/*  IComparable objects. Objects implementing the 
/*  IComparable interface would have to implement the 
/*  bool greaterThan(IComparable) and lessThan(IComparable)
/*  methods. In this way, any object could be stored in
/*  the search tree as long as there was a way to compare
/*  it to other IComparable objects 
/*********************************************************/

class Tree {

  struct Node {
    int value;
    Node* left;
    Node* right;
  };

public:
  Tree();
  Tree(int value);
  void insert(int val);  
  Node* search(int val);
  int top();
  void print() const;

private:
  Node* head;
  void insert(int val, Node** top);
  void print(const Node* head);
};

#endif // BST_H
