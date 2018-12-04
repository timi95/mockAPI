import std.stdio;
import std.random;

void main(){

    size_t n ;
    int theCase = uniform!"[]"(0,3);
    // write("\nThe result of Random: ",Random(1));
    switch(0){
        case 0:
        writeln("\nThis is the case: ",theCase,"\n");
        break;
        
        case 1:
        writeln("\nThis is the case: ",theCase,"\n");
        break;

        case 2:
        writeln("\nThis is the case: ",theCase,"\n");
        break;

        default:
        writeln("\nThis is the case: ",theCase,"\n");
        break;
    }


    writeln("Morally Good ?: ", MorallyGood(theCase));    
}
    bool MorallyGood(int theCase){
        
        return true ? (theCase == 0) || (theCase == 1) || (theCase == 2): false ;
    }