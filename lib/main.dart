import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:gm_space_1/ScreenA3.dart';
import 'package:gm_space_1/ScreenA4.dart';
import 'package:gm_space_1/ScreenA5.dart';
import 'package:gm_space_1/ScreenA6.dart';
import 'package:gm_space_1/ScreenA7.dart';
import 'package:pie_chart/pie_chart.dart';

import 'ScreenA2.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      title: 'GENTLE MONSTER SPACE',
      theme: ThemeData(primarySwatch: Colors.grey),
      darkTheme: ThemeData(
        primarySwatch: Colors.blueGrey,
        brightness: Brightness.dark,
      ),
      initialRoute: '/',
      // home: const HomePage(),
      routes: {
        '/': (context) => const HomePage(),
        '/A2': (context) => ScreenA2(),
        '/A3': (context) => ScreenA3(),
        '/A4': (context) => ScreenA4(),
        '/A5': (context) => ScreenA5(),
        '/A6': (context) => ScreenA6(),
        '/A7': (context) => ScreenA7(),
      },
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
    "HIGH-END": 60,
    "ARTISTIC": 23,
    "SURPRISE": 10,
    "WIT": 7,
  };

  final legendLabels = <String, String>{
    "HIGH-END": "멋있다!",
    "ARTISTIC": "ㅋㅋㅋ",
    "SURPRISE": "하하하",
    "WIT": "우와",
  };

  final colorList = <Color>[
    const Color.fromRGBO(79, 128, 188, 1),
    const Color.fromRGBO(191, 80, 77, 1),
    const Color.fromRGBO(155, 186, 88, 1),
    const Color.fromRGBO(127, 99, 161, 1),
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
  ChartType? _chartType = ChartType.ring;
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
  double? circle_size = 50;

  @override
  Widget build(BuildContext context) {
    final chart = Center(
      child: Column(
        children: [
          const Flexible(flex: 1, child: SizedBox(height: 60)),
          Flexible(
              flex: 1,
              child: Row(
                children: [
                  const SizedBox(width: 50),
                  Center(
                    child: TextButton(
                        style: TextButton.styleFrom(
                            fixedSize: const Size(200, 20),
                            padding: const EdgeInsets.all(10),
                            backgroundColor: Colors.black),
                        onPressed: () {},
                        child: Text('EMOTIONAL RATIO'.toUpperCase(),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold))),
                  ),
                ],
              )),
          const Flexible(flex: 1, child: SizedBox(height: 100)),
          Flexible(
              flex: 2,
              child: Center(
                child: Row(
                  children: [
                    PieChart(
                      key: ValueKey(key),
                      dataMap: dataMap,
                      animationDuration: const Duration(milliseconds: 800),
                      chartLegendSpacing: _chartLegendSpacing!,
                      chartRadius: math.min(
                          MediaQuery.of(context).size.width / 3.2, 300),
                      colorList: colorList,
                      initialAngleInDegree: 0,
                      chartType: _chartType!,
                      centerText: _showCenterText ? "" : null,
                      //EMOTIONAL RATIO
                      centerTextStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromRGBO(0, 0, 0, 1)),
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
                            color: Color.fromRGBO(0, 0, 0, 1)),
                      ),
                      chartValuesOptions: ChartValuesOptions(
                        showChartValueBackground: _showChartValueBackground,
                        showChartValues: _showChartValues,
                        showChartValuesInPercentage:
                            _showChartValuesInPercentage,
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
                    ),
                  ],
                ),
              )),
          const Flexible(flex: 1, child: SizedBox(height: 200))
        ],
      ),
    );

    final settings = Center(
      child: Column(
        children: [
          const SizedBox(height: 120),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Flexible(
                  flex: 1,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: const Size(200, 20),
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.black),
                      onPressed: () {},
                      child: Center(
                          child: Text('size(py)'.toUpperCase(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold))))),
              const Flexible(flex: 1, child: SizedBox(width: 30)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: const Size(200, 20),
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.black),
                      onPressed: () {},
                      child: Center(
                          child: Text(
                        'best'.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold),
                      )))),

              const Flexible(flex: 1, child: SizedBox(width: 30)),
