App.battle = App.cable.subscriptions.create "BattleChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel

    rosen.setStationMarker data.stationCode, {
      type: 'circle',
      radius: 10,
      color: data.color,
      opacity: 0.8
    }

  take: (stationCode, color)->
    @perform 'take', stationCode: stationCode, color: color
