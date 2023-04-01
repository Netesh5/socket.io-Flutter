import 'package:chatapp/core/theme_manager/colors.dart';
import 'package:flutter/material.dart';

class OtherMsg extends StatelessWidget {
  const OtherMsg(
      {super.key,
      required this.username,
      required this.msg,
      required this.type,
      required this.dateTime});
  final String username;
  final String msg;
  final String type;
  final String dateTime;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 50),
        child: Container(
          decoration: BoxDecoration(
              color: iconPurpleColor, borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Text(username,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                Text(msg, style: const TextStyle(color: Colors.white)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
