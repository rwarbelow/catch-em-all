class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_backpack

  def set_backpack
    @backpack = Backpack.new(session[:backpack])
  end
end
