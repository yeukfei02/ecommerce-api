require 'bcrypt'

class UsersController < ApplicationController
  def signup
    params.require(%i[email password])

    email = params['email']
    password = params['password']

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
    params.require(%i[email password])

    email = params['email']
    password = params['password']

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
    params.require(%i[id old_password new_password])

    user = User.find(params[:id])

    if user.present?
      old_password = params['old_password']
      new_password = params['new_password']

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
