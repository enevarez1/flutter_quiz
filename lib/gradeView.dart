

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/menu.dart';
import 'package:flutter_quiz/user.dart';

class GradeView extends StatefulWidget {
  final double grade;
  final User user;

  GradeView(this.grade, this.user);

  @override
  State<StatefulWidget> createState() {
  
    return GradeState();
  }
}

class GradeState extends State<GradeView> {
  
  @override
  Widget build(BuildContext context) {
    var _grade = widget.grade;
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Grade"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.green[300],
            height: 200,
            child: Image(
              image: AssetImage("assets/grade.png"),
            ),

          ),
          Center(
            child: Text(
              "Your grade is $_grade/100",
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                height: 10,
              ),
            ) ,
          ),
          Row(
            children: <Widget>[
              Container(width: 75,),
              RaisedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                              builder: (context) => Menu(widget.user)));
                },
                child: const Text(
                  "Menu"

                )
              ),
              Container(width: 30,),
              RaisedButton(
                onPressed: null,
                child: const Text(
                  "Review"

                )
              ),
            ],
          ),
        ],
        
      ),

    );
  }




  
}