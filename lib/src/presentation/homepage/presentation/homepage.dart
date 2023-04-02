import 'package:chatapp/core/theme_manager/colors.dart';
import 'package:chatapp/src/presentation/homepage/bloc/username_cubit.dart';

import 'package:chatapp/widgets/customdialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1), () {
      customUsernameDialog(context);
    });

    super.initState();
  }

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
        body: Center(
          child: BlocConsumer<UsernameCubit, Usernamestate>(
            listener: (context, state) {
              if (username.isNotEmpty) {
                BlocProvider.of<UsernameCubit>(context).containValue();
              } else if (username.isEmpty) {
                BlocProvider.of<UsernameCubit>(context).novalue();
              }
            },
            builder: (context, state) {
              if (state == Usernamestate.hasvalue) {
                return Text("Welcome, $username");
              } else if (state == Usernamestate.novalue) {
                return const SizedBox();
              } else {
                return const SizedBox();
              }
            },
          ),
        ));
  }
}
