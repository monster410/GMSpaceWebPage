import 'package:flutter/material.dart';

class ScreenA2 extends StatelessWidget {
 // const ScreenA2({super.key});
  double? pic_height = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('images/oomot.png',height: 50,)
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Card(
                  margin: const EdgeInsets.all(30),
    child: Center(
      child: Column(children: [
        SizedBox(height: 30),
        ListTile(
          title: Text(
            'DFS : Beijing Sanlitun TaikooLi'.toUpperCase(),
            style: Theme.of(context).textTheme.overline!.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/BeijingSanlitunTaikooLi/main.jpg',
      width: 1200, height: 675, fit: BoxFit.fitWidth)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/BeijingSanlitunTaikooLi/2.jpg',
          width: 1200, height: 675, fit: BoxFit.fitWidth)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/BeijingSanlitunTaikooLi/3.jpg',
          width: 1200, height: 675, fit: BoxFit.fitWidth)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/BeijingSanlitunTaikooLi/4.jpg',
          width: 1200, height: 675, fit: BoxFit.fitWidth)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/BeijingSanlitunTaikooLi/5.jpg',
          width: 1200, height: 675, fit: BoxFit.fitWidth)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/BeijingSanlitunTaikooLi/6.jpg',
          width: 1200, height: 675, fit: BoxFit.fitWidth)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/BeijingSanlitunTaikooLi/7.jpg',
          width: 1200, height: 675, fit: BoxFit.fitWidth)),
      SizedBox(height: pic_height)

      ]),
    )
    ))
    );
  }
}
