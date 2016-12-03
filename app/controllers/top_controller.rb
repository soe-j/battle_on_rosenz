class TopController < ApplicationController

  def index
    gon.rosenz_key = Rails.configuration.rosenz_key
    gon.territories = Territory.all_status
    gon.takeables = TakeableStation.all_status
    gon.users = Player.all_status
  end

end
