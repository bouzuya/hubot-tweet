# Description
#   tweet
#
# Dependencies:
#   "q": "^1.0.1",
#   "twitter": "^0.2.9"
#
# Configuration:
#   HUBOT_TWEET_API_KEY='...'
#   HUBOT_TWEET_API_SECRET='...'
#   HUBOT_TWEET_ACCESS_TOKEN='...'
#   HUBOT_TWEET_ACCESS_TOKEN_SECRET='...'
#
# Commands:
#   hubot tweet <message> - post a tweet
#
# Author:
#   bouzuya <m@bouzuya.net>
#
{Promise} = require 'q'
Twitter = require 'twitter'

module.exports = (robot) ->

  tweet = (message) ->
    new Promise (resolve, reject) ->
      new Twitter(
        consumer_key: process.env.HUBOT_TWEET_API_KEY
        consumer_secret: process.env.HUBOT_TWEET_API_SECRET
        access_token_key: process.env.HUBOT_TWEET_ACCESS_TOKEN
        access_token_secret: process.env.HUBOT_TWEET_ACCESS_TOKEN_SECRET
      ).updateStatus message, (data) ->
        if data instanceof Error
          reject(data)
        else
          name = data.user.screen_name
          id = data.id_str
          url = 'https://twitter.com/' + name + '/status/' + id
          resolve(url)

  robot.respond /tweet\s*(.+)$/i, (res) ->
    message = res.match[1]
    tweet message
      .then (url) ->
        res.send url
      , (e) ->
        robot.logger.error e
        res.send 'tweet error'
