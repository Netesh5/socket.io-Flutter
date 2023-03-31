import 'package:chatapp/core/theme_manager/colors.dart';
import 'package:chatapp/widgets/customdialog.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat App"),
      ),
      floatingActionButton: CircleAvatar(
          backgroundColor: appBarColor,
          radius: 30,
          child: IconButton(
              onPressed: () {
                customDialog(context);
              },
              icon: const Icon(
                Icons.chat,
                color: Colors.white,
                size: 35,
              ))),
    );
  }
}
