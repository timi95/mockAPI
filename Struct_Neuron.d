import std.stdio;
import std.conv;
import std.traits;
import std.file;
import std.path;
import std.math;
import std.string;
import std.datetime;
import std.process;
import std.parallelism;

int numInputs(int a) { return a; }

//Struct neuron model [inputs, sigmoid, output]
class Neuron {

		double[] inputs;
		double[] weights;

		double output;

		double sigmoid(double input) {

			input = 1/(1+exp(input * (-1) ));
			double output = input;

			return output;
		}

	// sum the product of all weights and inputs
		double sumProd(double[] all_weights, double[] all_inputs) {

			assert(all_weights.length == all_inputs.length);
			double sum = 0.0;
	        for(int i=0;i<all_inputs.length;i++) {
	            sum += all_weights[i]*all_inputs[i];
	        }

			return sum;
		}

		double getOutput(){
			return this.output;
		}

		this(double[] weights, double[] inputs ) {
			this.inputs = inputs;
			this.weights = weights;
			// f(x) = activateFunc(sum(prod(all_weights, all_inputs)))
			this.output = sigmoid(sumProd(this.weights, this.inputs));

		}

}



class NeuralNetwork {
	Neuron[][] topology;
	Neuron[] layer;
	double[] inputs;
	double[] weights;

	// returns a neuron
	auto neuronFactory(	double[] weights, double[] inputs) {
		return new Neuron(weights, inputs);
	}

	public void setInputs(double[] inputs) { this.inputs = inputs; }
	public void setWeights(double[] weights) {this.weights = weights; }

// adds neurons to a layer
	Neuron[][] populateNetwork(int[] Sizes){ // an attempted hack in the absence of optional params (L...)(L Sizes)
		if(Sizes.length == 0)
		{
			writeln("Default initialization");
			this.layer ~= this.neuronFactory(this.inputs,this.weights);
			this.topology ~= this.layer;
		} else {
				writeln("Populating Network");
				foreach(size; Sizes){

					// adding nodes to the layer
					for(int i=0 ; i < size ; i++)
					{ this.layer ~= this.neuronFactory(this.inputs,this.weights); }

					//adding layers to the topology
					for(int j=0; j < Sizes.length ; j++)
					{ this.topology ~= this.layer; }// whatever is in the layer atm, goes in topology

					// empty layer Cache
					this.layer = [];
				}
				writeln("Populating Network complete!");
		}

		return this.topology;
	}

	void display() { // this prints out the structure of the resulting topology


		this.topology[0][0].getOutput.writeln;

		// int count = 1;
		// for ( int i=0; i < this.topology.length ;i++ ) {
		// 	writeln("\n LAYER [",i,"] ! \n");
		// 	for ( int j=0; j < this.topology[i].length ; j++, count++ ) {
		// 		write("count[",count,"] ->");
		// 		topology[i][j].getOutput.writeln;
		// 	}
		// }

	}


	this(int[] layer_sizes ) {
		this.populateNetwork(layer_sizes);
	}

}

void main()
{
	double[] weights = [0.0,0.1,0.5,1.5]; // randomize these
	double[] inputs  = [1.1,0.6,0.4,0.5];

	// Neuron n1 = new Neuron(weights, inputs);
	//
	// n1.output.writeln;
	//
	// Neuron[][] topology;
	// Neuron[] layer;

	NeuralNetwork nn = new NeuralNetwork([3,3,3]);
	nn.setWeights(weights);
	nn.setInputs(inputs);
	nn.weights.writeln;
	nn.inputs.writeln;
	nn.display();

// adding nodes to the layer
	// for(int i=0;i<10;i++)
	// {
	// 	Neuron node = new Neuron(weights, inputs);
	// 	layer ~= node;
	// }

// adding layers to the topology
	// for(int i=0;i<3;i++)
	// {
	// 	topology ~= layer;
	// 	writeln("layer length: ",topology[i].length);
	// 	writeln("number of layers: ", topology.length);
	// }
	//
	// int count = 1;
	// for ( int i=0; i<topology.length ;i++ ) {
	// 	writeln("\n LAYER [",i,"] ! \n");
	// 	for ( int j=0; j<topology[i].length ; j++, count++ ) {
	// 		write("count[",count,"] ->");
	// 		topology[i][j].getOutput.writeln;
	// 	}
	// }


}
