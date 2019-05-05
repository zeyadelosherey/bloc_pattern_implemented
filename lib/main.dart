import 'package:bloc_pattern_implemented/BLOCs/UserBloc.dart';
import 'package:bloc_pattern_implemented/PAGEs/UserPage.dart';
import 'package:bloc_pattern_implemented/UTILs/bloc_provider.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
        home: BlocProvider(
            bloc: UserBloc(),
            child: UserPage(),
    )
    );
  }
}


