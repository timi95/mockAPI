//dmd -de -w -run logic.d
import std.stdio;

void main(){

    bool existsCoffee = true;
    bool existsTea = true;
    bool existsCookie = false;
    bool existsScone =true;

    writeln("There is warmdrink: ",existsCoffee || existsTea); // *OR* logic
    writeln("There is warmdrink: ",existsCoffee && existsTea); // *AND* logic
    writeln("There is warmdrink: ",existsCoffee ^ existsTea); // *XOR* logic
    writeln("\nGROUPING EXPRESSIONS\n------------------\n");
    writeln("I am happy: ",(existsCoffee || existsTea) && (existsCookie || existsScone));
    
    
    // (without any paranthesis)Order of precedence, as in C,'&&' takes precedence and thus is evaluated first !
    writeln("I am happy: ",existsCoffee || existsTea && existsCookie || existsScone); // equivalent logic : existsCoffee || (existsTea && existsCookie) || existsScone

    int value = 19;
    writeln("is between: ", 10 < value && value < 20);
    writeln("\nIF BLOCKS\n------------------\n");
    // If block and its scope

    if (existsCoffee)
    {
                writeln("Drink coffee");
        writeln("Write code");
    }
    else if(!existsCoffee)
    {
                writeln("Whine about no coffee");
        writeln("Drink water");
    }
}