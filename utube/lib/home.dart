// https://github.com/wichit2s/mobile-week04
import 'package:flutter/material.dart';

import 'detail.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  // https://picsum.photos/id/99/800/600
  var images = <String>['99', '106', '1079', '1000'];
  var titles = <String>[
    'การเขียนโปรแกรม', 'การเขียนเว็บ', 'การเขียนโมบายแอพ', 'การออกแบบระบบ'];
  // var selected = <bool>[ true, false, false, false ];
  var selectedIndex = 0;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: ListView(
          padding: EdgeInsets.all(10),
          // children: widget.images.map( (img) {
          // children: List.generate(10, (i) { return i*i; })
          children: List.generate(widget.images.length, (i) {
            return ListTile(
              // onTap: () { 
              //   setState( () {
              //     widget.selectedIndex = i; 
              //     print('กดที่ index = ${widget.selectedIndex}');
              //   } );
              // },
              onTap: () {
                _showDetailPage(context, i);
              },
              contentPadding: EdgeInsets.all(5),
              title: Image.network('https://picsum.photos/id/${widget.images[i]}/800/600'),
              // subtitle: Text("${widget.titles[i]}"),
              // subtitle: (widget.selectedIndex == i)? 
              subtitle: GestureDetector(
                // behavior
                child: Row(
                  children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(5),
                        child: CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/id/${widget.images[i]}/800/600'),
                        ),
                      ),
                      Expanded(child: Text("${widget.titles[i]}"))
                    ],
                  ),
              ),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // onPressed: () => _showDetailPage(context),
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showDetailPage(BuildContext context, int i) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return DetailPage(
          title: widget.titles[i], 
          image: widget.images[i], 
        );
      }),
    );
  }
}