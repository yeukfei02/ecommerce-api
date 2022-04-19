# frozen_string_literal: true

class BooksController < ApplicationController
  def create
    params.require(%i[name author price quantity shop_id user_id])

    name = params['name']
    author = params['author']
    price = params['price']
    quantity = params['quantity']
    shop_id = params['shop_id']
    user_id = params['user_id']

    book = Book.create(name: name, author: author, price: price, quantity: quantity, shop_id: shop_id, user_id: user_id)

    if book.present?
      @message = 'createBooks'
      render :create, status: :ok
    else
      @message = 'createBooks error'
      render :create, status: :bad_request
    end
  end

  def index
    @books = Book.all

    @message = 'getBooks'
    render :index, status: :ok
  end

  def show
    @book = Book.find(params[:id])

    @message = 'getBookById'
    render :show, status: :ok
  rescue StandardError => e
    Rails.logger.debug "error = #{e}"

    @message = 'getBookById error, no this id'
    render :show, status: :bad_request
  end

  def update
    params.require(%i[id name author price quantity shop_id user_id])

    book = Book.find(params[:id])

    if book.present?
      name = params['name']
      author = params['author']
      price = params['price']
      quantity = params['quantity']
      shop_id = params['shop_id']
      user_id = params['user_id']
      book.update(name: name, author: author, price: price, quantity: quantity, shop_id: shop_id, user_id: user_id)

      @message = 'updateBookById'
      render :update, status: :ok
    end
  rescue StandardError => e
    Rails.logger.debug "error = #{e}"

    @message = 'updateBookById error, no this id'
    render :update, status: :bad_request
  end

  def destroy
    book = Book.find(params[:id])

    if book.present?
      book.destroy

      @message = 'deleteBookById'
      render :destroy, status: :ok
    end
  rescue StandardError => e
    Rails.logger.debug "error = #{e}"

    @message = 'deleteBookById error, no this id'
    render :destroy, status: :bad_request
  end
end
