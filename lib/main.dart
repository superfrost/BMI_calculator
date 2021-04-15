import 'package:flutter/material.dart';
import 'package:weight_calc/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Colors.purple[900],
        canvasColor: Colors.pink,
        sliderTheme: SliderTheme.of(context).copyWith(
          thumbColor: Colors.pink,
          activeTrackColor: Colors.white,
          inactiveTrackColor: Colors.grey,
          overlayColor: Color(0x79af00af),
          overlayShape: RoundSliderOverlayShape(overlayRadius: 30.0),
          thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 15, disabledThumbRadius: 15),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => TestPage(),
        // '/result': (context) => ResultPage(),
      },
    );
  }
}
