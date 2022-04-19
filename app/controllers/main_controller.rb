# frozen_string_literal: true

class MainController < ApplicationController
  def index
    @message = 'ecommerce-api'
    render :index, status: :ok
  end
end
