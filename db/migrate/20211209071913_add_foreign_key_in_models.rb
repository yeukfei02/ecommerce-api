class AddForeignKeyInModels < ActiveRecord::Migration[6.1]
  def change
    remove_column :books, :shops_id
    add_column :books, :shop_id, :bigint
    add_column :books, :user_id, :bigint

    add_index :books, :shop_id
    add_index :books, :user_id

    add_foreign_key :books, :shops, column: :shop_id
    add_foreign_key :books, :users, column: :user_id

    remove_column :orders, :shops_id
    remove_column :orders, :users_id
    add_column :orders, :shop_id, :bigint
    add_column :orders, :user_id, :bigint

    add_index :orders, :shop_id
    add_index :orders, :user_id

    add_foreign_key :orders, :shops, column: :shop_id
    add_foreign_key :orders, :users, column: :user_id
  end
end
