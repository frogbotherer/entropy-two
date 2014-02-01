(function() {
  module.exports.World = function(callback) {
    this.BASE_URI = "http://localhost:4400/";
    this.spooky = new Spooky({
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
    return this.shipStore = Ext.create("Ext.data.Store", {
      storeId: "shipStore",
      model: "Ship"
    });
  };


  /*
   * take data from ajax store instead
          data: [
              name: "Shuttle"
              grid: new Grid(new Coord(5, 5), [
                  0, 0, 1, 1, 0, 0
                  0, 1, 1, 1, 1, 0
                  0, 1, 1, 1, 1, 0
                  1, 1, 1, 1, 1, 1
                  1, 1, 1, 1, 1, 1
                  1, 1, 1, 1, 1, 1
                  ])
          ,
              name: "Pod"
              grid: new Grid(new Coord(0, 0), [1])
          ]
   */

}).call(this);
