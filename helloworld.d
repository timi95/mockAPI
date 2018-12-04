//dmd -de -w -run helloworld.d
import std.stdio;

void main(){
//writeln("Hello World: D Lang! \n Just following Excersises !");
writeln();
write("Hello");
write("World !");
write("\nHello Fish, \n", "Goodbye, Fish", "\nFish Goodbye, \n", "Goodbye Hello","\n",1+1);
writeln("\n-----------------\n");
writeln("Type           :", int.stringof);
writeln("Length in Bytes:", int.sizeof);
writeln("Minimum        :", int.min);
writeln("Maximum value  :", int.max);
writeln("Initial value  :", int.init);
writeln("\n-----------------\n");
writeln("Type           :", size_t.stringof);
writeln("Length in Bytes:", size_t.sizeof);
writeln("Minimum        :", size_t.min);
writeln("Maximum value  :", size_t.max);
writeln("Initial value  :", size_t.init);
writeln("\n-----------------\n");
writeln("We're swapping eh !");
int a = 10;int b = 20;
writeln("initial values : ","a:",a," b:",b);
int temp;
temp = a;
a = b;
b = temp;
writeln("Swapped values : ","a:",a," b:",b);
int studentCount;
readf(" %s",&studentCount); // add space before the %s to avoid whitespace error in the read stream
writeln(studentCount);
}