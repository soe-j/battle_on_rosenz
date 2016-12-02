class TerritoryBroadcastJob < ApplicationJob
  queue_as :default

  def perform(territory)
    ActionCable.server.broadcast 'battle_channel', stationCode: territory.station_code, color: territory.color
  end
end
