import 'package:chatapp/data/model/msg_model.dart';
import 'package:chatapp/repo/baseurl.dart';
import 'package:chatapp/widgets/customdialog.dart';
import 'package:intl/intl.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;

class SocketIO {
  io.Socket? socket;
  List<MsgModel> model = [];

  void connect() {
    socket = io.io(socketURL, <String, dynamic>{
      "transports": ["websocket"],
      "autoConnect": false
    });
    socket!.connect();
    socket!.onConnect((id) {
      socket!.on("sendMsgServer", (data) {
        print(data);
        model.add(MsgModel.fromJson(data));
      });
    });
  }

  DateTime now = DateTime.now();
  void sendMsg(String msg, String senderName) {
    MsgModel msgModel = MsgModel(
        dateTime: DateFormat("E,d MMM yyyy hh:mm:ss").format(now),
        type: "ownMsg",
        msg: msg,
        sender: username);
    model.add(msgModel);
    socket!.emit("sendMsg", {
      "dateTime": DateFormat("E,d MMM yyyy hh:mm:ss").format(now),
      "type": "ownMsg",
      "msg": msg,
      "sender": username
    });
  }
}
