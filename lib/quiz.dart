import 'dart:convert';

import 'package:flutter_quiz/question.dart';
import 'package:flutter_quiz/user.dart';
import 'package:http/http.dart' as http;

class Quiz {

  final User user;

  Quiz(this.user);


  ///Grabs Quiz
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

  ///Parses through the Response.body and stores into custom Question Class
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
    return questionList;
  }

  double calculateGrade (List<Question> userAnswersList) {
    print("CalculateGrade Called");
    int counter = 0;
    for (int i = 0; i < userAnswersList.length; i++) {
      if (userAnswersList[i].answerCorrect == true)
        counter++;
    }
    print("Counter is: $counter");
    var grade = counter/userAnswersList.length;
    grade = grade * 100;
    print("Grade is $grade");
    return grade;
  }



}