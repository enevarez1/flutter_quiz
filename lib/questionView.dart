

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/question.dart';
import 'package:flutter_quiz/user.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

import 'menu.dart';

class QuestionView extends StatefulWidget {

  ///Data thats being passed when entering a quiz and when transversing Questions
  final List<Question> questionList;
  int counter;
  final User user;

  QuestionView(this.questionList, this.counter, this.user);

  ///Returns different States if Multiple Choice Question or if its Text Question
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
    var _answerList = widget.questionList[widget.counter].answerList.cast<String>();
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    var _userAnswers;
    String progress = ("Progress: " 
      +(widget.counter + 1).toString() 
      + "/" 
      + widget.questionList.length.toString());

    // TODO: implement build
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.user.quizNumber),
        centerTitle: false,
        actions: <Widget>[
          Center(
            child: Text(progress),
          ),
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                              builder: (context) => Menu(widget.user)));
            },
          )
        ],
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
            child: RadioButtonGroup(
              labels: _answerList,
              onChange: (label, value) {
                int fixedValue = value;
                fixedValue += 1;
                print(fixedValue.toString());
                //userAnswers[index] = fixedValue.toString();
              },
            )
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
              GestureDetector(
                child: Container(
                  width: 260,
                  height: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage("assets/submit.jpg"),
                      fit: BoxFit.cover 
                    ),
                    
                  ),
                
                ),onTap: () {

                },
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

///Text Questions
class QuestionViewOpenState extends State<QuestionView> {

  @override
  Widget build(BuildContext context) {
    //Scaffold Key to display SnackBar
    final _scaffoldKey = GlobalKey<ScaffoldState>();
    //Text Controller for Text Answer
    final _textController = TextEditingController();
    //Progress on AppBar
    String progress = ("Progress: " 
      +(widget.counter + 1).toString() 
      + "/" 
      + widget.questionList.length.toString());

    
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(widget.user.quizNumber),
        centerTitle: false,
        actions: <Widget>[
          Center(
            child: Text(progress),
          ),
          IconButton(
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pushReplacement(
                        context, 
                        MaterialPageRoute(
                              builder: (context) => Menu(widget.user)));
            },
          )
        ],
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
                controller: _textController,
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
              GestureDetector(
                child: Container(
                  width: 260,
                  height: 45,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:AssetImage("assets/submit.jpg"),
                      fit: BoxFit.cover 
                    ),
                    
                  ),
                
                ),onTap: () {

                },
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

            