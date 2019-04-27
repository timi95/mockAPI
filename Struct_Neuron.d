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

	double sumProd(double[] all_weights, double[] all_inputs) {

		assert(all_weights.length == all_inputs.length);
		double sum = 0.0;
        for(int i=0;i<all_inputs.length;i++) {

            sum += all_weights[i]*all_inputs[i];
        }

		return sum;
	}

	this(double[] weights, double[] inputs ) {
		this.inputs = inputs;
		this.weights = weights;
		// f(x) = activateFunc(sum(prod(all_weights, all_inputs)))
		this.output = sigmoid(sumProd(weights, inputs));
		
	}

}; 


void main()
{
	double[] weights = [0.0,0.1,0.5,1.5]; // randomize these
	double[] inputs  = [1.1,0.6,0.4,0.5];

	Neuron n1 = new Neuron(weights, inputs);

	n1.output.writeln;

	Neuron[][] topology;

	
}
























