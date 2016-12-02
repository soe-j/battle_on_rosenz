class TopController < ApplicationController

  def index
    gon.rosenz_key = Rails.configuration.rosenz_key
    @default_color = %w(black red blue green purple orange).sample
  end

end
