class OrdersController < ApplicationController
    def create
        request_body = JSON.parse(request.raw_post)
        order_detail = request_body['order_detail']
        users_id = request_body['users_id']
        shops_id = request_body['shops_id']

        @order = Order.create(order_detail: order_detail, users_id: users_id, shops_id: shops_id)

        if @order
            data = {
                message: 'createOrders'
            }
            render json: data, status: 200
        else
            data = {
                message: 'createOrders error'
            }
            render json: data, status: 400
        end
    end

    def index
        @orders = Order.all

        data = {
            message: 'getOrders',
            orders: @orders
        }
        render json: data, status: 200
    end

    def show
        begin
            @order = Order.find(params[:id])

            data = {
                message: 'getOrderByid',
                order: @order
            }
            render json: data, status: 200
        rescue => e
            puts "error = #{e}"

            data = {
                message: 'getOrderByid error, no this id',
            }
            render json: data, status: 400
        end
    end
end
