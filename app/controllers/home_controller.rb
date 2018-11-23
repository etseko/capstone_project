class HomeController < ApplicationController
  def index
    @day = Date.today.to_s
  end

  end
