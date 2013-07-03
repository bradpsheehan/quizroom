$.put = function(url, data, successCallback){
  $.ajax({
    type: "PUT",
    url: url,
    data: data,
    success: successCallback || function(){}
  });
};

$.delete = function(url, data, successCallback){
  $.ajax({
    type: "DELETE",
    url: url,
    data: data,
    success: successCallback || function(){}
  });
};

function getQuestionId(container) {
  return $(container).data('question-id');
}

var questionUpdateHandler = function(event){
  //console.log(event);
  var correct_answer_id = $(event.target)
    .parent()
    .parent()
    .find('textarea')
    .attr('id');
  var question_id = getQuestionId($(this).parents('.quiz-question'));
  var quiz_id = $('#question_quiz_id').val();

  var data = {question: {correct_answer_id: correct_answer_id}};
  var url= '/quizzes/'+quiz_id+'/questions/'+question_id;
  var callback = function(){console.log('success! maybe..')};
  $.put(url, data, callback);
};

var answerCreateHandler = function() {
  var $this = $(this);
  var quiz_id = $('#question_quiz_id').val();
  var question_id = getQuestionId($(this).parents('.quiz-question'));
  var text = $this.val();
  var data = {answer: text};
  var answer_id = $this.attr('id');
  console.log("saving answer '" + text + "', id: " + answer_id);

  if(answer_id){
    var url = '/quizzes/'+quiz_id+'/questions/'+question_id+'/answers/'+answer_id;
    //console.log("----");
    //console.log("putting to " + url);
    $.put(url, data);
  } else {
    var url = '/quizzes/'+quiz_id+'/questions/'+question_id+'/answers';
    //console.log("====");
    //console.log("posting to " + url);
    $.post(url, data, function(data) {
      $this.attr('id', data.id);
    });
  }
  return false;
};

$(document).ready( function(){
  var answer_num = 1;
  $(document).on('click', '.ghost-answer',function(){
    addNewAnswer($(this).closest('li'), answer_num);
    answer_num++;
    return false;
  });

  $('#option1').on('click', function(){
    markChecked($(this).val());
  });

  $(document).on('click', '.remove-link', removeAnswer);

  $(document).on('click', 'input[type="radio"]', questionUpdateHandler);

  $(document).on('focusout', '.quiz-question .question', function(){
    var $this = $(this);
    var $container = $this.parents('.quiz-question');

    var quiz_id = $('#question_quiz_id').val();
    var question = $(this).val();
    var data = {quiz_id: quiz_id, question: {question: question}}
    var question_id = $container.data('question-id');

    if(question_id){
      var url = '/quizzes/'+quiz_id+'/questions/'+question_id;
      $.put(url, data, function(data) {
        console.log("updated question")
      });
    } else {
      $.post('/quizzes/'+quiz_id+'/questions', data, function(data) {
        $container.data('question-id', data.id);
      });
    }
  });



  $(document).on('focusout', 'textarea.answer', answerCreateHandler);
});


var addNewAnswer = function(parent, i){
  var thingToAppend = "<li> \
                        <div class=\"field\"> \
                          <div class=\"row\"> \
                            <div class=\"large-1 columns answer-radio\"> \
                              <input class=\"option1\" name=\"option1\" type=\"radio\" value=\"\"> \
                            </div> \
                            <div class=\"large-10 columns\"> \
                              <textarea name=\"answers[answer" + i + "]\" class=\"answer\"></textarea> \
                            </div> \
                            <div class=\"large-1 columns\"> \
                              <div class=\"remove-field-x\"> \
                                <a href=\"#\" class=\"remove-link\">X</a> \
                              </div> \
                            </div> \
                          </div> \
                        </div> \
                      </li>";
  parent.children(':last').before(thingToAppend);
};

var addQuestion = function(){
  var questionTemplate = $('.template').text();
  var data = {quiz_id: 1}
  var html = templateBuilder(questionTemplate, data);
  $('.quiz-question').last().after(html);
}

$('#add-question-link').on('click', addQuestion);


var removeAnswer = function(event){
  console.log('remove this answer');
  var liToRemove = $(this).closest('li');
  console.log(liToRemove);
  var id = liToRemove.find('textarea').attr('id');
  
  var quiz_id = $('#question_quiz_id').val();
  var question_id = getQuestionId($(this).parents('.quiz-question'));


  $.delete("/quizzes/"+quiz_id+"/questions/"+question_id+"/answers/"+id);
  
  liToRemove.remove();
  return false;
};
