// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

void main() => runApp(MySimpleApp());

class MySimpleApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySimpleAppState();
  }
}

class MySimpleAppState extends State<MySimpleApp> {
  var n1, n2, n3;
  var sum;
  TextEditingController inputController1 = TextEditingController();
  TextEditingController inputController2 = TextEditingController();
  TextEditingController inputController3 = TextEditingController();

  void calculateSum(var n1, var n2, var n3) {
    n1 = double.tryParse(inputController1.text);
    n2 = double.tryParse(inputController2.text);
    n3 = double.tryParse(inputController3.text);

    setState(() {
      if (n1 == null || n2 == null || n3 == null) {
        sum = 'Invalid! Enter all 3 numbers.';
      } else {
        sum = n1 + n2 + n3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('Simple App'),
            ),
            body: Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text('Enter 3 numbers you want to add up:',
                      style: TextStyle(
                        fontSize: 20,
                      )),
                  NumberInput('Number 1', inputController1),
                  NumberInput('Number 2', inputController2),
                  NumberInput('Number 3', inputController3),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: ElevatedButton(
                        child: Text('Calculate Sum'),
                        onPressed: () => calculateSum(n1, n2, n3)),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Result: ' + sum.toString(),
                        style: TextStyle(
                          fontSize: 20,
                        )),
                  )
                ],
              ),
            )));
  }
}

class NumberInput extends StatelessWidget {
  final String numberInput;
  final TextEditingController inputController;

  NumberInput(this.numberInput, this.inputController);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: TextField(
            controller: this.inputController,
            decoration: InputDecoration(
              hintText: this.numberInput,
              labelText: this.numberInput,
            ),
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
            )));
  }
}
