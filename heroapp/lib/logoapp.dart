import 'package:flutter/material.dart';

import 'rotatepic.dart';

class LogoApp extends StatefulWidget {
  _LogoAppState createState() => _LogoAppState();
}

class _LogoAppState extends State<LogoApp> with SingleTickerProviderStateMixin {
 Animation<double> animation;            
 AnimationController controller;            

 @override            
 void initState() {            
   super.initState();            
   controller = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this
    );
   animation = Tween<double>(begin: 0, end: 360).animate(controller)            
     ..addListener(() {            
       setState(() {            
       });            
     })            
     ..addStatusListener( (state) {
       print('$state');
     });
   controller.forward();            
 }            

  @override
  Widget build(BuildContext context) =>
    RotatePic(animation: animation);

  // Widget build(BuildContext context) {
  //   print(animation.value);
  //   return Center(
  //     child: Container(
  //       margin: EdgeInsets.symmetric(vertical: 10),
  //       height: animation.value,
  //       width: animation.value,
  //       child: RotatedBox(
  //         quarterTurns: (animation.value/20).floor(),
  //         child: Image.network('https://picsum.photos/200/200'),
  //       ),
  //     ),
  //   );
  // }

  @override 
  void dispose() {
    controller.dispose();
    super.dispose();
  } 
}