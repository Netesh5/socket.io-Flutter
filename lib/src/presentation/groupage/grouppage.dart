import 'package:chatapp/core/theme_manager/colors.dart';
import 'package:chatapp/widgets/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GroupScreen extends StatelessWidget {
  const GroupScreen({Key? key}) : super(key: key);

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
