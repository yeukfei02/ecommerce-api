class BooksController < ApplicationController
  def create
    request_body = JSON.parse(request.raw_post)
    name = request_body['name']
    author = request_body['author']
    price = request_body['price']
    quantity = request_body['quantity']
    shops_id = request_body['shops_id']

    book = Book.create(name: name, author: author, price: price, quantity: quantity, shops_id: shops_id)

    if book.present?
      @message = 'createBooks'
      render :create, status: 200
    else
      @message = 'createBooks error'
      render :create, status: 400
    end
  end

  def index
    @books = Book.all

    @message = 'getBooks'
    render :index, status: 200
  end

  def show
    @book = Book.find(params[:id])

    @message = 'getBookById'
    render :show, status: 200
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getBookById error, no this id'
    render :show, status: 400
  end

  def update
    book = Book.find(params[:id])

    if book.present?
      request_body = JSON.parse(request.raw_post)
      name = request_body['name']
      author = request_body['author']
      price = request_body['price']
      quantity = request_body['quantity']
      shops_id = request_body['shops_id']
      book.update(name: name, author: author, price: price, quantity: quantity, shops_id: shops_id)

      @message = 'updateBookById'
      render :update, status: 200
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'updateBookById error, no this id'
    render :update, status: 400
  end

  def destroy
    book = Book.find(params[:id])

    if book.present?
      book.destroy

      @message = 'deleteBookById'
      render :destroy, status: 200
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'deleteBookById error, no this id'
    render :destroy, status: 400
  end
end
