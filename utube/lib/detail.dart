import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {

  String title;
  String image;

  DetailPage({Key key, this.title, this.image}) : super(key: key);
  //DetailPage(Key key, this.title, this.image) {
  //  // super(key: key);
  //  this.title = title;
  //  this.image = image;
  //}// : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (cxt, i) => Container(height: 2),
        itemCount: 3,
        itemBuilder: (context, i) {
          return ListTile(
            title: Text(widget.title),
            subtitle: Text(widget.image),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showHomePage(context),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _showHomePage(BuildContext cxt) {
    Navigator.pop(cxt);
  }
}