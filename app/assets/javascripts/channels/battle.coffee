App.battle = App.cable.subscriptions.create "BattleChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    if data.stationCode && data.color
      rosen.setStationMarker data.stationCode, {
        type: 'circle',
        radius: 10,
        color: data.color,
        opacity: 0.8
      }

      gon.territories.push {
        stationCode: data.stationCode,
        color: data.color
      }

    if data.takeableStationCode && data.color
      gon.takeables.push {
        code: data.takeableStationCode,
        color: data.color
      }

    if data.userName && data.userColor
      gon.users.push {
        name: data.userName,
        color: data.userColor
      }
      $('#color-board').append($('<div>', {
        class: 'user-label'
      }).html("#{data.userName}: #{data.userColor}"))

    if data.start
      $('#start-button').hide()

  take: (stationCode, color)->
    @perform 'take', stationCode: stationCode, color: color

  join: (userName, userColor)->
    @perform 'join', userName: userName, userColor: userColor

  start: () ->
    @perform 'start'
