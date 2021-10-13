class MainController < ApplicationController
  def index
    @message = 'ecommerce-api'
    render :index, status: 200
  end
end
