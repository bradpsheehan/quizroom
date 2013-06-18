$(document).ready( function() {
  var faye = new Faye.Client('http://localhost:9292/faye');

  faye.subscribe("/messages/new", function(data) {
    console.log(data);
    $("#chat").append("<li>Question: "+data.message+"</li>");
  });

  $("#chat-submit").on("click", function() {
    faye.publish("/messages/new", {
      message: $("#message").val()
    });
    $("form")[0].reset();
  });
});

