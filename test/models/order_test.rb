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
require 'test_helper'

class OrderTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
