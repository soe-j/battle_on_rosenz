# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class BattleChannel < ApplicationCable::Channel
  def subscribed
    stream_from "battle_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def take(data)
    Territory.create! station_code: data['stationCode'], color: data['color']
  end
end
