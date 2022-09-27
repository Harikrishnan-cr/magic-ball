






import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:magic_ball/controler/magic_provider/magic_logic.dart';
import 'package:provider/provider.dart';




Color maincolour = const Color.fromARGB(255, 116, 17, 10);
Color secondcolour = const Color.fromARGB(255, 216, 215, 215);
double screenHeight =0;
double screenWidth = 0;

class MagicFunctions extends StatelessWidget {
  MagicFunctions({Key? key}) : super(key: key);

var imgNum;


  // void resetApp(){
  //   // setState(() {
  //   //   imgNum = 7;
  //   // });
  // }

  //  void changeImgOnTap (){
  //   // setState(() {
  //   //   imgNum = Random().nextInt(7);
  //   // });
  // }
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MagicCounterclass>(context,listen: false);
     screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    log('loged ');
    return Scaffold(

       appBar: AppBar(
        elevation: 0,
        backgroundColor: maincolour,
        toolbarHeight: 65,
        title: Text('Magic Ball',style: TextStyle(fontWeight: FontWeight.bold,color:secondcolour,fontSize: 25),),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            // resetApp();
          provider.resetApp();
          }, icon: const Icon(Icons.refresh_outlined))
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            
           provider.changeCountValue(); 
               
          },
          // child: Text(imgNum.toString()),      
          child: Consumer<MagicCounterclass>(
            builder: (BuildContext, data, _) {
              return Image.asset('assets/images/ball${data.magicCount}.png',      
        width: screenHeight*0.47,
              );
            }
          ),
        ),
      ),
    );
    
  }
}