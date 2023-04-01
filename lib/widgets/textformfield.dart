import 'package:chatapp/core/theme_manager/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

TextEditingController groupNameTextEditingController = TextEditingController();
TextEditingController chatTextEditingController = TextEditingController();
TextEditingController usernameTextEditingController = TextEditingController();
String groupChatName = groupNameTextEditingController.text;
final groupChatNameFormkey = GlobalKey<FormState>();
final chatFormkey = GlobalKey<FormState>();
final usernameFormkey = GlobalKey<FormState>();

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.formkey,
      required this.isuername,
      this.prefix});
  final TextEditingController controller;
  final GlobalKey<FormState> formkey;
  final Widget? prefix;
  final bool isuername;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formkey,
      child: CupertinoTextFormFieldRow(
        prefix: isuername
            ? const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text("username"),
              )
            : prefix,
        cursorColor: iconPurpleColor,
        decoration: const BoxDecoration(color: Colors.white),
        controller: controller,
        textInputAction: TextInputAction.newline,
        maxLines: 5,
        minLines: 1,
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
