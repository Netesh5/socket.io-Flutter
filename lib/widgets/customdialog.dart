import 'package:chatapp/core/theme_manager/colors.dart';
import 'package:chatapp/src/presentation/groupage/grouppage.dart';
import 'package:chatapp/widgets/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

String username = "";

customDialog(BuildContext context) {
  return showCupertinoDialog(
      barrierLabel: "Create new chat",
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("Group Name"),
          ),
          content: CustomTextFormField(
            controller: groupNameTextEditingController,
            formkey: groupChatNameFormkey,
            isuername: false,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  groupNameTextEditingController.clear();
                },
                child: const Text(
                  "Cancel",
                  style: TextStyle(color: textPurpleColor),
                )),
            TextButton(
                onPressed: () {
                  if (groupChatNameFormkey.currentState!.validate()) {
                    Navigator.of(context).pop();
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const GroupScreen();
                    })).then((value) => groupNameTextEditingController.clear());
                  }
                },
                child: const Text(
                  "Create",
                  style: TextStyle(color: textPurpleColor),
                )),
          ],
        );
      });
}

customUsernameDialog(context) {
  return showCupertinoDialog(
      context: context,
      builder: (contex) {
        return CupertinoAlertDialog(
          title: const Text("Enter username"),
          content: CustomTextFormField(
            controller: usernameTextEditingController,
            formkey: usernameFormkey,
            isuername: true,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  if (usernameFormkey.currentState!.validate()) {
                    Navigator.of(context).pop();
                    username = usernameTextEditingController.text;
                  }
                },
                child: const Text(
                  "Done",
                  style: TextStyle(color: textPurpleColor),
                ))
          ],
        );
      });
}
