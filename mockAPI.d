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
import std.process;
import std.parallelism;

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
    string data_s ;
    Object data_o;
    // print function
    string printContent(string date_str) {
        writeln("printContent function activated!\n");
        writeln("printContent timestamp: ",date_str);
        return date_str;
        }
    // immutable Auditable tuple record of creation or deletion
}

 auto createObject_Two(){
    //Object Creation
    write("Enter object name: ");
    string key = readln();
    api_obj[key] = new API_object() ;
    api_obj[key].data_s = key;
    writeln("A new API_Object has been created at, ",__TIMESTAMP__);
   return api_obj;

}

// object cache   API_object* api_obj;
API_object*[string] api_obj; // object singleton

API_object* createObject(){
    //Object Creation
    write("Enter object name: ");
    string key = readln();
    api_obj[key] = new API_object() ;
    api_obj[key].data_s = key;
    writeln("A new API_Object has been created at, ",__TIMESTAMP__);
    return api_obj[key];
}

void listObjects(){
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

    if (api_obj) {
        write("Enter object name to be set: ");
        string key = readln();
        if( key == "\n" || key == null || !key){
            write("Invalid name value entered\n");

        }
        else if (api_obj[key]){
            writeln(" Enter new object name to be set: ");
            string new_str = readln();
            api_obj[key].data_s = new_str;
            writeln("Objects property ", api_obj[key].data_s," has been set.");
        }

    } else {
        writeln("No objects exist in the cache, create them with \"createObject\" before using this command.");
    }



}

bool shell_execute(string args){
    fileWriting("Hello");
    switch(args){
        case "help\n": {
            write("The commands:\n",
            "createObject: creates a new object.\n",
            "deleteObject: deletes an existing object.\n",
            "listObjects: lists all existing objects.\n",
            "setObject: sets an Object.\n",
            "exit: exits the program.\n",
            "These commands are case sensitive, invalid commands will be ignored.");
        }
        break;

        case "createObject\n":{
            createObject();
            log_Event("Object created at: "~__TIMESTAMP__);
            return true;
        }
        break;

        case "deleteObject\n": {
            // auto api_obj = createObject();
            write("Object name to delete: ");
            auto name = readln();
            deleteObject(name);
            writeln("Object ",name," has been deleted!");
            log_Event("Object deleted at: "~__TIMESTAMP__);
            return true;
            }
        break;

        case "listObjects\n":{
            listObjects();
            log_Event("Objects listed at: "~__TIMESTAMP__);
        }
        break;

        case "setObject\n":{
            setObject();
            log_Event("Object value modified at: "~__TIMESTAMP__);
        }
        break;

        case "clear\n":{
            auto pid = spawnProcess("clear");
            scope(exit) wait(pid);
        }
        break;

        case "exit\n":{
            write("\n Bye :D <3 ! \n\n");
            log_Event("Exiting program at : "~__TIMESTAMP__);
            return false;
        }
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

void log_Event(string event_str ){
    // WRITE THE FILE.

    string file_str = "Shell_Log.txt";
    if ( file_str.exists() )
    {
        File file_writable;
        file_writable = File(file_str,"a+");
        file_writable. writeln( event_str,"Event has been logged..." );
        writeln("Event has been logged...");
    }
    else
    {
        writeln("file doesn't exist");

    }

}

void fileWriting(string a ) {
    // write(NewFile, a);
    File file = File("NewFile.txt","w");
    file.writeln(a);
    file.close();
}
void main(){
	// writeln("totalCPU amount: ",totalCPUs);
    //RUN SHELL PROCEDURE
    shell();
    // Asyncronous file record creation section

    // Asyncronous file record creation section
}
