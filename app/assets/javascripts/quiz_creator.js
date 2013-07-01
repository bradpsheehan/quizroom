// use this method after the question has been created
var succesfulQuestionCreateHandler = function(data){
  console.log(data);
  $('#question_question_id').val(data.id);
};

// var successfulAnswerCreateHandler = function(data){
// };

//use this method to update the question
var questionUpdateHandler = function(event){
  console.log(event);
  // debugger;
  var correct_answer_id = $(event.target)
                                  .parent()
                                  .parent()
                                  .find('textarea')
                                  .attr('id');
  var question_id = $('#question_question_id').val();
  var quiz_id = $('#question_quiz_id').val();

  var data = {question: {correct_answer_id: correct_answer_id}};
  // $.post('/quizzes/'+quiz_id+'/questions/'+question_id, data, function(){
  //   console.log("updated!")
  // });
  $.ajax({
    type: "PUT",
    url: '/quizzes/'+quiz_id+'/questions/'+question_id,
    data: data,
    success: function(){
    console.log("updated!")}
  });
};

var answerCreateHandler = function(){
  var quiz_id = $('#question_quiz_id').val();
  var question_id = $('#question_question_id').val();
  var text_area = $(this).find('textarea');
  var text = $(this).find('textarea').val();
  var data = {answer: text}
  console.log(data);
  $.post('/quizzes/'+quiz_id+'/questions/'+question_id+'/answers', data, function(data){
    text_area.attr('id', data.id);
  });
  return false;
};

$(document).ready( function(){
  var answer_num = 1;
  // addNewAnswer($('.answer-list'), answer_num);
  answer_num++;

  $('.ghost-answer').on('click', function(){
    addNewAnswer($(this).closest('li'), answer_num);
    answer_num++;
    return false;
  });

  $('#option1').on('click', function(){
    markChecked($(this).val());
  });

  $('form').on('click', '.remove-link', function() {
    removeAnswer($(this).closest('li'));
    return false;
  });

  $('ul.answer-list').on('click', 'input[type="radio"]', questionUpdateHandler);

  $('#question_question').on('focusout', function(){
    var quiz_id = $('#question_quiz_id').val();
    var question = $('#question_question').val();
    var data = {quiz_id: quiz_id, question: {question: question}}
    $.post('/quizzes/'+quiz_id+'/questions', data, succesfulQuestionCreateHandler);
  });

  $('#question_question').on('focusout', function(){
    $('section.answers').show();
  });


  $('ul.answer-list').on('focusout', 'li', answerCreateHandler);
});


var addNewAnswer = function(parent, i){
  // console.log('add another answer');

  var thingToAppend = "<li> \
                        <div class=\"field\"> \
                          <div class=\"row\"> \
                            <div class=\"large-1 columns answer-radio\"> \
                              <input id=\"option1\" name=\"option1\" type=\"radio\" value=\"\"> \
                            </div> \
                            <div class=\"large-10 columns\"> \
                              <textarea name=\"answers[answer" + i + "]\"></textarea> \
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

var removeAnswer = function(thingToRemove){
  // console.log('remove this answer')
  thingToRemove.remove();
};
