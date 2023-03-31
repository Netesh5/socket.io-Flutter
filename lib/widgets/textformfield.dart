import 'package:chatapp/core/theme_manager/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController groupNameTextEditingController = TextEditingController();
TextEditingController chatTextEditingController = TextEditingController();
String? groupChatName;
final groupChatNameFormkey = GlobalKey<FormState>();
final chatFormkey = GlobalKey<FormState>();

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key, required this.controller, required this.formkey});
  final TextEditingController controller;
  final GlobalKey<FormState> formkey;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: CupertinoTextFormFieldRow(
        cursorColor: iconPurpleColor,
        decoration: const BoxDecoration(color: Colors.white),
        controller: controller,
        textInputAction: TextInputAction.newline,
        maxLines: 5,
        minLines: 1,
        onChanged: (value) {
          groupChatName = groupNameTextEditingController.text;
        },
        validator: (value) {
          if (value!.isEmpty) {
            return "Field cannot be empty";
          }
          return null;
        },
      ),
    );
  }
}
