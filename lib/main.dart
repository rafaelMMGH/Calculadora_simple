import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() => runApp(MycalculatorApp());

class MycalculatorApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(
        fontFamily: 'Questrial',
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

  String textToShow = "";
  String result = "";
  double newResult;
  
  _showAbout(){
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(9.0)
              ),
              title: new Text('About',textAlign: TextAlign.center,),
              content: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Text(' App created with ❤ and flutter.', textAlign: TextAlign.justify,),
                  new Divider(),
                  new ListTile(
                    contentPadding: new EdgeInsets.all(0.0),
                    leading: new Icon(Icons.account_circle,color: Colors.blueAccent,),
                    title: new Text('Rafael Alberto Martínez Méndez'),
                    onTap: () { _goGithub();},
                  ),
                ],
              )
          );
        });
  }

  _goGithub(){

  }

  _copyResult(BuildContext context, String password){

    if(result.isNotEmpty){

      Clipboard.setData(new ClipboardData(text: password));

      Fluttertoast.showToast(
          msg: "Copied to Clipboard",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIos: 2
      );

    }

  }

  _signs(String sign){

  //  if(textToShow.isEmpty || textToShow.contains("." ) || textToShow.contains("(" ) || textToShow.contains(")" )) return false;
    textToShow += sign;

  }

  _numbers(String number){

    List<String> signs = ["/","*","+","-"];
    
    if(number == "backspace"){
      int length = textToShow.length;
      textToShow = textToShow.substring(0,length-1);
    }else {
      textToShow += number;
    }

    debugPrint(textToShow);
    for(int i=0; i< signs.length;i++){

      String sign = signs[i].toString();

      if(textToShow.contains(sign)){

        List<String> newText = textToShow.split(sign);
        newText[1]=(textToShow.split(sign)[1]);

        switch(sign){
          case "/":
            newResult = double.parse(newText[0]) / double.parse(newText[1]);
            break;
          case "*":
            newResult = double.parse(newText[0]) * double.parse(newText[1]);
            break;
          case "+":
            newResult = double.parse(newText[0]) + double.parse(newText[1]);
            break;
          case"-":
            newResult = double.parse(newText[0]) - double.parse(newText[1]);
            break;
        }

        result = newResult.toString();

      }
    }


  }

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width - 36;
    final double height = MediaQuery.of(context).size.height - 210;

    //create layout
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        leading: null,
        title: new GestureDetector(
          child: Text("Calculator",style: TextStyle(color: Colors.black),),
          onDoubleTap: (){_showAbout();},
        ),
      ),
      body: new Container(
        child: new Padding(
          padding: new EdgeInsets.only(top: 20,right: 18,left: 18),
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text(textToShow,style: TextStyle(fontSize: 23,color: Colors.grey,),)
                ],
              ),
              new Padding(padding: new EdgeInsets.only(top: 7)),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new  GestureDetector(
                    onLongPress: (){ _copyResult(context,result);},
                    child: new Text(result,style: TextStyle(fontSize: 55,color: Colors.black),)
                  ),
                ],
              ),
              new Padding(padding: new EdgeInsets.only(bottom: 20)),



              new Row(
                children: <Widget>[

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){ setState(() {textToShow = ""; result = "";});},child: new Center(child: Text("C",style: TextStyle(fontSize: 30,color: Colors.grey),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){ setState(() {textToShow += "(";});},child: new Center(child: Text("(",style: TextStyle(fontSize: 30,color: Colors.grey),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){ setState(() {textToShow += ")";});},child: new Center(child: Text(")",style: TextStyle(fontSize: 30,color: Colors.grey),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){ _numbers("backspace");},child: new Center(child: Icon(Icons.keyboard_backspace,color: Colors.grey,size: 30,)),),

                  ),



                ],
              ),

              new Row(
                children: <Widget>[

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){ setState(() {_numbers("7");}); },child: new Center(child: Text("7",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_numbers("8");});},child: new Center(child: Text("8",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_numbers("9");});},child: new Center(child: Text("9",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_signs("/");});},child: new Center(child: new Text("÷",style: TextStyle(fontSize: 30,color: Color.fromRGBO(183,102,255,1)),)),),

                  ),



                ],
              ),

              new Row(
                children: <Widget>[

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_numbers("4");});},child: new Center(child: Text("4",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_numbers("5");});},child: new Center(child: Text("5",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_numbers("6");});},child: new Center(child: Text("6",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_signs("*");});},child: new Center(child: new Text("x",style: TextStyle(fontSize: 30, color: Color.fromRGBO(254, 153, 0, 1)),)),),

                  ),



                ],
              ),

              new Row(
                children: <Widget>[

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_numbers("1");});},child: new Center(child: Text("1",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_numbers("2");});},child: new Center(child: Text("2",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_numbers("3");});},child: new Center(child: Text("3",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_signs("-");});},child: new Center(child: new Text("-",style: TextStyle(fontSize: 30,color: Color.fromRGBO(255, 92, 93, 1)),)),),

                  ),



                ],
              ),

              new Row(
                children: <Widget>[

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {textToShow += ".";});},child: new Center(child: Text(".",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_numbers("0");});},child: new Center(child: Text("0",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {textToShow = result; result ="";});},child: new Center(child: Text("=",style: TextStyle(fontSize: 30),),)),

                  ),

                  new ButtonTheme(
                    minWidth: width/4,
                    height: height/5,
                    shape: new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(17.0)),
                    child: new FlatButton(onPressed: (){setState(() {_signs("+");});},child: new Center(child: new Text("+", style: TextStyle(fontSize: 30,color: Color.fromRGBO(20, 198, 148, 1)),) ),),

                  ),



                ],
              )


            ],
          ),),

      ),
    );
  }

}