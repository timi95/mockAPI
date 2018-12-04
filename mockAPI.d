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
API_object*[string] api_obj;

auto createObject(){
    //Object Creation
    writeln("A new API_Object has been created at, ",__TIMESTAMP__);
    write("Enter Objects name: ");
    string key = readln();
    api_obj[key] = new API_object() ;
    // api_obj.data_s = "Random_String";
    return api_obj;
}

void deleteObject(API_object* target){
    // Audit
    // Object Deletion
    destroy(target);
}
auto setObject(API_object* api_object, Object userObject){
    writeln("setObject function has been activated!");
    // set struct attributes
    api_object.userDetail = userObject;
    // return api_object
    return api_object;
}


// string read_shell(){
//     while(1)
//     string line = readln();
//     return line;
// }

bool shell_execute(string args){
    
    switch(args){
        
        case "createObject\n":
            createObject();
            // writeln( "String of Object: ",Object.stringof,
            // "\nSize of Object: ", Object.sizeof,
            // "\nAuto api_obj value: ", api_obj.date_str);
            // api_obj.prinContent(api_obj.date_str);
            log_Event();
            return true;
        break;

        case "deleteObject\n":
            // auto api_obj = createObject();
            write("Object name to delete: ");
            auto name = readln();
            deleteObject(api_obj[name]);
            // api_obj.call("",[]).deleteObject();
            writeln("Object Deleted!");
            log_Event();
            return true;
        break;

        // case "setObject\n":
        //     if(api_obj){
        //     // set Object function usage.
        //     write("set User Name>> ");
        //     string userName = readln();

        //     write("set User Age>> "); 
        //     string userAge= readln();

        //     // write("set User Contact>> ");
        //     // string[] userContacts;

        //     write("set User Money>> ");
        //     double money ; 
        //     readf!" %f\n"(money); 
            
        //     write("set Total Money>> ");
        //     double total_money ; 
        //     readf!" %f\n"(total_money); 

        //     // auto api_obj = createObject();
        //     UserDetail usrDetail = new UserDetail(userName, userAge, ["bob@email.com","070123456999"], money, total_money);
        //     writeln("Object has been set as: ",setObject( api_obj[0], usrDetail));
        //     writeln("userName: ",usrDetail.userName);
        //     writeln("userAge: ",usrDetail.userAge);
        //     writeln("money: ",usrDetail.money);
        //     writeln("TotalMoney: ",total_money);
        //     log_Event();
        //     return true;
        //     }else{ writeln("ERROR object is [",api_obj,"] and does not exist !"); return true;}

        // break;

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