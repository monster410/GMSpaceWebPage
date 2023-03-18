import 'package:flutter/material.dart';

class ScreenA6 extends StatelessWidget {
 // const ScreenA2({super.key});
  double? pic_height = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('haus'),
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Card(
                  margin: const EdgeInsets.all(30),
    child: Center(
      child: Column(children: [
        SizedBox(height: 30),
        ListTile(
          title: Text(
            'haus : 하우스 도산'.toUpperCase(),
            style: Theme.of(context).textTheme.overline!.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/HausDosan/main.jpg',
      width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/HausDosan/2.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/HausDosan/3.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/HausDosan/4.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/HausDosan/5.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/HausDosan/6.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/HausDosan/7.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/HausDosan/8.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/HausDosan/9.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/HausDosan/10.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      ]),
    )
    ))
    );
  }
}
