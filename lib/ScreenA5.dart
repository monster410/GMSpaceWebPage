import 'package:flutter/material.dart';

class ScreenA5 extends StatelessWidget {
 // const ScreenA2({super.key});
  double? pic_height = 40;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('M.FS'),
      ),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
            child: Card(
                  margin: const EdgeInsets.all(30),
    child: Center(
      child: Column(children: [
        SizedBox(height: 30),
        ListTile(
          title: Text(
            'm.fs : 스타필드 하남'.toUpperCase(),
            style: Theme.of(context).textTheme.overline!.copyWith(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/StarfieldHanam/main.jpg',
      width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/StarfieldHanam/2.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/StarfieldHanam/3.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/StarfieldHanam/4.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/StarfieldHanam/5.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/StarfieldHanam/6.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/StarfieldHanam/7.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height),
      ClipRRect(
      borderRadius: BorderRadius.circular(30.0),
      child: Image.asset('images/StarfieldHanam/8.jpg',
          width: 1200, height: 675, fit: BoxFit.fill)),
      SizedBox(height: pic_height)

      ]),
    )
    ))
    );
  }
}
