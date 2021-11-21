class ShopsController < ApplicationController
  def create
    request_body = JSON.parse(request.raw_post)
    name = request_body['name']
    address = request_body['address']

    shop = Shop.create(name: name, address: address)

    if shop.present?
      @message = 'createShops'
      render :create, status: :ok
    else
      @message = 'createShops error'
      render :create, status: :bad_request
    end
  end

  def index
    @shops = Shop.all

    @message = 'getShops'
    render :index, status: :ok
  end

  def show
    @shop = Shop.find(params[:id])

    @message = 'getShopById'
    render :show, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getShopById error, no this id'
    render :show, status: :bad_request
  end

  def update
    shop = Shop.find(params[:id])

    if shop.present?
      request_body = JSON.parse(request.raw_post)
      name = request_body['name']
      address = request_body['address']
      shop.update(name: name, address: address)

      @message = 'updateShopById'
      render :update, status: :ok
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'updateShopById error, no this id'
    render :update, status: :bad_request
  end

  def destroy
    shop = Shop.find(params[:id])

    if shop.present?
      shop.destroy

      @message = 'deleteShopById'
      render :destroy, status: :ok
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'deleteShopById error, no this id'
    render :destroy, status: :bad_request
  end
end
