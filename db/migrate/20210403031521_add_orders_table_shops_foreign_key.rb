# frozen_string_literal: true

class AddOrdersTableShopsForeignKey < ActiveRecord::Migration[6.1]
  def up
    change_table :orders do |t|
      t.references :shops, index: true
    end
  end

  def down
    change_table :orders do |t|
      t.remove_references :shops, index: true
    end
  end
end
