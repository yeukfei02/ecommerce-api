class BooksController < ApplicationController
    def create
        request_body = JSON.parse(request.raw_post)
        name = request_body['name']
        author = request_body['author']
        price = request_body['price']
        quantity = request_body['quantity']
        shops_id = request_body['shops_id']

        @book = Book.create(name: name, author: author, price: price, quantity: quantity, shops_id: shops_id)

        if @book
            data = {
                message: 'createBooks'
            }
            render json: data, status: 200
        else
            data = {
                message: 'createBooks error'
            }
            render json: data, status: 400
        end
    end

    def index
        @books = Book.all

        data = {
            message: 'getBooks',
            books: @books
        }
        render json: data, status: 200
    end

    def show
        begin
            @book = Book.find(params[:id])

            data = {
                message: 'getBookByid',
                book: @book
            }
            render json: data, status: 200
        rescue => e
            puts "error = #{e}"

            data = {
                message: 'getBookByid error, no this id',
            }
            render json: data, status: 400
        end
    end

    def update
        begin
            @book = Book.find(params[:id])

            if @book
                request_body = JSON.parse(request.raw_post)
                name = request_body['name']
                author = request_body['author']
                price = request_body['price']
                quantity = request_body['quantity']
                shops_id = request_body['shops_id']
                @book.update(name: name, author: author, price: price, quantity: quantity, shops_id: shops_id)

                data = {
                    message: 'updateBookByid'
                }
                render json: data, status: 200
            end
        rescue => e
            puts "error = #{e}"

            data = {
                message: 'updateBookByid error, no this id',
            }
            render json: data, status: 400
        end
    end

    def destroy
        begin
            @book = Book.find(params[:id])

            if @book
                @book.destroy

                data = {
                    message: 'deleteBookByid'
                }
                render json: data, status: 200
            end
        rescue => e
            puts "error = #{e}"

            data = {
                message: 'deleteBookByid error, no this id',
            }
            render json: data, status: 400
        end
    end
end
