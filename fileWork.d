import std.stdio;
import std.file;
import std.string;

void main()
{
    // WRITE THE FILE.
    File file_writable = File("NewFile.txt","w");
    for(int i=1;i<10;i++)
    file_writable.writeln(i);
    file_writable.close();
    
    // READ THE FILE
    File file_readable = File("NewFile.txt","r");
    while (!file_readable.eof())
    {
        file_readable.readln().writeln();
    }    file_readable.close();

    // std.file.remove("Newfile.txt");
    // file.open("helloworld.d","r");

}