# == Schema Information
#
# Table name: books
#
#  id         :bigint           not null, primary key
#  author     :string
#  name       :string
#  price      :float
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  shops_id   :bigint
#
# Indexes
#
#  index_books_on_shops_id  (shops_id)
#
class Book < ApplicationRecord
  belongs_to :shop

  validates :name, presence: true, allow_blank: false, allow_nil: false
  validates :author, presence: true, allow_blank: false, allow_nil: false
  validates :price, presence: true, allow_blank: false, allow_nil: false, numericality: { only_float: true }
  validates :quantity, presence: true, allow_blank: false, allow_nil: false, numericality: { only_integer: true }
  validates :shops_id, presence: true, allow_blank: false, allow_nil: false, numericality: { only_integer: true }
end
