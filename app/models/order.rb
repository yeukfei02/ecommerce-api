class Order < ApplicationRecord
    belongs_to :user, :shop
end
