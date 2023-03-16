import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      title: 'GENTLE MONSTER SPACE',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      home: const HomePage(),
    );
  }
}

enum LegendShape { circle, rectangle }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final dataMap = <String, double>{
    "Wooah": 15,
    "Hahaha": 20,
    "ㅋㅋㅋㅋㅋ": 20,
    "멋있다": 12,
    "OMG": 10,
    "zzz": 15,
    "WoW": 30,
  };

  final legendLabels = <String, String>{
    "Wooah": "우와",
    "Hahaha": "하하하",
    "ㅋㅋㅋㅋㅋ": "ㅋㅋㅋ",
    "멋있다": "멋있다!",
    "OMG": "Oh My God",
    "zzz": "zzz",
    "WoW": "Wow",
  };

  final colorList = <Color>[
    const Color(0xfffdcb6e),
    const Color(0xff0984e3),
    const Color(0xfffd79a8),
    const Color(0xffe17055),
    const Color(0xff6c5ce7),
    const Color.fromARGB(255, 96, 224, 139),
    const Color.fromARGB(255, 198, 40, 188),
  ];

  final gradientList = <List<Color>>[
    [
      const Color.fromRGBO(223, 250, 92, 1),
      const Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      const Color.fromRGBO(129, 182, 205, 1),
      const Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      const Color.fromRGBO(175, 63, 62, 1.0),
      const Color.fromRGBO(254, 154, 92, 1),
    ]
  ];
  ChartType? _chartType = ChartType.disc;
  bool _showCenterText = true;
  double? _ringStrokeWidth = 32;
  double? _chartLegendSpacing = 48;

  bool _showLegendsInRow = false;
  bool _showLegends = true;
  bool _showLegendLabel = false;

  bool _showChartValueBackground = false;
  bool _showChartValues = true;
  bool _showChartValuesInPercentage = true;
  bool _showChartValuesOutside = false;

  bool _showGradientColors = false;

  LegendShape? _legendShape = LegendShape.circle;
  LegendPosition? _legendPosition = LegendPosition.right;

  int key = 0;

  double? pic_width = 15;
  double? pic_height = 15;
  double? myfont_size = 15;

  @override
  Widget build(BuildContext context) {
    final chart = PieChart(
      key: ValueKey(key),
      dataMap: dataMap,
      animationDuration: const Duration(milliseconds: 800),
      chartLegendSpacing: _chartLegendSpacing!,
      chartRadius: math.min(MediaQuery.of(context).size.width / 3.2, 300),
      colorList: colorList,
      initialAngleInDegree: 0,
      chartType: _chartType!,
      centerText: _showCenterText ? "EMOTION" : null,
      legendLabels: _showLegendLabel ? legendLabels : {},
      legendOptions: LegendOptions(
        showLegendsInRow: _showLegendsInRow,
        legendPosition: _legendPosition!,
        showLegends: _showLegends,
        legendShape: _legendShape == LegendShape.circle
            ? BoxShape.circle
            : BoxShape.rectangle,
        legendTextStyle: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      chartValuesOptions: ChartValuesOptions(
        showChartValueBackground: _showChartValueBackground,
        showChartValues: _showChartValues,
        showChartValuesInPercentage: _showChartValuesInPercentage,
        showChartValuesOutside: _showChartValuesOutside,
      ),
      ringStrokeWidth: _ringStrokeWidth!,
      emptyColor: Colors.grey,
      gradientList: _showGradientColors ? gradientList : null,
      emptyColorGradient: const [
        Color(0xff6c5ce7),
        Colors.blue,
      ],
      baseChartColor: Colors.transparent,
    );

    final settings = SingleChildScrollView(
      child: Card(
        margin: const EdgeInsets.all(30),
        child: Column(
          children: [
            ListTile(
              title: Text(
                '하우스 도산'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: myfont_size,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausDosan/main.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausDosan/2.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausDosan/3.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausDosan/4.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausDosan/5.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausDosan/6.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausDosan/7.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausDosan/8.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausDosan/9.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausDosan/10.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                    ]))),
            SizedBox(height: pic_height),
            ListTile(
              title: Text(
                '롯데타워'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: myfont_size,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulLotteTower/main.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulLotteTower/v1.gif',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulLotteTower/2.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulLotteTower/3.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulLotteTower/4.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                    ]))),
            SizedBox(height: pic_height),
            ListTile(
              title: Text(
                '홍대'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: myfont_size,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulHongDae/main.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulHongDae/v1.gif',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulHongDae/2.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulHongDae/3.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulHongDae/4.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulHongDae/5.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulHongDae/6.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                    ]))),
            SizedBox(height: pic_height),
            ListTile(
              title: Text(
                '신사'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: myfont_size,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulSinsa/main.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulSinsa/2.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulSinsa/3.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulSinsa/4.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulSinsa/5.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/SeoulSinsa/6.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                    ]))),
            SizedBox(height: pic_height),
            ListTile(
              title: Text(
                '하우스 상하이'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: myfont_size,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/main.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/v1.gif',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/2.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/3.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/4.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/5.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/6.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/7.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/8.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/9.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/10.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/11.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/12.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset('images/HausShanghai/13.jpg',
                              width: 320, height: 180, fit: BoxFit.fill)),
                    ]))),
            SizedBox(height: pic_height),
            ListTile(
              title: Text(
                '베이징 산리툰 타이쿠리'.toUpperCase(),
                style: Theme.of(context).textTheme.overline!.copyWith(
                      fontSize: myfont_size,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Card(
                    margin: const EdgeInsets.all(10),
                    child: Row(children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                              'images/BeijingSanlitunTaikooLi/main.jpg',
                              width: 320,
                              height: 180,
                              fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                              'images/BeijingSanlitunTaikooLi/2.jpg',
                              width: 320,
                              height: 180,
                              fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                              'images/BeijingSanlitunTaikooLi/3.jpg',
                              width: 320,
                              height: 180,
                              fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                              'images/BeijingSanlitunTaikooLi/4.jpg',
                              width: 320,
                              height: 180,
                              fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                              'images/BeijingSanlitunTaikooLi/5.jpg',
                              width: 320,
                              height: 180,
                              fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                              'images/BeijingSanlitunTaikooLi/6.jpg',
                              width: 320,
                              height: 180,
                              fit: BoxFit.fill)),
                      SizedBox(width: pic_width),
                      ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                              'images/BeijingSanlitunTaikooLi/7.jpg',
                              width: 320,
                              height: 180,
                              fit: BoxFit.fill)),
                    ]))),
            SizedBox(height: pic_height),
          ],
        ),
      ),
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text("GENTLE MONSTER SPACE TEST PAGE"),
        titleTextStyle: const TextStyle(
            fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),
        actions: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                key = key + 1;
              });
            },
            child: Text("RELOAD".toUpperCase()),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          if (constraints.maxWidth >= 800) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 6,
                  fit: FlexFit.tight,
                  child: settings,
                ),
                Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: chart,
                )
              ],
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: 32,
                    ),
                    child: chart,
                  ),
                  settings,
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class HomePage2 extends StatelessWidget {
  HomePage2({Key? key}) : super(key: key);

  final dataMap = <String, double>{
    "Flutter": 5,
  };

  final colorList = <Color>[
    Colors.greenAccent,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pie Chart 1"),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: PieChart(
          dataMap: dataMap,
          chartType: ChartType.ring,
          baseChartColor: Colors.grey[50]!.withOpacity(0.15),
          colorList: colorList,
          chartValuesOptions: const ChartValuesOptions(
            showChartValuesInPercentage: true,
          ),
          totalValue: 20,
        ),
      ),
    );
  }
}
