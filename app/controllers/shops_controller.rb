class ShopsController < ApplicationController
    def create
        request_body = JSON.parse(request.raw_post)
        name = request_body['name']
        address = request_body['address']

        @shop = Shop.create(name: name, address: address)

        if @shop
            data = {
                message: 'createShops'
            }
            render :json => data, :status => 200
        else
            data = {
                message: 'createShops error'
            }
            render :json => data, :status => 400
        end
    end

    def index
        @shops = Shop.all

        data = {
            message: 'getShops',
            shops: @shops
        }
        render :json => data, :status => 200
    end

    def show
        begin
            @shop = Shop.find(params[:id])

            data = {
                message: 'getShopByid',
                shop: @shop
            }
            render :json => data, :status => 200
        rescue => exception
            puts "error = #{exception}"

            data = {
                message: 'getShopByid error, no this id',
            }
            render :json => data, :status => 400
        end
    end

    def update
        begin
            @shop = Shop.find(params[:id])

            if @shop
                request_body = JSON.parse(request.raw_post)
                name = request_body['name']
                address = request_body['address']
                @shop.update(name: name, address: address)

                data = {
                    message: 'updateShopByid'
                }
                render :json => data, :status => 200
            end
        rescue => exception
            puts "error = #{exception}"

            data = {
                message: 'updateShopByid error, no this id',
            }
            render :json => data, :status => 400
        end
    end

    def destroy
        begin
            @shop = Shop.find(params[:id])

            if @shop
                @shop.destroy

                data = {
                    message: 'deleteShopByid'
                }
                render :json => data, :status => 200
            end
        rescue => exception
            puts "error = #{exception}"

            data = {
                message: 'deleteShopByid error, no this id',
            }
            render :json => data, :status => 400
        end
    end
end
