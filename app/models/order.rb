# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  order_detail :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  shops_id     :bigint
#  users_id     :bigint
#
# Indexes
#
#  index_orders_on_shops_id  (shops_id)
#  index_orders_on_users_id  (users_id)
#
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :shop

  validates :order_detail, presence: true, allow_blank: false
  validates :users_id, presence: true, allow_blank: false, numericality: { only_integer: true }
  validates :shops_id, presence: true, allow_blank: false, numericality: { only_integer: true }
end
