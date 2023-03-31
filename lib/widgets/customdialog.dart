import 'package:chatapp/core/theme_manager/colors.dart';
import 'package:chatapp/src/presentation/groupage/grouppage.dart';
import 'package:chatapp/widgets/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
