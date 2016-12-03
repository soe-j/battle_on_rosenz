class Territory < ApplicationRecord
  after_create_commit { TerritoryBroadcastJob.perform_later self }

  def Territory.all_status
    Territory.select('station_code', 'color').map do |trtr|
      {stationCode: trtr.station_code, color: trtr.color}
    end
  end
end
