(function() {
  var map, transform, _;

  _ = require('wegweg')({
    globals: true
  });

  map = JSON.parse(_.reads(__dirname + '/../data/unicode-map.json'));

  module.exports = transform = (function(string, level) {
    var chars;
    if (level == null) {
      level = 50;
    }
    chars = string.split('');
    chars = _.map(chars, function(item) {
      if (map[item]) {
        if (_.rand(1, 100) <= level) {
          return _.first(_.shuffle(map[item]));
        }
      }
      return item;
    });
    return chars.join('');
  });

  if (!module.parent) {
    log(transform('This is the Zodiac speaking..'));
    process.exit(0);
  }

}).call(this);
