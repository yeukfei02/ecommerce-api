class User < ApplicationRecord
  validates :email, presence: true, allow_blank: false, allow_nil: false
  validates :password, presence: true, allow_blank: false, allow_nil: false
end
