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
		this.output = sigmoid(sumProd(weights, inputs));

	}
}


void main()
{
	double[] weights = [0.0,0.1,0.5,1.5]; // randomize these
	double[] inputs  = [1.1,0.6,0.4,0.5];

	Neuron n1 = new Neuron(weights, inputs);

	n1.output.writeln;

	Neuron[][] topology;
	Neuron[] layer;

// adding nodes to the layer
	for(int i=0;i<10;i++)
	{
		Neuron node = new Neuron(weights, inputs);
		layer ~= node;
	}

// adding layers to the topology
	for(int i=0;i<3;i++)
	{
		topology ~= layer;
		writeln("layer length: ",topology[i].length);
		writeln("number of layers: ", topology.length);
	}

	int count = 1;
	for ( int i=0; i<topology.length ;i++ ) {
		writeln("\n LAYER [",i,"] ! \n");
		for ( int j=0; j<topology[i].length ; j++, count++ ) {
			write("count[",count,"] ->");
			topology[i][j].getOutput.writeln;
		}
	}
	// writeln();

}
