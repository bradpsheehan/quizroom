var Quiz = function Quiz(data){
  var that = this;

  this.questions = [];

  function initialize(data){
    that.id = data.id;
    that.teacher_id = data.teacher_id;
    that.name = data.name;
  }

  if(!data.id) {
    $.post('/quizzes', data, initialize);
  } else {
    initialize(data);
  }

};

Quiz.prototype.addQuestion = function addQuestion(text){
  this.questions.push(new Question(text));
}
