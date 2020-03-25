import 'package:flutter/material.dart';

class FortDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("FormDemo")
      ),
        body: Container(
      color: Colors.white,
      padding: EdgeInsets.all(15.0),
      child: Center(child: RegisterDemo()),
    ));
  }
}

class RegisterDemo extends StatefulWidget {
  RegisterDemo({Key key}) : super(key: key);

  @override
  _RegisterDemoState createState() => _RegisterDemoState();
}

class _RegisterDemoState extends State<RegisterDemo> {
  final registerKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidator = false;

  void submitRegister() {
    if (registerKey.currentState.validate()) {
      registerKey.currentState.save();

      debugPrint("username:$username");
      debugPrint("password:$password");

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Register..."),
      ));
    } else {
      setState(() {
        autovalidator = true;
      });
    }
  }

  String usernameValidator(value) {
    if (value.isEmpty) {
      return "Username is requier";
    }

    return null;
  }

  String passwordValidator(value) {
    if (value.isEmpty) {
      return "Passord is requier";
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: registerKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              decoration:
                  InputDecoration(labelText: "UserName", helperText: ""),
              onSaved: (value) {
                username = value;
              },
              validator: usernameValidator,
              autovalidate: autovalidator,
            ),
            TextFormField(
              obscureText: true,
              decoration:
                  InputDecoration(labelText: "PassWord", helperText: ""),
              onSaved: (value) {
                password = value;
              },
              validator: passwordValidator,
              autovalidate: autovalidator,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                  color: Colors.blue,
                  child: Text("Rigister",
                      style: TextStyle(fontSize: 16, color: Colors.white)),
                  elevation: 0.0,
                  onPressed: () {
                    submitRegister();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class TextFileDemo extends StatefulWidget {
  @override
  _TextFileDemoState createState() => _TextFileDemoState();
}

class _TextFileDemoState extends State<TextFileDemo> {
  final textEditingControll = TextEditingController();
  @override
  void dispose() {
    textEditingControll.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // textEditingControll.text = "hello";
    textEditingControll.addListener(() {
      debugPrint('input:${textEditingControll.text}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: textEditingControll,
        //  onChanged:(value) =>{
        //    debugPrint("input:$value")
        //  },
        onSubmitted: (value) => {debugPrint("submit:$value")},
        decoration: InputDecoration(
            icon: Icon(Icons.subject),
            labelText: "Title",
            labelStyle: TextStyle(fontWeight: FontWeight.bold),
            // border: InputBorder.none,//去除下面的横线
            border: OutlineInputBorder(),
            hintText: "Enter the Post"),
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}
