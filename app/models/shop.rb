class Shop < ApplicationRecord
    has_many :books

    validates :name, presence: true, allow_blank: false, allow_nil: false
    validates :address, presence: true, allow_blank: false, allow_nil: false
end
