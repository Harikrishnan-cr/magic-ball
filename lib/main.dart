import 'package:flutter/material.dart';

import 'package:magic_ball/magic_functions.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        canvasColor: secondcolour
      ),
      home: const MagicFunctions(),
    );
  }
}

