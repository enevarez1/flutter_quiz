

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/question.dart';
import 'package:flutter_quiz/user.dart';

class QuestionView extends StatefulWidget {

  final List<Question> questionList;
  int counter;
  final User user;

  QuestionView(this.questionList, this.counter, this.user);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState

    if(questionList[counter].answerList[0] == 0) {
      return QuestionViewOpenState();
    }
    else {
      return QuestionViewState();
    }
  }
}

//Multiple Choice Questions
class QuestionViewState extends State<QuestionView> {

  


  @override
  Widget build(BuildContext context) {
    final _answerList = widget.questionList[widget.counter].answerList;
    bool _currentAnswerValue = false;
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
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
                  style: TextStyle(height: 1, fontSize: 14),
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
          Row (children: <Widget>[
            IconButton(
                icon: Icon(Icons.navigate_before),
                tooltip: 'Move to next question', 
                onPressed: () {
                  if (widget.counter != 0) {
                  widget.counter = widget.counter-1;
                  print(widget.counter);

                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(
                    builder: (context) => QuestionView(widget.questionList, widget.counter, widget.user))
                  );
                  }
                  else {
                    final snackbar = SnackBar(content: Text("No Previous Question"));
                    _scaffoldKey.currentState.showSnackBar(snackbar);
                  }

                } 
              
              ),
              IconButton(
                icon: Icon(Icons.navigate_next),
                tooltip: 'Move to next question', 
                onPressed: () {
                  if (widget.counter != widget.questionList.length-1) {
                  print("Pressed Next");
                  widget.counter = widget.counter+1;
                  print(widget.counter);

                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(
                    builder: (context) => QuestionView(widget.questionList, widget.counter, widget.user))
                  );
                  }
                  else {
                    final snackbar = SnackBar(content: Text("No Next Question"));
                    _scaffoldKey.currentState.showSnackBar(snackbar);
                  }

                } 
              
              ),
          ],)
        ],
      ),
    );
  }
}


class QuestionViewOpenState extends State<QuestionView> {

  


  @override
  Widget build(BuildContext context) {
    final _answerList = widget.questionList[widget.counter].answerList;
    bool _currentAnswerValue = false;
    final _scaffoldKey = GlobalKey<ScaffoldState>();

    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.user.quizNumber),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Container(
            color: Colors.green[300],
            height: 150,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  widget.questionList[widget.counter].title,
                  style: TextStyle(height: 1, fontSize: 14),
                ),
              )           
            ),  
          ),
          Container(
            height: 300,
            child: Padding(
              padding: EdgeInsets.all(25.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText:'Enter your answer'
                ),
              ),
            ),
          ),
          Row (children: <Widget>[
            IconButton(
                icon: Icon(Icons.navigate_before),
                tooltip: 'Move to next question', 
                onPressed: () {
                  if (widget.counter != 0) {
                  widget.counter = widget.counter-1;
                  print(widget.counter);
                  Navigator.pushReplacement(context, 
                    MaterialPageRoute(
                    builder: (context) => QuestionView(widget.questionList, widget.counter, widget.user))
                    );
                  }
                  else {
                    final snackbar = SnackBar(content: Text("No Previous Question"));
                    _scaffoldKey.currentState.showSnackBar(snackbar);
                  }

                } 
              
              ),
              IconButton(
                icon: Icon(Icons.navigate_next),
                tooltip: 'Move to next question', 
                onPressed: () {
                  if (widget.counter != widget.questionList.length-1) {
                  print("Pressed Next");
                  widget.counter = widget.counter+1;
                  print(widget.counter);

                  Navigator.pushReplacement(context, 
                  MaterialPageRoute(
                    builder: (context) => QuestionView(widget.questionList, widget.counter, widget.user))
                  );
                  }
                  else {
                    final snackbar = SnackBar(content: Text("No Next Question"));
                    _scaffoldKey.currentState.showSnackBar(snackbar);
                  }

                } 
              
              ),
          ],)
        ],
      ),
    );
  }
}
  
  /*Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                icon: Icon(Icons.navigate_next),
                tooltip: 'Move to next question', 
                onPressed: () {
                  print("Pressed Next");
                  widget.counter = widget.counter+1;
                  print(widget.counter);

                  Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => QuestionView(widget.questionList, widget.counter, widget.user))
                  );

                } 
              
              ),
            ) */