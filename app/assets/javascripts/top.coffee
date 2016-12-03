# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  # 路線図生成
  window.rosen = new Rosen 'map', {
    apiKey: gon.rosenz_key,
    zoomControl: false,
    urlHash: true
  }

  # Territory情報配置
  rosen.setZoom 17
  gon.territories.forEach (trtr) ->
    rosen.setStationMarker trtr.stationCode, {
      type: 'circle',
      radius: 10,
      color: trtr.color,
      opacity: 0.8
    }

  # 駅選択時
  rosen.on 'selectStation', (data) ->
    rosen.clearStationPopups()

    station = data.stations[0]

    # Territoryになってる駅は反応しない
    territory_stations = gon.territories.map (trtr) ->
      trtr.stationCode
    return if station.code in territory_stations

    # 取得可能な駅でなかったら反応しない
    my_takebles = gon.takeables.filter (tkbl) ->
      tkbl.color == $('#user-color')[0].value

    return unless my_takebles.length == 0 || station.code in (tkbl.code for tkbl in my_takebles)

    name = $('<p>', {
      class: 'popup-station-name'
    }).html(station.name)
    input = $('<input>', {
      class: 'writing-station-yomi'
    }).keypress (e) ->
      e.stopPropagation()
      if e.key == 'Enter'
        if e.target.value == station.yomi
          App.battle.take station.code, $('#user-color')[0].value
          rosen.clearStationPopups()
        else
          input.css('border-color': 'red')

    content = $('<div>', {
      class: 'station-popup-content'
    }).append(name).append(input)

    popup = Rosen.htmlPopup().setHTML(content[0])
    rosen.setStationPopup(station.code, popup).then (e) ->
      input.focus()
