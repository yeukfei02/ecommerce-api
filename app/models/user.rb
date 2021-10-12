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
class User < ApplicationRecord
  validates :email, presence: true, allow_blank: false, allow_nil: false
  validates :password, presence: true, allow_blank: false, allow_nil: false
end
