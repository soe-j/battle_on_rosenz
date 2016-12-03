class PlayerBroadcastJob < ApplicationJob
  queue_as :default

  def perform(player)
    ActionCable.server.broadcast 'battle_channel', userName: player.name, userColor: player.color
  end
end
