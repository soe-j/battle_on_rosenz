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

    # 10分圏内の駅を獲得可能駅とする
    res = Faraday.get "#{Rails.configuration.ekispert_url}/search/range", {
      key: Rails.configuration.ekispert_key,
      code: data['stationCode'],
      upperLimit: 10
    }
    near_station_data = JSON.parse(res.body)["ResultSet"]
    points = near_station_data["Point"].class == Array ? near_station_data["Point"] : [data["Point"]]
    points.map do |point|
      TakeableStation.create! code: point['Station']['code'], color: data['color']
    end
  end
end
