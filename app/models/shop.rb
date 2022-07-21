# frozen_string_literal: true

# == Schema Information
#
# Table name: shops
#
#  id         :bigint           not null, primary key
#  address    :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_shops_on_address     (address)
#  index_shops_on_created_at  (created_at)
#  index_shops_on_name        (name)
#  index_shops_on_updated_at  (updated_at)
#
class Shop < ApplicationRecord
  # association
  has_many :books, dependent: :destroy
  has_many :orders, dependent: :destroy

  # validation
  validates :name, presence: true
  validates :address, presence: true
end
