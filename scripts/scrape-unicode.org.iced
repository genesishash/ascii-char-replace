# vim: set expandtab tabstop=2 shiftwidth=2 softtabstop=2
_ = require('wegweg')({
  globals: on
})

chars = "abcdefghijklmnopqrstuvwxyz"
chars += chars.toUpperCase()

map = {}

for item in chars.split('')
  await _.get "http://unicode.org/cldr/utility/confusables.jsp?a=#{item}&r=None", defer e,r
  if e then throw e

  list = r.body
    .split("<h3>Confusable Results</h3><div style='border: 1px solid blue'>")
    .pop()
    .split("</div>")
    .shift()
    .split('\n')

  if list?.length
    map[item] = list

_.writes(__dirname + '/../data/unicode-map.json',JSON.stringify(map,null,2))

log 'Finished'; exit 0

