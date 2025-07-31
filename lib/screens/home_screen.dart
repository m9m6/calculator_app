import 'package:flutter/material.dart';
import '../widgets/calculator_button.dart';
import '../utils/calculator_logic.dart';

class Homescreen extends StatefulWidget {
  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String resultText = '';
  String leftHandSide = '';
  String operator = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(color: Color(0xFF17181A)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  resultText,
                  style: TextStyle(fontSize: 40, color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildRow(['AC', '⌫', '/']),
                        buildRow(['7', '8', '9']),
                        buildRow(['4', '5', '6']),
                        buildRow(['1', '2', '3']),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              height: 80,
                              width: 180,
                              child: CalculatorButton(
                                text: '0',
                                onPressed: () => onDigitClick('0'),
                              ),
                            ),
                            CalculatorButton(
                              text: '.',
                              onPressed: () => onDigitClick('.'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CalculatorButton(
                        text: '*',
                        backgroundColor: Color(0xFF005DB2),
                        textColor: Color(0xFF05ADF0),
                        onPressed: () => onOperatorClick('*'),
                      ),
                      CalculatorButton(
                        text: '-',
                        backgroundColor: Color(0xFF005DB2),
                        textColor: Color(0xFF05ADF0),
                        onPressed: () => onOperatorClick('-'),
                      ),
                      SizedBox(
                        height: 125,
                        width: 80,
                        child: CalculatorButton(
                          text: '+',
                          backgroundColor: Color(0xFF005DB2),
                          textColor: Color(0xFF05ADF0),
                          onPressed: () => onOperatorClick('+'),
                        ),
                      ),
                      SizedBox(
                        height: 130,
                        width: 80,
                        child: CalculatorButton(
                          text: '=',
                          backgroundColor: Color(0xFF005DB2),
                          textColor: Color(0xFF05ADF0),
                          onPressed: () => returnEqual(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRow(List<String> texts) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: texts.map((text) {
        return CalculatorButton(
          text: text,
          backgroundColor: Color(0xFF616161) ,
          textColor: Color(0xB9A9A9A9),
          onPressed: () => onButtonPressed(text),
        );
      }).toList(),
    );
  }

  void onButtonPressed(String text) {
    if (text == 'AC') {
      clearScreen();
    } else if (text == '⌫') {
      backspace();
    } else if ('+-*/'.contains(text)) {
      onOperatorClick(text);
    } else {
      onDigitClick(text);
    }
  }

  void onDigitClick(String text) {
    resultText += text;
    setState(() {});
  }

  void onOperatorClick(String text) {
    if (operator.isEmpty) {
      leftHandSide = resultText;
    } else {
      String rightHandSide = resultText;
      leftHandSide = CalculatorLogic.calculate(leftHandSide, operator, rightHandSide);
    }
    operator = text;
    resultText = '';
    setState(() {});
  }

  void returnEqual() {
    String rightHandSide = resultText;
    resultText = CalculatorLogic.calculate(leftHandSide, operator, rightHandSide);
    leftHandSide = '';
    operator = '';
    setState(() {});
  }

  void clearScreen() {
    resultText = '';
    leftHandSide = '';
    operator = '';
    setState(() {});
  }

  void backspace() {
    if (resultText.isNotEmpty) {
      resultText = resultText.substring(0, resultText.length - 1);
      setState(() {});
    }
  }
}