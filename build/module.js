(function() {
  var lib, log, _,
    __slice = [].slice;

  log = function() {
    var x;
    x = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
    try {
      return console.log.apply(console, x);
    } catch (_error) {}
  };

  _ = require('wegweg')({
    globals: false,
    shelljs: false
  });

  module.exports = lib = {};

  if (!module.parent) {
    log(/DEVEL/);
    process.exit(0);
  }

}).call(this);