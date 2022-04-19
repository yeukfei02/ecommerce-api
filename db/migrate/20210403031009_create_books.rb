# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :name
      t.string :author
      t.float :price
      t.integer :quantity
      t.timestamps
    end
  end
end
