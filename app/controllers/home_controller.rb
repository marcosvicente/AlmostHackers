class HomeController < ApplicationController
  def index
    exame = ExameService(user: current_user)
  end
end
