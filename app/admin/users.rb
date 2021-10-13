ActiveAdmin.register User do
  menu label: 'Users', priority: 3

  permit_params :email

  index do
    selectable_column
    id_column
    column :email
    column :created_at
    column :updated_at
    actions
  end

  filter :email
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
    end
    f.actions
  end
end
