class MsgModel {
  String type;
  String dateTime;
  String msg;
  String sender;

  MsgModel(
      {required this.dateTime,
      required this.type,
      required this.msg,
      required this.sender});

  factory MsgModel.fromJson(Map<String, dynamic> data) => MsgModel(
      dateTime: data["dateTime"],
      type: data["type"],
      msg: data["msg"],
      sender: data["sender"]);
}
