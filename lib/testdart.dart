import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horizontal ListView Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Horizontal ListView Example'),
        ),
        body: HorizontalListView(),
      ),
    );
  }
}
//
class HorizontalListView extends StatelessWidget {
  final List<String> imglist = [
    'images/01.jpg',
    'images/pcbway1.gif',
    'images/2.jpg',
    'images/3.jpg',
    'images/4.jpg',
    'images/5.jpg'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: imglist.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imglist[index],
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
