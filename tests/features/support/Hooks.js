(function() {
  module.exports = function() {
    this.Before = function(callback) {
      this.spooky.start();
      return callback();
    };
    return this.After = function(callback) {
      this.spooky.destroy();
      return callback();
    };
  };

}).call(this);
