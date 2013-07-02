var success = function(data){
  // console.log(data)
  // $('.answers').show();
  $('#question_question_id').val(data.id);
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

  $('form').on('click', '.remove-link', function() {
    removeAnswer($(this).closest('li'));
    return false;
  });

  // $('.answers').hide();
  $('#question_question').on('focusout', function(){
    var quiz_id = $('#question_quiz_id').val();
    var question = $('#question_question').val();
    var data = {quiz_id: quiz_id, question: {question: question}}
    $.post('/quizzes/'+quiz_id+'/questions', data, success);
  });

  $('#question_question').on('focusout', function(){
    $('section.answers').show()
  });

  $('ul.answer-list').on('focusout', 'li', function(){
    alert('blah');
    var quiz_id = $('#question_quiz_id').val();
    var question_id = $('#question_question_id').val();
    var text = $(this).find('textarea').val();
    var correctAnswer = $(this).find('input:checked').size() != 0;
    var data = {answer: text, correctAnswer: correctAnswer}
    console.log(data);
    $.post('/quizzes/'+quiz_id+'/questions/'+question_id+'/answers', data)
    return false;
  });
});


var addNewAnswer = function(parent, i){
  console.log('add another answer');

  var thingToAppend = "<li> \
                        <div class=\"field\"> \
                          <div class=\"row\"> \
                            <div class=\"large-1 columns answer-radio\"> \
                              <input id=\"option1_\" name=\"option1\" type=\"radio\" value=\"\"> \
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
  console.log('remove this answer')
  thingToRemove.remove();
};
