bitcoin = require('bitcoinjs-lib')
wallet = require('./wallet.sample.json')
fs = require('fs')

lineReader = require('readline').createInterface(
  input: fs.createReadStream('keys.txt')
)

temp = wallet.keys[0]
wallet.keys = []

lineReader.on('line', (priv) ->
  key = Object.create(temp)
  p = bitcoin.ECPair.fromWIF(priv)
  key.addr = p.getAddress()
  key.priv = priv
  wallet.keys.push(key)
)

lineReader.on('close', ->
  fs.writeFile("wallet.aes.json", JSON.stringify(wallet), (err) ->
    return console.log(err) if err
  )
)

