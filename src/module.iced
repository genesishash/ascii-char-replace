# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2
_ = require('wegweg')({
  globals: yes
})

map = JSON.parse(_.reads __dirname + '/../data/unicode-map.json')

module.exports = transform = ((string,level=50) ->
  chars = string.split('')
  chars = _.map chars, (item) ->
    if map[item]
      if _.rand(1,100) <= level
        return _.first(_.shuffle(map[item]))
    return item
  return chars.join('')
)

##
if !module.parent
  log transform('This is the Zodiac speaking..')
  process.exit 0

