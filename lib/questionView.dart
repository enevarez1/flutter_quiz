

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
    final _answerList = widget.questionList[widget.counter].answerList;
    bool _currentAnswerValue = false;

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
            height: 150,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.questionList[widget.counter].title,
                  style: TextStyle(height: 1, fontSize: 20),
                ),
              )           
            ),  
          ),
          Container(
            color: Colors.green,
            height: 300,
            child: ListView(
                padding: EdgeInsets.all(8.0),
                children: _answerList.map((answer) => RadioListTile(
                    groupValue: _currentAnswerValue,
                    title: Text("$answer"),
                    value: true,
                    onChanged: (bool newValue) {
                        setState(() {

                          _currentAnswerValue = newValue;
                            
                        });
                    },
                )).toList(),
            ),
          ),
          Container(
            color: Colors.indigo,
            height: 62,
          )
        ],
      ),
    );
  }
}
  