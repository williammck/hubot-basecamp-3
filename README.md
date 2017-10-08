# hubot-basecamp-3

This is a [Hubot](http://hubot.github.com/) adapter to use with [Basecamp 3](https://3.basecamp.com).

[![npm](https://img.shields.io/npm/v/hubot-basecamp-3.svg)](https://www.npmjs.com/package/hubot-basecamp-3)

## Installation

1. You'll first need a Hubot instance set up. Follow the instructions at https://hubot.github.com/docs/.  
When it asks for the `Bot adapter`, specify `basecamp-3`.

2. Open a Basecamp and click on `Settings` in the top right corner.

3. Choose the `Configure Chatbots` option.

4. Add a new chatbot and point the `Command URL` to your Hubot host, with a path of `/hubot/bc3`.  
e.g. if your Hubot instance lives at `internal.domain`, set the URL to `http://internal.domain/hubot/bc3`.

5. Launch Hubot like so: `./bin/hubot --adapter basecamp-3`.
