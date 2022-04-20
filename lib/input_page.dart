import 'dart:ui';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:grafpix/icons.dart';
import 'icon_content.dart';

const double bottomContainerHeight = 80;
const activeCardColor = Color(0xFF1D1E33);
const inActiveCardColor = Color(0xFF111328);

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {


  @override
  _InputPageState createState() => _InputPageState();
}


class _InputPageState extends State<InputPage> {
  Color maleCardColor = inActiveCardColor;
  Color femaleCardColor = inActiveCardColor;
  Color inActiveMaleCardColor = inActiveCardColor;
  Color inActiveFemaleCardColor = inActiveCardColor;
  int weight = 60;


  void updateColor(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if(maleCardColor == inActiveCardColor)
      maleCardColor = activeCardColor;
      femaleCardColor = inActiveCardColor;
    } else {
      maleCardColor = inActiveCardColor;
    }
    if (selectedGender == Gender.female) {
      if(femaleCardColor == inActiveCardColor)
        femaleCardColor = activeCardColor;
      maleCardColor = inActiveCardColor;
    } else {
      femaleCardColor = inActiveCardColor;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: (){
                    setState(() {
                      updateColor(Gender.male);
                    });
                  },
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        updateColor(Gender.male);
                      });
                    },
                    child: Expanded(
                      child: ReusableCard(
                        colour: activeCardColor,
                        cardChild:
                            IconContent(icon: PixIcon.fa_mars, label: 'Male'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild:
                        IconContent(icon: PixIcon.fa_venus, label: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget> [
                        Text(
                          'WEIGHT',
                          //style: kLabelTextStyle,
                        ),

                        Text(
                          weight.toString(),
                        ),
                        Row(
                          children: <Widget>[
                          FloatingActionButton(
                            child: Icon(Icons.add, color:Colors.white),
                              backgroundColor: Color(0xFF4C4F5E),
                            onPressed: () {  },
                              ),
                            SizedBox(width: 10.0,),
                            FloatingActionButton(
                              child: Icon(Icons.add, color:Colors.white),
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {  },
                            ),
                          ]
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: Row(children: <Widget>[
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                      cardChild: SizedBox(),
                    ),
                  ),
                  Expanded(
                    child: ReusableCard(
                      colour: activeCardColor,
                      cardChild: SizedBox(),
                    ),
                  ),
                ])),
                Container(
                  color: Color(0xFFEB1555),
                  margin: EdgeInsets.only(top: 10.0),
                  width: double.infinity,
                  height: bottomContainerHeight,
                ),
              ],
            ),
          ),
        ]));
  }
}

class RoundButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
      width: 56.0,
      height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xEF4C4F5E),
      elevation: 6.0,
      onPressed: () {  },

    );
  }
}

