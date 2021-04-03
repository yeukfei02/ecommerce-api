require 'bcrypt'
require 'jwt'
require 'securerandom'

module UsersHelper
    def get_hash_password(password)
        BCrypt::Password.create(password)
    end

    def get_jwt_token(email)
        uuid = SecureRandom.uuid
        payload = { id: uuid, email: email }
        secret = ENV['JWT_SECRET']

        JWT.encode(payload, secret, 'HS256')
    end
end
