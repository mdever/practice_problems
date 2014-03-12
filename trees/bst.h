class Tree {

struct Node {
    int value;
    Node* left;
    Node* right;
}

public:
    Tree();
    Tree(int value);
    void insert(int value);
    Node* search(int value);

private:
    Node* head;
}
