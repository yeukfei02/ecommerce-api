ActiveAdmin.register Order do
    menu label: "Orders", priority: 6

    permit_params :order_detail, :users_id, :shops_id
  
    index do
      selectable_column
      id_column
      column :order_detail
      column :users_id
      column :shops_id
      column :created_at
      column :updated_at
      actions
    end
    
    filter :order_detail
    filter :users_id
    filter :shops_id
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :order_detail
        f.input :users_id, as: :select, collection: User.all.collect { |user| [user.email, user.id] }
        f.input :shops_id, as: :select, collection: Shop.all.collect { |shop| [shop.name, shop.id] }
      end
      f.actions
    end
end
