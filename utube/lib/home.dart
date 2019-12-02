import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  // https://picsum.photos/id/99/800/600
  var images = <String>['99', '106', '1079', '1000'];
  var titles = <String>[
    'การเขียนโปรแกรม', 'การเขียนเว็บ', 'การเขียนโมบายแอพ', 'การออกแบบระบบ'];
  var selected = <bool>[ true, false, false, false ];

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
              contentPadding: EdgeInsets.all(5),
              title: Image.network('https://picsum.photos/id/${widget.images[i]}/800/600'),
              // subtitle: Text("${widget.titles[i]}"),
              subtitle: (widget.selected[i])? 
                Row(
                  children: <Widget>[
                    CircleAvatar(backgroundImage: NetworkImage('https://picsum.photos/id/${widget.images[i]}/800/600'),
),
                    Text("${widget.titles[i]}")
                    ],
                  )
                : Text("${widget.titles[i]}"),
            );
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}