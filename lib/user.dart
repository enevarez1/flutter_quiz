import 'dart:convert';
import 'package:flutter_quiz/quiz.dart';

class User {
  String userName;
  String passWord;
  String quizNumber;

  User(String userName, String passWord)
  {
    this.userName = userName;
    this.passWord = passWord;
    this.quizNumber = quizNumber;
  }

  /// Validates User Credentials with CS server, returns boolean
  Future<bool> validateCredentials() async{
    var check = await Quiz(new User(userName, passWord)).pingQuiz();
    check = json.decode(check);
    
    switch (check['response']){
      case true:
        print("Response was true");
        return true;
        break;
      case false:
        print("Respone was false");
        return false;
        break;
      default:
        return false;
        break;
    }
  }

}