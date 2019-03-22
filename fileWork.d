import std.stdio;
import std.file;
import std.string;

void main()
{
    // WRITE THE FILE.
    File file_writable;
    string file_str = "NewFile.txt";
    if( file_str.exists() ) 
    { 
        file_writable = File(file_str,"a+");
        file_writable.writeln("The Next appended line");
     }

    // for(int i=1;i<10;i++)
    // file_writable.writeln(i);
    // file_writable.close();
    // READ THE FILE
    File file_readable = File("NewFile.txt","a+");
    while (!file_readable.eof())
    {
        file_readable.readln().writeln();
    }    file_readable.close();

    // std.file.remove("Newfile.txt");
    // file.open("helloworld.d","r");

}