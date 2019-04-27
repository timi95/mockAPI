//cd Desktop	gcc  Struct_Neuron.c -o mySNeuron -lm ; clear ; ./mySNeuron
// -lm ~ links to math library, the only standard library requiring a manual link
//PREPROCESSOR
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>

int numInputs(int a){return a;}
double sigmoid(double input)
{
	input = 1/(1+exp(input * (-1) )); // check the exponential function in C
	double output = input;
	
return output;
}

//Struct neuron model [inputs, sigmoid, output]
struct ANN_Node {
	// Number of inputs into the neuron
   int   numInputs;//numInputs = numInputs(a);
   //Value of each weight.
   double *weights;
   //output after transfer function and summation of weights is applied
   double output;
   //double (*sigmoid)(double); // instant segfault, functions like to be outside of structs
   struct ANN_Node *next;
}; 


struct ANN_Node* ANN_Init_Node(int a)
{
	//create one node and allocate memory for it
	struct ANN_Node * node = malloc(sizeof(struct ANN_Node));
	node->numInputs = a; //initialize its inputs
	
	node->weights = malloc(sizeof(double)*a); // look at this once more
	for(int i=0;i < a; i++)
	{
		float x = (float)rand()/(float)(RAND_MAX/1);//random float values between 0 and 1
		node->weights[i] = x;//initialize with random values
	}
	
	return node; 
}

void push_ANN_Node(struct ANN_Node** head,int numWeights)
{
	struct ANN_Node* newNode =  ANN_Init_Node(numWeights);
	
	newNode->numInputs=numWeights;
	newNode->next=*head;
	
	*head = newNode;
}

int lengthOfList(struct ANN_Node *head)
{
	struct ANN_Node* current=head;
	int lengthOfNode=0;
	while(current != NULL)
	{
		lengthOfNode++;
		current=current->next;
	}
	return lengthOfNode;
}

//THIS CONVERTS A LIST INTO AN ARRAY!
struct ANN_Node **arrayOfList(struct ANN_Node *listP)
{
	int i = lengthOfList(listP) ; //make i the length of the list
	struct ANN_Node **ptr =  malloc(sizeof(struct ANN_Node *) *i);
	for(i=0;listP != NULL;listP=listP->next,i++)
	{ ptr[i] = listP; }
	return ptr;
}
///////////////the blackbox of neurons/////////////////
//for a fully connected  network, 'numWeights' can be the number of neurons in the preceding layer	
double  bb_ANN(int num_Weights, int num_Layers, int num_Nodes, double * inputs)
{
	
	//create an array that will hold pointers
	struct ANN_Node *layer[num_Layers];
	//create an array of nodes
	struct ANN_Node ***arr = malloc(sizeof(struct ANN_Node **) *num_Layers);
	//initialize Nodes
	for(int i=0;i<num_Layers;i++)
 	{	
		layer[i] = ANN_Init_Node(num_Weights); // layer heads
		for(int j=0; j<num_Nodes;j++)
		{ push_ANN_Node(&layer[i],num_Weights); }//push nodes into each layer head
		arr[i] = arrayOfList(layer[i]); // converting each list into an array, then each embedding into arr[] 
	}
	
	////////////// f(x) = sum(prod(all_weights, all_inputs))
	printf("\nf(x) = sum(prod(all_weights, all_inputs))\n\n");
	for(int i=0; i< num_Layers; i++)
	{ for(int j=0; j< num_Nodes;j++)
		{ for(int k=0; k< (double) sizeof(double*)/sizeof(arr[i][j]->weights[k]); k++)
			{
				arr[i][j]->weights[k]+= arr[i][j]->weights[k] * inputs[i];
				printf("f(x):%f ", arr[i][j]->weights[k] * inputs[i]);	
			} 
		} 
		printf("\n");
	}
	double outputs = sigmoid(arr[0][0]->weights[0]);
	// ^ testing the formed array structure and making a fully connected networks from it
	return outputs;
}

//////// ^^^ /////////
int main(int argc) 
{
	srand(time(NULL));//seed random values

	//black box testing
	//printf("\n Black Box testing ! ... \n");
	int val = 3;
	int numWeights2 = val;
	int num_Layers = val;
	int num_Nodes = val;
	int num_Inputs = val; 

	double *inputs;
	inputs = malloc(num_Inputs * sizeof(double));
	for(int i=0;i<num_Inputs;i++) //(struct ANN_Node **) malloc(sizeof(struct ANN_Node *) *i)
	{
		inputs[i]= (double)rand()/(double)(RAND_MAX/1);//problem here
		printf("input value->: %f \n",inputs[i]);
		// printf("hello");
	} printf("\n< - - s p a c i n g - - >\n \n");
	  

	//create an array that will hold pointers
	struct ANN_Node** layer = malloc(sizeof(struct ANN_Node* ) *num_Layers);
	
	//create an array of nodes
	struct ANN_Node **arr = (struct ANN_Node **) malloc(sizeof(struct ANN_Node *) *num_Layers);

	printf("\n bb_ANN output: %f \n",bb_ANN(numWeights2, num_Layers, num_Nodes, inputs)); 
			
	return 0;
}

