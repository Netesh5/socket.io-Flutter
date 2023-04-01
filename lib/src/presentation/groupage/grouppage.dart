import 'package:chatapp/core/theme_manager/colors.dart';
import 'package:chatapp/data/local/socket_io.dart';
import 'package:chatapp/widgets/customdialog.dart';
import 'package:chatapp/widgets/other_msg.dart';
import 'package:chatapp/widgets/own_msg.dart';

import 'package:flutter/material.dart';

import '../../../widgets/textformfield.dart';

class GroupScreen extends StatefulWidget {
  const GroupScreen({Key? key}) : super(key: key);

  @override
  State<GroupScreen> createState() => _GroupScreenState();
}

class _GroupScreenState extends State<GroupScreen> {
  SocketIO socketIO = SocketIO();
  @override
  void initState() {
    socketIO.connect();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(groupChatName),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                  child: ListView.builder(
                itemCount: socketIO.model.length,
                itemBuilder: (context, index) {
                  if (socketIO.model[index].type == "ownMsg") {
                    return OwnMsg(
                        username: socketIO.model[index].sender,
                        msg: socketIO.model[index].msg,
                        type: socketIO.model[index].type,
                        dateTime: socketIO.model[index].dateTime);
                  } else {
                    return OtherMsg(
                        username: socketIO.model[index].sender,
                        msg: socketIO.model[index].msg,
                        type: socketIO.model[index].type,
                        dateTime: socketIO.model[index].dateTime);
                  }
                },
              )),
              Row(
                children: [
                  Expanded(
                      child: CustomTextFormField(
                    controller: chatTextEditingController,
                    formkey: chatFormkey,
                    isuername: false,
                  )),
                  const SizedBox(
                    height: 20,
                  ),
                  IconButton(
                      onPressed: () {
                        if (chatTextEditingController.text.isNotEmpty) {
                          socketIO.sendMsg(
                              chatTextEditingController.text, username);
                          chatTextEditingController.clear();
                        }
                      },
                      icon: const Icon(
                        Icons.send,
                        color: iconPurpleColor,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