//
              Flexible(
                  flex: 1,
                  child: TextButton(
                      style: TextButton.styleFrom(
                          fixedSize: const Size(200, 20),
                          padding: const EdgeInsets.all(10),
                          backgroundColor: Colors.black),
                      onPressed: () {},
                      child: Center(
                          child: Text(
                        'better'.toUpperCase(),
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )))),
            ]),
          ),
          const SizedBox(height: 20),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const Flexible(flex:1, child: SizedBox(width: 10)),
              Flexible(
                  flex: 1,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(fixedSize: const Size(120, 20)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/A2');
                      },
                      child: Center(
                          child: Text(
                        '~20'.toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))),

              const Flexible(flex: 1, child: SizedBox(width: 140)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),

              const Flexible(flex: 1, child: SizedBox(width: 160)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),
              const Flexible(flex: 1, child: SizedBox(width: 30)),
            ]),
          ),
          const SizedBox(height: 15),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const Flexible(flex:1, child: SizedBox(width: 10)),
              Flexible(
                  flex: 1,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(fixedSize: const Size(120, 20)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/A3');
                      },
                      child: Center(
                          child: Text(
                        '~50'.toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))),

              const Flexible(flex: 1, child: SizedBox(width: 140)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),

              const Flexible(flex: 1, child: SizedBox(width: 160)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),
              const Flexible(flex: 1, child: SizedBox(width: 30)),
            ]),
          ),
          const SizedBox(height: 15),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const Flexible(flex:1, child: SizedBox(width: 10)),
              Flexible(
                  flex: 1,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(fixedSize: const Size(120, 20)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/A4');
                      },
                      child: Center(
                          child: Text(
                        '~100'.toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))),

              const Flexible(flex: 1, child: SizedBox(width: 140)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),

              const Flexible(flex: 1, child: SizedBox(width: 160)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),
              const Flexible(flex: 1, child: SizedBox(width: 30)),
            ]),
          ),
          const SizedBox(height: 15),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const Flexible(flex:1, child: SizedBox(width: 10)),
              Flexible(
                  flex: 1,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(fixedSize: const Size(120, 20)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/A5');
                      },
                      child: Center(
                          child: Text(
                        '~200'.toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))),

              const Flexible(flex: 1, child: SizedBox(width: 140)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),

              const Flexible(flex: 1, child: SizedBox(width: 160)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),
              const Flexible(flex: 1, child: SizedBox(width: 30)),
            ]),
          ),
          const SizedBox(height: 15),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const Flexible(flex:1, child: SizedBox(width: 10)),
              Flexible(
                  flex: 1,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(fixedSize: const Size(120, 20)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/A3');
                      },
                      child: Center(
                          child: Text(
                        '200~'.toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))),

              const Flexible(flex: 1, child: SizedBox(width: 140)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),

              const Flexible(flex: 1, child: SizedBox(width: 160)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),
              const Flexible(flex: 1, child: SizedBox(width: 30)),
            ]),
          ),
          const SizedBox(height: 15),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const Flexible(flex:1, child: SizedBox(width: 10)),
              Flexible(
                  flex: 1,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(fixedSize: const Size(120, 20)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/A6');
                      },
                      child: Center(
                          child: Text(
                        'haus'.toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))),

              const Flexible(flex: 1, child: SizedBox(width: 140)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),

              const Flexible(flex: 1, child: SizedBox(width: 160)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),
              const Flexible(flex: 1, child: SizedBox(width: 30)),
            ]),
          ),
          const SizedBox(height: 15),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const Flexible(flex:1, child: SizedBox(width: 10)),
              Flexible(
                  flex: 1,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(fixedSize: const Size(120, 20)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/A7');
                      },
                      child: Center(
                          child: Text(
                        'pop-up'.toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))),

              const Flexible(flex: 1, child: SizedBox(width: 140)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),

              const Flexible(flex: 1, child: SizedBox(width: 160)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.grey, size: circle_size),
                  )),
              const Flexible(flex: 1, child: SizedBox(width: 30)),
            ]),
          ),
          const SizedBox(height: 15),
          Center(
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // const Flexible(flex:1, child: SizedBox(width: 10)),
              Flexible(
                  flex: 1,
                  child: TextButton(
                      style:
                          TextButton.styleFrom(fixedSize: const Size(120, 20)),
                      onPressed: () {
                        Navigator.pushNamed(context, '/A7;');
                      },
                      child: Center(
                          child: Text(
                        'ARCHIVE'.toUpperCase(),
                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )))),

              const Flexible(flex: 1, child: SizedBox(width: 140)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.square_rounded,
                        color: Colors.black, size: circle_size),
                  )),

              const Flexible(flex: 1, child: SizedBox(width: 160)),

              Flexible(
                  flex: 1,
                  child: TextButton(
                    onPressed: () {},
                    child: Icon(Icons.circle_outlined,
                        color: Colors.white, size: circle_size),
                  )),
              const Flexible(flex: 1, child: SizedBox(width: 30)),
            ]),
          ),
          const SizedBox(height: 15)
        ],
      ),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('images/oomot.png',
            height: 50, alignment: Alignment.centerLeft),
        // title: const Text("GENTLE MONSTER SPACE TEST PAGE"),
        // titleTextStyle: const TextStyle(
        //     fontSize: 20, color: Color.fromRGBO(0, 0, 0, 1)),
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
