class TakeableStationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(takeable_station)
    ActionCable.server.broadcast 'battle_channel', takeableStationCode: takeable_station.code, color: takeable_station.color
  end
end
