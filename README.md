# hubot-tweet

A Hubot script for posting a tweet.

## Installation

    $ npm install git://github.com/bouzuya/hubot-tweet.git

or

    $ # TAG is the package version you need.
    $ npm install 'git://github.com/bouzuya/hubot-tweet.git#TAG'

## Configuration

    $ export HUBOT_TWEET_API_KEY='...'
    $ export HUBOT_TWEET_API_SECRET='...'
    $ export HUBOT_TWEET_ACCESS_TOKEN='...'
    $ export HUBOT_TWEET_ACCESS_TOKEN_SECRET='...'

## Commands

    bouzuya> hubot help tweet
    hubot> hubot tweet <message> - post a tweet

    bouzuya> hubot tweet 世界経済は XYZ !
    hubot> https://twitter.com/hitoridokusho/status/0000000000000000

## License

MIT

## Badges

[![Build Status][travis-status]][travis]

[travis]: https://travis-ci.org/bouzuya/hubot-tweet
[travis-status]: https://travis-ci.org/bouzuya/hubot-tweet.svg?branch=master
