var Question = function Question(question, quiz_id){
  var data = {question: question};

  $.post("/quizzes/"+quiz_id+"/questions", data, function(){});
}

Question.prototype.addAnswer = function addAnswer(text){
  this.answers.push(new Answer(text));
}
