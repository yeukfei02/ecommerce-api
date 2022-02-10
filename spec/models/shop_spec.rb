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
require 'rails_helper'

RSpec.describe Shop, type: :model do
  let!(:shop) do
    create(:shop)
  end

  describe 'associations' do
    it { is_expected.to have_many(:books).class_name('Book') }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:address) }
  end
end
