import 'package:chatapp/repo/baseurl.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketIO {
  void connect() {
    io.Socket socket = io.io(socketURL, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket.connect();
    socket.onConnect((id) {
      print("connected");
    });
  }
}
