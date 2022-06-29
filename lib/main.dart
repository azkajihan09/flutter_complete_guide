import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _curentStep = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text(widget.toString()),
            ),
            body: Center(
              child: Stepper(
                steps: const [
                  Step(
                      title: Text('Step 1'),
                      content: Text('Information for step 1'),),
                  Step(
                      title: Text('Step 2'),
                      content: Text('Information for step 2')),

                  Step(
                      title: Text('Step 3'),
                      content: Text('Information for step 3')),

                ],
                onStepTapped: (int newindex) {
                  setState(() {
                    _curentStep = newindex;
                  });
                },
                currentStep: _curentStep,
                onStepContinue: () {
                  setState(() {
                    if (_curentStep != 2) {
                      setState(() {
                        _curentStep = _curentStep + 1;
                      });
                    }
                  });
                },
                onStepCancel: () {
                  if (_curentStep != 0) {
                    setState(() {
                      _curentStep -= 1;
                    });
                  }
                },
              ),
            )));
  }
}
