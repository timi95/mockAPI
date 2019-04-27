//cd Desktop	gcc  BST.c -o bst_run -lm ; clear ; ./bst_run
// -lm ~ links to math library, the only standard library requiring a manual link
//PREPROCESSOR
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>


/*
BST is a collection of nodes arranged in a way where they maintain BST properties.
Each node has a key and an associated value. 

While searching, the desired key is compared to the keys in BST,
and if found, the associated value is retrieved.

*/

struct node {
   int data;   
   struct node *leftChild;
   struct node *rightChild;
};


/*

Following are the basic operations of a tree −

		Search − Searches an element in a tree.

		Insert − Inserts an element in a tree.

		Pre-order Traversal − Traverses a tree in a pre-order manner.

		In-order Traversal − Traverses a tree in an in-order manner.

		Post-order Traversal − Traverses a tree in a post-order manner.


*/

//SEARCH OPERATION
/*
Whenever an element is to be searched, start searching from the root node. 
Then if the data is less than the key value, search for the element in the left subtree. 
Otherwise, search for the element in the right subtree. Follow the same algorithm for each node.
*/

struct node* search(int data, struct node* root){
   struct node *current = root;
   printf("Visiting elements: ");
	
   while(current->data != data){
	
      if(current != NULL) {
         printf("%d ",current->data);
			
         //go to left tree
         if(current->data > data){
            current = current->leftChild;
         }  //else go to right tree
         else {                
            current = current->rightChild;
         }
			
         //not found
         if(current == NULL){
            return NULL;
         }
      }			
   }
   
   return current;
}


//INSERT OPERATION
/*
Whenever an element is to be inserted, first locate its proper location. 
Start searching from the root node, then if the data is less than the key value, 
search for the empty location in the left subtree and insert the data. 
Otherwise, search for the empty location in the right subtree and insert the data.
*/


void insert(int data, struct node* root) {
   struct node *tempNode = (struct node*) malloc(sizeof(struct node));
   struct node *current;
   struct node *parent;

   tempNode->data = data;
   tempNode->leftChild = NULL;
   tempNode->rightChild = NULL;

   //if tree is empty
   if(root == NULL) {
      root = tempNode;
   } else {
      current = root;
      parent = NULL;

      while(1) {                
         parent = current;
			
         //go to left of the tree
         if(data < parent->data) {
            current = current->leftChild;                
            //insert to the left
				
            if(current == NULL) {
               parent->leftChild = tempNode;
               return;
            }
         }  //go to right of the tree
         else {
            current = current->rightChild;
            
            //insert to the right
            if(current == NULL) {
               parent->rightChild = tempNode;
               return;
            }
         }
      }            
   }
}

int main(){
	printf("starting the BST program...\n");

	struct node* TreeBase = malloc(sizeof(struct node));
	TreeBase->data = 2 ;

	printf("\nTreeBase data: %d \n", TreeBase->data);
	

	int val = 370;
	insert(val, TreeBase);
	insert(val-2,TreeBase);
	insert(val+2,TreeBase);
	insert(val%2,TreeBase);
	insert(val/2,TreeBase);

	printf("Result of search: ( %d ) \n", search(val, TreeBase)->data);
	printf("Result of search: ( %d ) \n", search(val/2, TreeBase)->data);
	printf("Result of search: ( %d ) \n", search(val%2, TreeBase)->data);
	printf("Result of search: ( %d ) \n", search(val+2, TreeBase)->data);
	return 0;
}






