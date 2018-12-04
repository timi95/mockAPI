//dmd -de -w -run try_Vibe.d
import std.stdio;
import std.socket;
import core.thread;

void main() {
  Socket server = new TcpSocket();
  server.setOption(SocketOptionLevel.SOCKET, SocketOption.REUSEADDR, true);
  server.bind(new InternetAddress(8080));
  server.listen(1);


  while(true) {
    char[1024] buffer;
    Socket client = server.accept();
    client.receive(buffer);
    string request = cast(string)buffer;
    writeln("acceptted the request: " ~ request);
    client.send(request);
    client.shutdown(SocketShutdown.BOTH);
    client.close();
  }
}