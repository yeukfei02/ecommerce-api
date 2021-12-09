class OrdersController < ApplicationController
  def create
    params.require(%i[order_detail shop_id user_id])

    order_detail = params['order_detail']
    shop_id = params['shop_id']
    user_id = params['user_id']

    order = Order.create(order_detail: order_detail, shop_id: shop_id, user_id: user_id)

    if order.present?
      @message = 'createOrders'
      render :create, status: :ok
    else
      @message = 'createOrders error'
      render :create, status: :bad_request
    end
  end

  def index
    @orders = Order.all

    @message = 'getOrders'
    render :index, status: :ok
  end

  def show
    @order = Order.find(params[:id])

    @message = 'getOrderById'
    render :show, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getOrderById error, no this id'
    render :show, status: :bad_request
  end
end
