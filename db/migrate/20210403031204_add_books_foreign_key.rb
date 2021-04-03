class AddBooksForeignKey < ActiveRecord::Migration[6.1]
  def up
    change_table :books do |t|
      t.references :shops, index: true
    end
  end

  def down
    change_table :books do |t|
      t.remove_references :shops, index: true
    end
  end
end
