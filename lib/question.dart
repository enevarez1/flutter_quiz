

class Question {

  dynamic title; //['stem']
  dynamic answer; //['answer']
  List<dynamic> answerList; //['option']

  
  ///ToString used for Debug
  String toString() => "Title is $title, Answer is $answer, and AnswerList is $answerList";


  ///Comparing Answers from Website, to user answers to calculate grade
  compareAnswers(List<String> userAnswers) {

  }
}