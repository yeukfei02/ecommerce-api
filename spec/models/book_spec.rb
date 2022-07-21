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
#  index_books_on_author      (author)
#  index_books_on_created_at  (created_at)
#  index_books_on_name        (name)
#  index_books_on_price       (price)
#  index_books_on_quantity    (quantity)
#  index_books_on_shop_id     (shop_id)
#  index_books_on_updated_at  (updated_at)
#  index_books_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (shop_id => shops.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Book, type: :model do
  let!(:book) do
    create(:book)
  end

  context 'associations' do
    it { is_expected.to belong_to(:shop).class_name('Shop') }
    it { is_expected.to belong_to(:user).class_name('User') }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:author) }

    it { is_expected.to validate_presence_of(:price) }

    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_numericality_of(:quantity).only_integer }
  end
end
