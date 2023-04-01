import 'package:chatapp/core/theme_manager/theme.dart';
import 'package:chatapp/src/presentation/homepage/bloc/username_cubit.dart';
import 'package:chatapp/src/presentation/homepage/presentation/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsernameCubit(),
        ),
      ],
      child: MaterialApp(
        theme: themedata,
        debugShowCheckedModeBanner: false,
        home: const HomeScreen(),
      ),
    );
  }
}
