import 'package:flutter/material.dart';

class ScreenA3 extends StatelessWidget {
 // const ScreenA2({super.key});
  double? pic_height = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MALL'),
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Card(
                  margin: const EdgeInsets.all(30),
    child: Center(
      child: Column(children: [
        SizedBox(height: 30),
        ListTile(
          title: Text(
            'MALL : 서울 롯데타워'.toUpperCase(),
            style: Theme.of(context).textTheme.overline!.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/SeoulLotteTower/main.jpg',
      width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/SeoulLotteTower/2.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/SeoulLotteTower/3.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/SeoulLotteTower/4.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),

      ]),
    )
    ))
    );
  }
}
