# frozen_string_literal: true

class AddIndex < ActiveRecord::Migration[6.1]
  def change
    add_index :users, :email, name: 'index_users_on_email'
    add_index :users, :password, name: 'index_users_on_password'
    add_index :users, :created_at, name: 'index_users_on_created_at'
    add_index :users, :updated_at, name: 'index_users_on_updated_at'

    add_index :shops, :name, name: 'index_shops_on_name'
    add_index :shops, :address, name: 'index_shops_on_address'
    add_index :shops, :created_at, name: 'index_shops_on_created_at'
    add_index :shops, :updated_at, name: 'index_shops_on_updated_at'

    add_index :books, :name, name: 'index_books_on_name'
    add_index :books, :author, name: 'index_books_on_author'
    add_index :books, :price, name: 'index_books_on_price'
    add_index :books, :quantity, name: 'index_books_on_quantity'
    # add_index :books, :shop_id, name: 'index_books_on_shop_id'
    # add_index :books, :user_id, name: 'index_books_on_user_id'
    add_index :books, :created_at, name: 'index_books_on_created_at'
    add_index :books, :updated_at, name: 'index_books_on_updated_at'

    add_index :orders, :order_detail, name: 'index_orders_on_order_detail'
    # add_index :orders, :shop_id, name: 'index_orders_on_shop_id'
    # add_index :orders, :user_id, name: 'index_orders_on_user_id'
    add_index :orders, :created_at, name: 'index_orders_on_created_at'
    add_index :orders, :updated_at, name: 'index_orders_on_updated_at'
  end
end
