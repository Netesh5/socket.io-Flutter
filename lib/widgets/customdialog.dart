import 'package:chatapp/widgets/textformfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

customDialog(BuildContext context) {
  return showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text("Group Name"),
          ),
          content: const CustomTextFormField(),
          actions: [
            TextButton(onPressed: () {}, child: const Text("Create")),
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("Cancel"))
          ],
        );
      });
}
