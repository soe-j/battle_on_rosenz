class TopController < ApplicationController

  def index
    gon.rosenz_key = Rails.configuration.rosenz_key
    @default_color = %w(black red blue green purple orange).sample
    gon.territories = Territory.all_status
    gon.takeables = TakeableStation.all_status
  end

end
