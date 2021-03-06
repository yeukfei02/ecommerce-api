# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  email      :string
#  password   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_created_at  (created_at)
#  index_users_on_email       (email)
#  index_users_on_password    (password)
#  index_users_on_updated_at  (updated_at)
#
require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) do
    create(:user)
  end

  context 'associations' do
    it { is_expected.to have_many(:books).class_name('Book') }
    it { is_expected.to have_many(:shops).class_name('Shop') }
    it { is_expected.to have_many(:orders).class_name('Order') }
  end

  context 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
  end
end
