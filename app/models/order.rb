class Order < ApplicationRecord
    has_many :users
    has_many :shops

    validates :order_detail, presence: true, allow_blank: false, allow_nil: false
    validates :users_id, presence: true, allow_blank: false, allow_nil: false, numericality: { only_integer: true }
    validates :shops_id, presence: true, allow_blank: false, allow_nil: false, numericality: { only_integer: true }
end
