var exec = cordova.require('cordova/exec');

var Echo = function(){

};

Echo.echo = function(str, callback) {
  exec(callback, function(err) {
      callback('Nothing to echo.');
  }, "Echo", "echo", [str]);
};

Echo.len = function(str, callback) {
  exec(function(v) { callback(v[0].len); }, function(err) {
      callback('Nothing to measure.');
  }, "Echo", "len", [str]);
};

module.exports = Echo;
