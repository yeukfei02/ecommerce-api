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
  has_many :books

  validates :name, presence: true, allow_blank: false, allow_nil: false
  validates :address, presence: true, allow_blank: false, allow_nil: false
end
