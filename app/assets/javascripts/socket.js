var Socket = function(host) {
  var that = {};
  that.client = new Faye.Client(host);

  that.subscribe = function(channel, callback) {
    that.client.subscribe(channel, callback);
  }

  that.publish = function(channel, data) {
    that.client.publish(channel, data);
  }


  return that;
};
