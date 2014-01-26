(function() {
  module.exports.World = function(callback) {
    this.BASE_URI = "http://localhost:4400/";
    return this.spooky = new Spooky({
      casper: {
        verbose: true,
        logLevel: 'debug'
      },
      child: {
        transport: 'http'
      }
    }, function(err) {
      var e;
      if (err) {
        e = new Error('Failed to initialize SpookyJS');
        e.details = err;
        throw e;
      }
    });
  };

}).call(this);
