import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quiz/questionView.dart';
import 'package:flutter_quiz/quiz.dart';
import 'package:flutter_quiz/user.dart';

class Menu extends StatefulWidget {

  final User user;

  Menu(this.user);

  @override
  State<StatefulWidget> createState() {
    return MenuState();
  }
}

class MenuState extends State<Menu> {

  var quizList = ['Quiz One', 'Quiz Two', 'Quiz Three', 'Quiz Four' ];

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Choose a Quiz to Study"),
      centerTitle: true,
      elevation: 0,
     ),
    body: ListView.builder(
      itemCount: quizList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 1.0),
          child: Card(
            child: ListTile(
                onTap: () async {
                  var quizNum = index+1;
                  widget.user.quizNumber = "quiz0$quizNum";
                  var quiz = new Quiz(widget.user);
                  var quesList = await quiz.parseQuestions();

                  Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => QuestionView(quesList, 0, widget.user))
                  );

                },
                title: Text(quizList[index]),
              ),
            )
          );
        }
      ) ,
    );
  } 
}