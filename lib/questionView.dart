

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/question.dart';
import 'package:flutter_quiz/user.dart';

class QuestionView extends StatefulWidget {

  final List<Question> questionList;
  final int counter;
  final User user;

  QuestionView(this.questionList, this.counter, this.user);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return QuestionViewState();
  }
}

class QuestionViewState extends State<QuestionView> {


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.quizNumber),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.red[300],
            height: 200,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.questionList[widget.counter].title,
                  style: TextStyle(height: 1, fontSize: 20),
                ),
              )           
            ),  
          )
        ],
      ),
    );
  }
  
}