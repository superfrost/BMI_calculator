import 'package:flutter/material.dart';
import 'package:weight_calc/constants.dart';
import 'package:weight_calc/widgets/bottom_button.dart';
import 'package:weight_calc/widgets/card.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {@required this.result,
      @required this.bmi,
      @required this.interpretation});
  final String bmi;
  final String result;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Rusult:',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w600),
          ),
          Expanded(
            child: TestCard(
              color: activeCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    result,
                    style: TextStyle(
                        color: Color(0xff00af50),
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    bmi,
                    style: TextStyle(
                      fontSize: 90,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  Text(
                    interpretation,
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
            label: 'Got it',
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
