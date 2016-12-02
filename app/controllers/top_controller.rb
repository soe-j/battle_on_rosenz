class TopController < ApplicationController

  def index
    gon.rosenz_key = Rails.configuration.rosenz_key
  end

end
