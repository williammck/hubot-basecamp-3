try
  {Robot, Adapter, TextMessage, User} = require 'hubot'
catch
  prequire = require 'parent-require'
  {Robot, Adapter, TextMessage, User} = prequire 'hubot'

class Basecamp3 extends Adapter

constructor: (robot)->
    super
    @robot.logger.info "Constructor"

  send: (envelope, strings...) ->
    message = strings.join('\n').replace(/\n/g, '<br />')

    @robot.http(envelope.message.callback_url)
      .header('Content-Type', 'application/json')
      .post(JSON.stringify({content: message})) (err, res, body) ->
        if err
          console.log err

  reply: (user, strings...) ->
    @send user, str for str in strings

  run: ->
    @robot.router.post "/hubot/bc3", (request, response) =>
      user = new User request.body.creator.id,
        name: request.body.creator.name,
        room: request.body.creator.name
      text = @robot.name + ': ' + request.body.command
      message = new TextMessage user, text
      message.callback_url = request.body.callback_url

      @robot.receive(message)

      response.writeHead 200, 'Content-Type': 'text/plain'
      response.end()

    @emit "connected"

exports.use = (robot) ->
  new Basecamp3 robot
