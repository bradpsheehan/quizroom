$(document).ready( function(){
  $('.ghost-answer').on('click', function(){
    addNewAnswer($(this).closest('li'));
  });
  $('form').on('click', '.remove-link', function() {
    removeAnswer($(this).closest('li'));
    return false;
  });
});

var addNewAnswer = function(sibling){
  console.log('add another answer');

  var thingToAppend = "<li> \
                    <div class=\"field\"> \
                      <div class=\"row\"> \
                        <div class=\"large-1 columns answer-radio\"> \
                          <input id=\"option1_\" name=\"option1\" type=\"radio\" value=\"\"> \
                        </div> \
                        <div class=\"large-10 columns\"> \
                          <textarea id=\"answer\" name=\"answer\"></textarea> \
                        </div> \
                        <div class=\"large-1 columns\"> \
                          <a href=\"#\" class=\"remove-link\">X</a> \
                        </div> \
                      </div> \
                    </div> \
                  </li>";

  sibling.before(thingToAppend);
};

var removeAnswer = function(thingToRemove){
  console.log('remove this answer')
  thingToRemove.remove();
};
