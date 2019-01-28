import std.stdio;
import std.conv;
import std.traits;
import std.file;
import std.path;
import std.math;
import std.string;
import std.array;
import std.regex;
import std.datetime;

/*
 Create a File Database, to which Tuple operations will be written to;
 Build objects from File Database to be operated upon whilst program runs;
 Create Asynchronous function for  writing to file database whilst operating the API;
*/
class UserDetail{
    string userName;
    string userAge;
    string[] userContacts;
    
    double money;
    this(string userName, string userAge, string[] userContacts, double money, double total_money){
        this.userName = userName;
        this.userAge = userAge;
        this.userContacts = userContacts;
        this.money = money;
        assert(money < total_money);
        writeln("\n\nUserDetail object has been initialised successfully! \n\n");
    }
// REFLECTION IMPLEMENT
    // string call(string methodName, string[] args){
    //     method_switch: switch(methodName){
    //         static foreach(inspecting; __traits(allMembers, typeof(this))){
    //             case inspecting:
    //                 static if(isCallable!(__traits(getMember, this, inspecting))){
    //                     auto callable = &__traits(getMember, this, inspecting);

    //                     Parameters!callable arguments;
    //                     foreach(i, ref arg; arguments){
    //                         static if(__traits(compiles, to!(typeof(arg)) (args[i])))
    //                             arg = to!(typeof(arg))(args[i]);
    //                         else
    //                             throw new Exception("method "~methodName~"not callable with this reflection code because of incompatible argument type");
    //                     }
    //                     static if(is(ReturnType!callable == void)) {
    //                         callable(arguments);
    //                         return null;
    //                     } else 
    //                     { return to!string(callable(arguments)); }
    //                 }
    //             break method_switch;
    //         }
    //         default:
    //             throw new Exception("not such method" ~ methodName);
    //     }
    //     assert(0); // not reached
    // }
// REFLECTION IMPLEMENT

}
struct API_object{
    // date 
    string date_str= __TIMESTAMP__;
    // user details
    Object userDetail ;
    // data
    int data_i;
    string data_s ;
    Object data_o;
    // print function
    string prinContent(string date_str){
        writeln("printContent function activated!\n");
        writeln("printContent timestamp: ",date_str); 
        return date_str;
        }
    // immutable Auditable tuple record of creation or deletion
}

// object cache   API_object* api_obj;
API_object*[string] api_obj; // object singleton!

void createObject(){
    //Object Creation
    write("Enter object name: ");
    string key = readln();
    api_obj[key] = new API_object() ;
    api_obj[key].data_s = key;
    writeln("A new API_Object has been created at, ",__TIMESTAMP__);
    //return api_obj;
}

void printObjects(){
    if(api_obj != null ){
        
        foreach( element; api_obj){
            writeln(" Cache item [ ",element.data_s," ] ");
        }

    } else {
        writeln("Object cache is empty");
    }

}

void deleteObject(string key){
    // Object Deletion
    api_obj.remove(key);
    writeln("Delete operation complete...");
}

void setObject(){
    writeln("setObject function has been activated!");
    write("Enter object name: ");
    string key = readln();
    if(api_obj[key]){
        writeln(" Enter updates to apply: ");
        string new_str = readln();
        api_obj[key].data_s = new_str;
    } else {
        writeln("No such Object as ",key," Exists");
    }

    writeln("Objects property ", api_obj[key].data_s," has been set.");
    
}

bool shell_execute(string args){
    
    switch(args){
        
        case "createObject\n":
            createObject();
            log_Event();
            return true;
        break;

        case "deleteObject\n":
            // auto api_obj = createObject();
            write("Object name to delete: ");
            auto name = readln();
            deleteObject(name);
            writeln("Object ",name," has been deleted!");
            log_Event();
            return true;
        break;

        case "printObjects\n":
            printObjects();
        break;
        
        case "setObject\n":
            setObject();
        break;

        case "exit\n":
            write("\n Bye :D <3 ! \n\n");
            return false;
        break;

        default:
            write("",args,": is not a valid command.\n");
            return true;
        break;
    }
        return true;
}
void shell()
{
  string line;
  string args;
  int status;

  do {
    write("running my shell :>> ");
    line = readln();
    status = shell_execute(line);
  } while (status);
    destroy(line);
    destroy(args);
}
void log_Event(){
    // WRITE THE FILE.

    string file_str = "Shell_Log.txt";
    if ( file_str.exists() )
    { writeln("Event has been logged..."); }
    else
    { writeln("file doesn't exist"); }

}


void main(){
    //RUN SHELL PROCEDURE
    shell();
    // Asyncronous file record creation section

    // Asyncronous file record creation section
}