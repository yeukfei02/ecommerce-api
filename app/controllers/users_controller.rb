require 'bcrypt'

class UsersController < ApplicationController
    def signup
        request_body = JSON.parse(request.raw_post)
        email = request_body['email']
        password = request_body['password']

        hash_password = helpers.get_hash_password(password)

        @user = User.create(email: email, password: hash_password)

        if @user
            data = {
                message: 'signup'
            }
            render json: data, status: 200
        else
            data = {
                message: 'signup error'
            }
            render json: data, status: 400
        end
    end

    def login
        request_body = JSON.parse(request.raw_post)
        email = request_body['email']
        password = request_body['password']

        @user = User.find_by(email: email)

        if @user
            hash_password_from_db = BCrypt::Password.new(@user.password)
            if hash_password_from_db == password
                token = helpers.get_jwt_token(email)

                data = {
                    message: 'login',
                    token: token
                }
                render json: data, status: 200
            else
                data = {
                    message: 'login error, wrong password'
                }
                render json: data, status: 400
            end
        else
            data = {
                message: 'login error'
            }
            render json: data, status: 400
        end
    end

    def index
        @users = User.all

        data = {
            message: 'getUsers',
            users: @users
        }
        render json: data, status: 200
    end

    def show
        begin
            @user = User.find(params[:id])

            data = {
                message: 'getUserByid',
                user: @user
            }
            render json: data, status: 200
        rescue => e
            puts "error = #{e}"

            data = {
                message: 'getUserByid error, no this id',
            }
            render json: data, status: 400
        end
    end

    def change_password
        begin
            @user = User.find(params[:id])

            if @user
                request_body = JSON.parse(request.raw_post)
                old_password = request_body['old_password']
                new_password = request_body['new_password']

                if @user.password == helpers.get_hash_password(old_password)
                    @user.update(password: new_password)

                    data = {
                        message: 'changePassword'
                    }
                    render json: data, status: 200
                else
                    data = {
                        message: 'changePassword error, wrong old password'
                    }
                    render json: data, status: 400
                end
            end
        rescue => e
            puts "error = #{e}"

            data = {
                message: 'changePassword error, no this id',
            }
            render json: data, status: 400
        end
    end
end
