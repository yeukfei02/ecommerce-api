class AddOrdersColumn < ActiveRecord::Migration[6.1]
  def change
    add_column :orders, :order_detail, :string, :after => :id
  end
end
