class OrdersController < ApplicationController
    def create
        request_body = JSON.parse(request.raw_post)
        order_detail = request_body['order_detail']
        users_id = request_body['users_id']
        shops_id = request_body['shops_id']

        @order = Order.create(order_detail: order_detail, users_id: users_id, shops_id: shops_id)

        if @order
            @message = 'createOrders'
            render :create, status: 200
        else
            @message = 'createOrders error'
            render :create, status: 400
        end
    end

    def index
        @orders = Order.all

        @message = 'getOrders'
        render :index, status: 200
    end

    def show
        begin
            @order = Order.find(params[:id])

            @message = 'getOrderById'
            render :show, status: 200
        rescue => e
            puts "error = #{e}"

            @message = 'getOrderById error, no this id'
            render :show, status: 400
        end
    end
end
