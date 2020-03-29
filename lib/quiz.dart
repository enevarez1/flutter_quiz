import 'dart:convert';

import 'package:flutter_quiz/question.dart';
import 'package:flutter_quiz/user.dart';
import 'package:http/http.dart' as http;

class Quiz {

  final User user;

  Quiz(this.user);



  Future<dynamic> pingQuiz() async {
    var username = user.userName;
    var password = user.passWord;
    var quiz;
    if (user.quizNumber != null && user.quizNumber != 'quiz00') {
      quiz = user.quizNumber; }
    else {
      quiz = "quiz00";
      //print(quiz);
    }

    var url = 'http://www.cs.utep.edu/cheon/cs4381/homework/quiz/post.php';
    var body = '{"user": "$username", "pin": "$password", "quiz": "$quiz" }';
    var response = await http.post(url, body: body);
    //print(response.body);
    return response.body;
  }

  Future<List<Question>> parseQuestions() async {
    //print("I am in parse questions" + user.quizNumber);
    var jsonMsg = await pingQuiz();

    //var decode = await jsonMessage;
    var questionList = new List<Question>();
    var quiz = json.decode(jsonMsg);
    var fixedQuiz = quiz['quiz']['question'] as List;

    fixedQuiz.forEach((element) {
      var question = new Question();
      question.title = element['stem'];
      question.answer = element['answer'];
      question.answerList = element['option'];
      
      if (element['option'] != null) {
        question.answerList = element['option']; }
      else {
        question.answerList = [0];}
      questionList.add(question);
    });


    /*for (int i = 0; i < questionList.length; i++) {
      String info = questionList[i].toString();
      print(info);
    }*/
    return questionList;
  }



}