var templateBuilder = function(html, data) {
  var template = Handlebars.compile(html);
  return template(data);

};
