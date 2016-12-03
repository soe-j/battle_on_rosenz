class Player < ApplicationRecord
  after_create_commit { PlayerBroadcastJob.perform_later self }

  def Player.all_status
    Player.select('name', 'color').map do |player|
      {name: player.name, color: player.color}
    end
  end
end
