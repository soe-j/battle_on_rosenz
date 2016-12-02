# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class BattleChannel < ApplicationCable::Channel
  def subscribed
    stream_from "battle_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def take(data)
    ActionCable.server.broadcast 'battle_channel', stationCode: data['stationCode'], color: data['color']
  end
end
