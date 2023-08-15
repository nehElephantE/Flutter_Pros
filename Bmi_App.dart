import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'BMI PAGE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var wtcontroller = TextEditingController();
  var ftcontroller = TextEditingController();
  var inchcontroller = TextEditingController();
  var result = "";
  var bgcolor = Colors.yellow.shade400;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.yellowAccent,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                Text("BMI",style: TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.w500
                ),),

                TextField(
                  controller: wtcontroller,
                  decoration: InputDecoration(
                    label: Text("Enter your weight in kgs"),
                    prefixIcon:Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height:3),

                TextField(
                  controller: ftcontroller,
                  decoration: InputDecoration(
                      label: Text("Enter your height in feet"),
                      prefixIcon:Icon(Icons.height)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height:3),

                TextField(
                  controller: inchcontroller,
                  decoration: InputDecoration(
                      label: Text("Enter your height in inch"),
                      prefixIcon:Icon(Icons.line_weight)
                  ),
                  keyboardType: TextInputType.number,
                ),

                SizedBox(height:13),

                ElevatedButton(onPressed: (){
                  var wt = wtcontroller.text.toString();
                  var inc = inchcontroller.text.toString();
                  var ft = ftcontroller.text.toString();

                  if(wt != "" && ft != "" && inc != ""){
                    var iwt = int.parse(wt);
                    var iFt = int.parse(ft);
                    var Iinch = int.parse(inc);

                    var tInch = (iFt*12)+Iinch;
                    var tcm = tInch*2.54;
                    var tm = tcm/100;
                    var bmi = iwt/pow(tm, tm);

                    var mssg = "";

                    if(bmi>25){
                      mssg = "You are OVERWEIGHT!!!";
                      bgcolor = Colors.red;
                    }else if(bmi<18){
                      mssg = "You are UNDERWEIGHT!!!";
                      bgcolor = Colors.orange.shade500;
                    }
                    else{
                      mssg = "You are Healthy";
                      bgcolor = Colors.green.shade300;
                    }

                    setState(() {
                      result = "$mssg \n Your BMI is ${bmi.toStringAsFixed(3)}";
                    });


                  }
                  else{
                    setState(() {
                      result = "Please fill all the details";
                    });
                  }

                },child:Text("CALCULATE")),

                Text(result,style: TextStyle(
                  fontStyle: FontStyle.italic
                ),)
              ]
            ),
          ),
        ),
      )
    );
  }
}

