ActiveAdmin.register Shop do
    menu :label => "Shops", :priority => 4

    permit_params :name, :address
  
    index do
      selectable_column
      id_column
      column :name
      column :address
      column :created_at
      column :updated_at
      actions
    end
  
    filter :name
    filter :address
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :name
        f.input :address
      end
      f.actions
    end

end
  