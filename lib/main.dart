import 'package:flutter/material.dart';
import 'package:magic_ball/controler/magic_provider/magic_logic.dart';

import 'package:magic_ball/view/screen/magic_functions.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MagicCounterclass>(create: (_) => MagicCounterclass(), )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          canvasColor: secondcolour
        ),
        home: MagicFunctions(),
      ),
    );
  }
}

