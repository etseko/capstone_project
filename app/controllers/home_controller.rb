class HomeController < ApplicationController
  def index
    @day = Time.now.strftime("%B %e, %Y")
    #@day = Date.today.to_s
  end

  end
