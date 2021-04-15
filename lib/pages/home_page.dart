import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:weight_calc/controllers/bmi_controller.dart';
import 'package:weight_calc/pages/result_page.dart';
import 'package:weight_calc/widgets/bottom_button.dart';
import 'package:weight_calc/widgets/card.dart';
import 'package:weight_calc/widgets/column_num_butt.dart';
import 'package:weight_calc/constants.dart';
import 'package:weight_calc/widgets/icon_container.dart';

enum Gender {
  female,
  male,
}

class TestPage extends StatefulWidget {
  @override
  _TestPageState createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  Gender chekedGender = Gender.male;
  int choosenHeight = 180;
  int choosenWeight = 70;
  int choosenAge = 20;
  double result;

  void showResult() {
    BMIController calc = BMIController(
        height: choosenHeight,
        weight: choosenWeight,
        age: choosenAge,
        genderIndex: chekedGender.index);

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return ResultPage(
          bmi: calc.calculateBMI(),
          result: calc.result(),
          interpretation: calc.interpretation(),
        );
      }),
    );
    // Navigator.pushNamed(context, '/result', arguments: result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: TestCard(
                    onTap: () {
                      setState(() {
                        chekedGender = Gender.male;
                      });
                    },
                    color: chekedGender == Gender.male
                        ? activeCardColor
                        : inactiveCardColor,
                    child: IconContainer(
                        icon: Icon(
                          FontAwesomeIcons.mars,
                          size: iconsFontSize,
                        ),
                        label: 'MALE'),
                  ),
                ),
                Expanded(
                  child: TestCard(
                    onTap: () {
                      setState(() {
                        chekedGender = Gender.female;
                      });
                    },
                    color: chekedGender == Gender.female
                        ? activeCardColor
                        : inactiveCardColor,
                    child: IconContainer(
                        icon: Icon(
                          FontAwesomeIcons.venus,
                          size: iconsFontSize,
                        ),
                        label: 'FEMALE'),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TestCard(
              color: activeCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('HEIGHT', style: TextStyle(fontSize: labelFontSize)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        choosenHeight.toString(),
                        style: bigLabelStyle,
                      ),
                      Text('CM', style: TextStyle(fontSize: labelFontSize))
                    ],
                  ),
                  Slider(
                      min: 100,
                      max: 280,
                      divisions: 180,
                      value: choosenHeight.toDouble(),
                      onChanged: (newHeight) {
                        setState(() {
                          choosenHeight = newHeight.toInt();
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: TestCard(
                    color: activeCardColor,
                    child: ColumnNumButtons(
                      label: 'WEIGHT',
                      bigNum: choosenWeight,
                      onPressedSub: () {
                        setState(() {
                          choosenWeight -= 1;
                        });
                      },
                      onPressedAdd: () {
                        setState(() {
                          choosenWeight += 1;
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: TestCard(
                    color: activeCardColor,
                    child: ColumnNumButtons(
                      label: 'AGE',
                      bigNum: choosenAge,
                      onPressedSub: () {
                        setState(() {
                          choosenAge -= 1;
                        });
                      },
                      onPressedAdd: () {
                        setState(() {
                          choosenAge += 1;
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            label: 'Calculate',
            onTap: () {
              showResult();
            },
          ),
        ],
      ),
    );
  }
}
