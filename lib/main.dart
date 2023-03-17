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

  double? pic_width = 200;
  double? pic_height = 15;
  double? myfont_size = 15;
  double? circle_size = 70;

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
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Center(
                    child: ListTile(
                      title: Center(
                        child: Text(
                          'gentle monster'.toUpperCase(),
                          style: Theme.of(context).textTheme.overline!.copyWith(
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Flexible(flex: 22, child:TextButton(
                    onPressed: () {},
                      child: Center(
                              child: Text(
                                  'store'.toUpperCase(),
                                  style: const TextStyle(
                                      color:
                                      Color.fromARGB(255, 255, 255, 255),
                                      fontSize: 35,
                                      fontWeight: FontWeight.bold))))),
                          Flexible(flex: 12,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text(
                                    'best'.toUpperCase(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 30.0,
                                        fontWeight: FontWeight.bold),
                                  )))),
                          Flexible(flex: 12,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text(
                                    'better'.toUpperCase(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  )))),
                          Flexible(flex: 12,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text(
                                    'archive'.toUpperCase(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ))))
                        ]),
                  ),
                  SizedBox(height: 25),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(flex:1,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text(
                                    'dfs'.toUpperCase(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  )))),
                          Flexible(flex:1,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/red_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(flex:1,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/yellow_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(flex:1,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/blue_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill)))
                        ]),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text(
                                    'mall'.toUpperCase(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  )))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/red_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/yellow_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/blue_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill)))
                        ]),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text(
                                    'fs'.toUpperCase(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  )))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/red_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/yellow_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/blue_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill)))
                        ]),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text(
                                      'm.fs'.toUpperCase(),
                                      style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/red_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/yellow_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/blue_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill)))
                        ]),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text(
                                        'haus'.toUpperCase(),
                                        style: const TextStyle(
                                            color: Color.fromARGB(
                                                255, 255, 255, 255),
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold),
                                      )))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/red_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/yellow_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/blue_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill)))
                        ]),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Center(
                                      child: Text(
                                    'pop-up'.toUpperCase(),
                                    style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  )))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/red_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/yellow_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill))),
                          Flexible(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Image.asset(
                                      'images/icon/blue_circle.png',
                                      width: circle_size,
                                      height: circle_size,
                                      fit: BoxFit.fill)))
                        ]),
                  ),
                 const SizedBox(height: 30)
                ],
              ),
            )));
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
          if (constraints.maxWidth >= 1200) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(
                  flex: 6,
                  fit: FlexFit.tight,
                  child: settings,
                ),
                Flexible(
                  flex: 3,
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
