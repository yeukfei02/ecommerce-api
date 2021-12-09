# == Schema Information
#
# Table name: shops
#
#  id         :bigint           not null, primary key
#  name       :string
#  address    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Shop < ApplicationRecord
  # association
  has_many :books, dependent: :destroy

  # validation
  validates :name, presence: true
  validates :address, presence: true
end
