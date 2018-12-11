import 'package:flutter/material.dart';

void main() => runApp(MycalculatorApp());

class MycalculatorApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'my Calculator',
      theme: new ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: MyCalc(),
    );
  }
}

class MyCalc extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => Calculator();

}

class Calculator extends State<MyCalc>{

  //Controller for TextFormField

  final Controller_numberA = TextEditingController();
  final Controller_numberB = TextEditingController();
  final My_form_key = GlobalKey<FormState>();

  String textToShow = "";

  //function sum
  void sum(){
    if(My_form_key.currentState.validate()){
      int numberA = int.parse(Controller_numberA.text);
      int numberB = int.parse(Controller_numberB.text);
      int result = numberA + numberB;

      setState(() {
        textToShow = "$numberA + $numberB = $result";
      });
    }
  }

  //function minus
  void minus(){
    if(My_form_key.currentState.validate()){
      int numberA = int.parse(Controller_numberA.text);
      int numberB = int.parse(Controller_numberB.text);
      int result = numberA - numberB;

      setState(() {
        textToShow = "$numberA - $numberB = $result";
      });
    }
  }

  //function minus
  void times(){
    if(My_form_key.currentState.validate()){
      int numberA = int.parse(Controller_numberA.text);
      int numberB = int.parse(Controller_numberB.text);
      int result = numberA * numberB;

      setState(() {
        textToShow = "$numberA * $numberB = $result";
      });
    }
  }

  //function minus
  void divide(){
    if(My_form_key.currentState.validate()){
      int numberA = int.parse(Controller_numberA.text);
      int numberB = int.parse(Controller_numberB.text);
      double result = numberA / numberB;

      setState(() {
        textToShow = "$numberA / $numberB = $result";
      });
    }
  }

  @override
  Widget build(BuildContext context) {

    //create layout
    return new Scaffold(
      backgroundColor: Colors.white,
      body: Form(key: My_form_key, child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[
        new Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          direction: Axis.horizontal,
          children: <Widget>[
            TextFormField(
                controller: Controller_numberA,
                validator: (value){
                  if(value.isEmpty) return "Please enter a number";
                },
                decoration: InputDecoration(labelText: 'Enter a number'),
                keyboardType: TextInputType.number),
            TextFormField(
                controller: Controller_numberB,
                validator: (value){
                  if(value.isEmpty) return "Please enter a number";
                },
                decoration: InputDecoration(labelText: 'Enter a number'),
                keyboardType: TextInputType.number),

            //Create result textField
            Text(textToShow,style: TextStyle(fontSize: 20.0),),
          ],
        ),

        //Create 4 buttons in a row
        new Wrap(
          alignment: WrapAlignment.center,
          spacing: 8.0, // gap between adjacent chips
          runSpacing: 4.0, // gap between lines
          direction: Axis.horizontal, // main axis (rows or columns)
          children: <Widget>[
            new Wrap(
              spacing: 8.0, // gap between adjacent chips
              children: <Widget>[
                RaisedButton(onPressed: sum,child: Text('+', style: TextStyle(color: Colors.white)),color: Colors.lightBlue,),
                RaisedButton(onPressed: minus,child: Text('-', style:TextStyle(color: Colors.white)),color: Colors.red,),
              ],
            ),
            new Wrap(
              spacing: 8.0, // gap between adjacent chips
              children: <Widget>[
                RaisedButton(onPressed: times,child: Text('*', style: TextStyle(color: Colors.white),),color: Colors.lightGreenAccent,),
                RaisedButton(onPressed: divide,child: Text('/', style: TextStyle(color: Colors.white),),color: Colors.amber,),
              ],
            )
          ],
        )
      ],)),
    );
  }



}