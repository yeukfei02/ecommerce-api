# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_created_at  (created_at)
#  index_users_on_email       (email)
#  index_users_on_password    (password)
#  index_users_on_updated_at  (updated_at)
#
class User < ApplicationRecord
  # association
  has_many :books, dependent: :destroy
  has_many :shops, through: :books, dependent: :destroy
  has_many :orders, dependent: :destroy

  # validation
  validates :email, presence: true
  validates :password, presence: true

  # callback
  before_save :set_encrypt_password

  def set_encrypt_password
    hash_password = BCrypt::Password.create(password)
    self.password = hash_password
  end
end
