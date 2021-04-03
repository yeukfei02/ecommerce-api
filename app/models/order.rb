class Order < ApplicationRecord
    belongs_to :users, :shops
end
