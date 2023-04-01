import 'package:chatapp/core/theme_manager/colors.dart';
import 'package:chatapp/data/local/socket_io.dart';

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
        title: Text(groupChatName!),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: Container()),
            Row(
              children: [
                Expanded(
                    child: CustomTextFormField(
                  controller: chatTextEditingController,
                  formkey: chatFormkey,
                )),
                const SizedBox(
                  height: 20,
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      color: iconPurpleColor,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
