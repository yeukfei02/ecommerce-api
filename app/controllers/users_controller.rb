require 'bcrypt'

class UsersController < ApplicationController
  def signup
    request_body = JSON.parse(request.raw_post)
    email = request_body['email']
    password = request_body['password']

    hash_password = helpers.get_hash_password(password)

    user = User.create(email: email, password: hash_password)

    if user.present?
      @message = 'signup'
      render :signup, status: :ok
    else
      @message = 'signup error'
      render :signup, status: :bad_request
    end
  end

  def login
    request_body = JSON.parse(request.raw_post)
    email = request_body['email']
    password = request_body['password']

    user = User.find_by(email: email)

    if user.present?
      hash_password_from_db = BCrypt::Password.new(user.password)
      if hash_password_from_db == password
        @token = helpers.get_jwt_token(email)

        @message = 'login'
        render :login, status: :ok
      else
        @message = 'login error, wrong password'
        render :login, status: :bad_request
      end
    else
      @message = 'login error'
      render :login, status: :bad_request
    end
  end

  def index
    @users = User.all

    @message = 'getUsers'
    render :index, status: :ok
  end

  def show
    @user = User.find(params[:id])

    @message = 'getUserById'
    render :show, status: :ok
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'getUserById error, no this id'
    render :show, status: :bad_request
  end

  def change_password
    user = User.find(params[:id])

    if user.present?
      request_body = JSON.parse(request.raw_post)
      old_password = request_body['old_password']
      new_password = request_body['new_password']

      if user.password == helpers.get_hash_password(old_password)
        user.update(password: new_password)

        @message = 'changePassword'
        render :change_password, status: :ok
      else
        @message = 'changePassword error, wrong old password'
        render :change_password, status: :bad_request
      end
    end
  rescue StandardError => e
    puts "error = #{e}"

    @message = 'changePassword error, no this id'
    render :change_password, status: :bad_request
  end
end
