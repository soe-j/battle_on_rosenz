class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with name: ENV["BATTLE_ROSENZ_USER"], password: ENV["BATTLE_ROSENZ_PASS"]
end
