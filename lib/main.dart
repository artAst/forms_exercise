import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final _formKey = new GlobalKey<FormState>();
  String _genderGrp = "";

  void _radioChanged(value) {
    setState(() {
      _genderGrp = value;
    });
  }

  String _checkEmptyValidtion(String value) {
    if (value.isEmpty) {
      return 'Input First Name';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Customer Info"),
      ),
      bottomNavigationBar: new Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 10.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new FlatButton(
              color: Colors.grey,
              onPressed: (){},
              child: new Text("Submit", style: new TextStyle(color: Colors.white))
            )
          ],
        ),
      ),
      body: new Form(
        key: _formKey,
        child: new Container(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "First Name",
                ),
                validator: _checkEmptyValidtion
              ),
              new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Last Name",
                ),
                validator: _checkEmptyValidtion,
              ),
              new Padding(padding: const EdgeInsets.only(top: 20.0)),
              new Text("Gender", style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
              new Padding(padding: const EdgeInsets.only(top: 10.0)),
              new Row(
                children: <Widget>[
                  new Radio(value: "male", groupValue: _genderGrp, onChanged: _radioChanged),
                  new Text("Male", style: new TextStyle(fontSize: 18.0))
                ],
              ),
              new Row(
                children: <Widget>[
                  new Radio(value: "female", groupValue: _genderGrp, onChanged: _radioChanged),
                  new Text("Female", style: new TextStyle(fontSize: 18.0))
                ],
              )
            ],
          ),
        )
      )
    );
  }
}
