#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// Forward Declarations
struct Node {
  int value;
  Node* next;
};
Node* init_list(int length);
Node* reverse_list(Node* head);


/*****************************************************************************************************/


int main(int argc, char* argv[]) {
  if(argc < 2 || argc > 3) {
    printf("Please run again with the length of your linked list\n");
    return -1;
  }

  if(atoi(argv[1]) > 5000000) {
    printf("\nTry to choose a smaller number, you don't want to freeze up your computer do you?\n\n");
    return -1;
  }

  char* verbose_flag = "-v";
  Node* head = init_list(atoi(argv[1]));

  Node* test = new Node();

  int i = 0;
  Node* temp = head;

  if(argc == 3 && strcmp(argv[2], verbose_flag) == 0) {
      while(temp) {
	printf("Value of Node %d is: %d\n", i+1, temp->value);
	temp = temp->next;
	i++;
      }
      i = 0;
      printf("\nNow lets reverse it\n\n");
  }
  
  head = reverse_list(head);

  if(argc == 3 && strcmp(argv[2], verbose_flag) == 0) {
      while(head) {
        printf("Value of Node %d is: %d\n", i+1, head->value);
        head = head->next;
        i++;
      }
  }

  printf("\nSuccessful Termination\n");
  return 0;
}


/***************************************************************************************************/


// Function Definitions

Node* init_list(int length) {
  Node* head = new Node();
  Node* index;
  index = head;
  int i = 0;
  for(; i < length-1; i++) {
    index->value = i+1;
    index->next = new Node();
    index = index->next;
  }
  index->value = i+1;

  return head;
}

Node* reverse_list(Node* head) {
  
  if(head == 0) // Empty list was passed in
    return 0;

  Node*     temp;
  Node* previous;
  Node* start = head;

  while(start) {
    temp = start->next;
    start->next = previous;
    previous = start;
    start = temp;
  }

  head->next = 0;   // Remember to NULL out our last Node->next field;
  head = previous;  // Set the address of head to the new first node

  return head;
}
