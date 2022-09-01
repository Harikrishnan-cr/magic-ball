


import 'dart:math';

import 'package:flutter/material.dart';




Color maincolour = const Color.fromARGB(255, 116, 17, 10);
Color secondcolour = const Color.fromARGB(255, 216, 215, 215);
double screenHeight =0;
double screenWidth = 0;

class MagicFunctions extends StatefulWidget {
  const MagicFunctions({Key? key}) : super(key: key);

  @override
  State<MagicFunctions> createState() => _MagicFunctionsState();
}

class _MagicFunctionsState extends State<MagicFunctions> {
  var imgNum= 7;


  void resetApp(){
    setState(() {
      imgNum = 7;
    });
  }

   void changeImgOnTap (){
    setState(() {
      imgNum = Random().nextInt(7);
    });
  }
  @override
  Widget build(BuildContext context) {
     screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(

       appBar: AppBar(
        elevation: 0,
        backgroundColor: maincolour,
        toolbarHeight: 65,
        title: Text('Magic Ball',style: TextStyle(fontWeight: FontWeight.bold,color:secondcolour,fontSize: 25),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            resetApp();
          }, icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            
             changeImgOnTap();
          },
          child: Image.asset('assets/images/ball$imgNum.png',
        width: screenHeight*0.47,
          ),
        ),
      ),
    );
    
  }
}