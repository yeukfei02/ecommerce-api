# frozen_string_literal: true

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
#  shop_id    :bigint
#  user_id    :bigint
#
# Indexes
#
#  index_books_on_shop_id  (shop_id)
#  index_books_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#  fk_rails_...  (user_id => users.id)
#
class Book < ApplicationRecord
  # association
  belongs_to :shop
  belongs_to :user

  # validation
  validates :name, presence: true
  validates :author, presence: true
  validates :price, presence: true, numericality: { only_float: true }
  validates :quantity, presence: true, numericality: { only_integer: true }
end
