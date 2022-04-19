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
#  index_orders_on_shop_id  (shop_id)
#  index_orders_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Order, type: :model do
  let!(:order) do
    create(:order)
  end

  context 'associations' do
    it { is_expected.to belong_to(:shop).class_name('Shop') }
    it { is_expected.to belong_to(:user).class_name('User') }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:order_detail) }
  end
end
