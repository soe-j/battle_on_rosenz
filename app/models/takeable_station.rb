class TakeableStation < ApplicationRecord
  after_create_commit { TakeableStationBroadcastJob.perform_later self }

  def TakeableStation.all_status
    TakeableStation.select('code', 'color').map do |tkst|
      {code: tkst.code, color: tkst.color}
    end
  end
end
