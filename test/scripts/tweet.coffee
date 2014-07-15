require '../helper'

describe 'tweet', ->
  beforeEach (done) ->
    @bouzuya = id: 'bouzuya', room: 'hitoridokusho'
    @kakashi.scripts = [require '../../src/scripts/tweet']
    @kakashi.users = [@bouzuya]
    @kakashi.start().then done, done

  afterEach (done) ->
    @kakashi.stop().then done, done

  describe 'receive "@hubot tweet test"', ->
    beforeEach ->
      Twitter = require 'twitter'
      @sinon.stub Twitter.prototype, 'updateStatus', (message, callback) ->
        callback
          id_str: '1234567890'
          user:
            screen_name: 'hitoridokusho'

    it 'send "https://twitter.com/..."', (done) ->
      message = '@hubot tweet test'
      @kakashi
        .receive @bouzuya, message
        .then =>
          expect(@kakashi.send.callCount).to.equal(1)
          expect(@kakashi.send.firstCall.args[1]).to
            .equal('https://twitter.com/hitoridokusho/status/1234567890')
        .then (-> done()), done

  describe 'receive "@hubot tweet test"', ->
    beforeEach ->
      Twitter = require 'twitter'
      @sinon.stub Twitter.prototype, 'updateStatus', (message, callback) ->
        callback new Error()

    it 'send "tweet error"', (done) ->
      message = '@hubot tweet test'
      @kakashi
        .receive @bouzuya, message
        .then =>
          expect(@kakashi.send.callCount).to.equal(1)
          expect(@kakashi.send.firstCall.args[1]).to.equal('tweet error')
        .then (-> done()), done
