class Book < ApplicationRecord
    has_many :shops

    validates :name, presence: true, allow_blank: false, allow_nil: false
    validates :author, presence: true, allow_blank: false, allow_nil: false
    validates :price, presence: true, allow_blank: false, allow_nil: false, numericality: { only_float: true }
    validates :quantity, presence: true, allow_blank: false, allow_nil: false, numericality: { only_integer: true }
    validates :shops_id, presence: true, allow_blank: false, allow_nil: false, numericality: { only_integer: true }
end
