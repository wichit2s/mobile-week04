import 'package:flutter/material.dart';

class RotatePic extends AnimatedWidget {
  RotatePic({Key key, Animation<double> animation})
      : super(key: key, listenable: animation);

  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: animation.value,
        width: animation.value,
        child: RotatedBox(
          quarterTurns: (animation.value/20).floor(),
          child: Image.network('https://picsum.photos/200/200'),
        ),
      ),
    );
  }
}