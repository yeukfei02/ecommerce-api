class MainController < ApplicationController
    def index
        data = {
            message: 'ecommerce-api'
        }
        render json: data, status: 200
    end
end
