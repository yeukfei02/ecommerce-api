ActiveAdmin.register Book do
    menu label: "Books", priority: 5

    permit_params :name, :author, :price, :quantity, :shops_id
  
    index do
      selectable_column
      id_column
      column :name
      column :author
      column :price
      column :quantity
      column :shops_id
      column :created_at
      column :updated_at
      actions
    end
  
    filter :name
    filter :author
    filter :price
    filter :quantity
    filter :shops_id
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :author
        f.input :price
        f.input :quantity
        f.input :shops_id, as: :select, collection: Shop.all.collect { |shop| [shop.name, shop.id] }
      end
      f.actions
    end
end
