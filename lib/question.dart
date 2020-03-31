

class Question {

  dynamic title; //['stem']
  dynamic answer; //['answer']
  List<dynamic> answerList; //['option']
  bool answerCorrect = false;

  
  ///ToString used for Debug
  String toString() => "Title is $title, Answer is $answer, and AnswerList is $answerList";


  ///Comparing Answers from Website, to user answers to calculate grade
  compareAnswersText(String userAnswer) {
    userAnswer = "[$userAnswer]";
    if(userAnswer == answer.toString())
      this.answerCorrect = true;
    else
      this.answerCorrect = false;

  }
  compareAnswersRadio(String userAnswer){
    if(this.answer.toString() == userAnswer)
      this.answerCorrect = true;
    else 
      this.answerCorrect = false;
  }
}