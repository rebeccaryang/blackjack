assert = chai.assert
expect = chai.expect

describe 'wallet', ->
  describe 'initialization', ->
    wallet = new Wallet()
    it 'should have money property', ->
      assert.notEqual wallet.get 'money', undefined
      return
    it 'should have bet property', ->
      assert.notEqual wallet.get 'bet', undefined
      return
    it 'should have eweWon method', ->
      assert.notEqual wallet.eweWon, undefined
      assert.equal typeof wallet.eweWon, 'function'
      return
    it 'should have dealerWon method', ->
      assert.notEqual wallet.dealerWon, undefined
      assert.equal typeof wallet.dealerWon, 'function'
      return
    return
  describe 'eweWon()', ->
    wallet = new Wallet()
    it 'should add the bet to money', ->
      wallet.set "bet", 20
      wallet.eweWon()
      assert.equal wallet.get("money"), 783
    return
  describe 'dealerWon()', ->
    wallet = new Wallet()
    it 'should remove the bet from money', ->
      wallet.set "bet", 20
      wallet.dealerWon()
      assert.equal wallet.get("money"), 743
  return

return