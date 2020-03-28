import 'package:flutter/material.dart';

class StepperDemo extends StatefulWidget {


  @override
  _StepperDemoState createState() => _StepperDemoState();
}

class _StepperDemoState extends State<StepperDemo> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(title:Text("StepperDemo")),
      body:Container(
        padding:EdgeInsets.all(16.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Theme(
              data: Theme.of(context).copyWith(
                primaryColor: Colors.black
              ),
              child: Stepper(
                currentStep: _currentIndex,
                onStepTapped: (value){
                  setState(() {
                    _currentIndex = value;
                  });
                },
                steps: [
                  Step(
                    title: Text("Login"), 
                    subtitle: Text("Login First"),
                    content: Text("This is First Login"),
                    isActive: _currentIndex == 0
                    ),
                     Step(
                    title: Text("Choose plan"), 
                    subtitle: Text("Choose Your plan"),
                    content: Text("This Choose Your plan"),
                    isActive: _currentIndex == 1,//状态是否激活
                    ),
                     Step(
                    title: Text("Confirm Plan"), 
                    subtitle: Text("Confirm your Plan"),
                    content: Text("This is Confirm your Plan"),
                    isActive: _currentIndex == 2
                    ),
                ]
              ),
            ),
          ],
        ),
      ),
    );
  }
}