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
require 'rails_helper'

RSpec.describe Shop, type: :model do
  let!(:shop) do
    create(:shop)
  end

  context 'associations' do
    it { is_expected.to have_many(:books).class_name('Book') }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
  end
end
