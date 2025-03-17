import 'package:flutter/material.dart';
import 'bmi_calculator.dart';

void main() {
  runApp(BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: InputPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('BMI CALCULATOR')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Height', style: TextStyle(fontSize: 18, color: Colors.white70)),
                Text('$height cm', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                Slider(
                  value: height.toDouble(),
                  min: 100,
                  max: 220,
                  activeColor: Colors.red,
                  inactiveColor: Colors.white30,
                  onChanged: (double newValue) {
                    setState(() {
                      height = newValue.round();
                    });
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Weight', style: TextStyle(fontSize: 18, color: Colors.white70)),
                      Text('$weight kg', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'weight-',
                            child: Icon(Icons.remove),
                            onPressed: () => setState(() => weight--),
                          ),
                          SizedBox(width: 20),
                          FloatingActionButton(
                            heroTag: 'weight+',
                            child: Icon(Icons.add),
                            onPressed: () => setState(() => weight++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Age', style: TextStyle(fontSize: 18, color: Colors.white70)),
                      Text('$age', style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'age-',
                            child: Icon(Icons.remove),
                            onPressed: () => setState(() => age--),
                          ),
                          SizedBox(width: 20),
                          FloatingActionButton(
                            heroTag: 'age+',
                            child: Icon(Icons.add),
                            onPressed: () => setState(() => age++),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              BMICalculator calc = BMICalculator(height: height, weight: weight);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: Colors.pink,
              height: 60,
              child: Center(child: Text('CALCULATE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultPage({required this.bmiResult, required this.resultText, required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Your Result')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Center(
              child: Text('Your Result', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
            ),
          ),
          Expanded(
            flex: 5,
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(resultText.toUpperCase(), style: TextStyle(fontSize: 22, color: Colors.green)),
                  Text(bmiResult, style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold)),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              color: Colors.pink,
              height: 60,
              child: Center(child: Text('RE-CALCULATE', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            ),
          ),
        ],
      ),
    );
  }
}
