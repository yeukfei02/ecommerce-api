# frozen_string_literal: true

class AddOrdersForeignKey < ActiveRecord::Migration[6.1]
  def up
    change_table :orders do |t|
      t.references :users, index: true
    end
  end

  def down
    change_table :orders do |t|
      t.remove_references :users, index: true
    end
  end
end
