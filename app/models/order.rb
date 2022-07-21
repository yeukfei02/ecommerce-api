# frozen_string_literal: true

# == Schema Information
#
# Table name: orders
#
#  id           :bigint           not null, primary key
#  order_detail :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  shop_id      :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_orders_on_created_at    (created_at)
#  index_orders_on_order_detail  (order_detail)
#  index_orders_on_shop_id       (shop_id)
#  index_orders_on_updated_at    (updated_at)
#  index_orders_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#  fk_rails_...  (user_id => users.id)
#
class Order < ApplicationRecord
  # association
  belongs_to :shop
  belongs_to :user

  # validation
  validates :order_detail, presence: true
end
