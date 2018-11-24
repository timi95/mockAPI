import std.math;
import std.stdio;
import std.string;
import std.array;
import std.regex;
import std.datetime;
import core.sys.posix.unistd : fork, pid_t;

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
}
struct API_object{
    // date 
    string date_str= __TIMESTAMP__;
    // user details
    Object userDetail ;
    // data
    int data_i;
    string data_s;
    Object data_o;
    // print function
    string prinContent(string date_str){
        writeln("printContent function activated!\n");
        writeln("printContent timestamp: ",date_str); 
        return date_str;
        }
    // immutable Auditable tuple record of creation or deletion
}

auto createObject(){
    //Object Creation
    writeln("A new API_Object has been created at, ",__TIMESTAMP__);
    return new API_object() ;
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
            auto api_obj = createObject();
            writeln( "String of Object: ",Object.stringof,
            "\nSize of Object: ", Object.sizeof,
            "\nAuto api_obj value: ", api_obj.date_str);
            api_obj.prinContent(api_obj.date_str);
            return true;
        break;

        case "deleteObject\n":
            auto api_obj = createObject();
            deleteObject(api_obj);
            writeln("Object Deleted!");
            
        break;

        case "setObject\n":
            // set Object function usage.
            auto api_obj = createObject();
            UserDetail usrDetail = new UserDetail("Bob", "userAge", ["bob@email.com","070123456999"], 15, 1000.0);
            writeln("Object has been set as: ",setObject( api_obj, usrDetail) );
        break;

        default:
            write(args,": is not a valid command.\n");
            return false;
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
    printf("running my shell :>> ");
    line = readln();
    status = shell_execute(line);
  } while (status);
    destroy(line);
    destroy(args);
}



void main(){
    /*SHELL ACTIVATION*/
    shell();
//     auto api_obj = createObject();
//    writeln( "String of Object: ",Object.stringof,
//             "\nSize of Object: ", Object.sizeof,
//             "\nAuto api_obj value: ", api_obj.date_str);
//             api_obj.prinContent(api_obj.date_str);
    
    // // set Object function usage.
    // UserDetail usrDetail = new UserDetail("Bob", "userAge", ["bob@email.com","070123456999"], 15, 1000.0);
    // writeln("Object has been set as: ",setObject( api_obj, usrDetail) );

    // Asyncronous file record creation section

    // Asyncronous file record creation section
}