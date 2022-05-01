import 'package:flutter/material.dart';

void main() => runApp(MySimpleApp());

class MySimpleApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MySimpleAppState();
  }
}

class MySimpleAppState extends State<MySimpleApp> {
  var n1, n2, n3; // step 1
  var sum; // step 1
  TextEditingController inputController1 = TextEditingController(); // step 1
  TextEditingController inputController2 = TextEditingController(); // step 1
  TextEditingController inputController3 = TextEditingController(); // step 1

  void calculateSum(var n1, var n2, var n3) {
    // step 2
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
        // widget 3
        home: Scaffold(
            appBar: AppBar(
              title: Text('Simple App'),
            ),
            body: Container(
              // widget 2
              margin: EdgeInsets.all(10), // add margin around Column widget
              child: Column(
                children: [
                  Text('Enter 3 numbers you want to add up:', // widget 1a
                      style: TextStyle(
                        fontSize: 20, // set font size
                      )),
                  NumberInput('Number 1', inputController1), // widget 1b-1
                  NumberInput('Number 2', inputController2), // widget 1b-2
                  NumberInput('Number 3', inputController3), // widget 1b-3
                  Padding(
                    // widget 1c
                    padding:
                        EdgeInsets.all(20), // add padding around ElevatedButton
                    child: ElevatedButton(
                        child: Text('Calculate Sum'),
                        onPressed: () => calculateSum(n1, n2, n3)),
                  ),
                  Padding(
                    // widget 1d
                    padding: EdgeInsets.all(10), // add padding around Text
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
  // widget 1
  final String numberInput;
  final TextEditingController inputController;

  NumberInput(this.numberInput, this.inputController);

  @override
  Widget build(BuildContext context) {
    return Container(
        // widget 2-1
        margin: EdgeInsets.all(10), // add margin around TextField
        child: TextField(
            // widget 2-2
            controller: this.inputController, // step 3
            decoration: InputDecoration(
              hintText: this.numberInput,
              labelText: this.numberInput,
            ),
            keyboardType: TextInputType.numberWithOptions(
              decimal: true,
            )));
  }
}
