# frozen_string_literal: true

class CreateShops < ActiveRecord::Migration[6.1]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :address
      t.timestamps
    end
  end
end
