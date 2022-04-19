# frozen_string_literal: true

ActiveAdmin.register Book do
  menu label: 'Books', priority: 5

  permit_params :name, :author, :price, :quantity, :shop_id, :user_id

  filter :name
  filter :author
  filter :price
  filter :quantity
  filter :shop_id
  filter :user_id
  filter :created_at

  index do
    selectable_column
    id_column
    column :name
    column :author
    column :price
    column :quantity
    column :shop_id do |book|
      link_to book.shop.name, "/admin/shops/#{book.shop.id}" if book.shop.present?
    end
    column :user_id do |book|
      link_to book.user.email, "/admin/users/#{book.user.id}" if book.user.present?
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :name
      row :author
      row :price
      row :quantity
      row :shop do |book|
        book.shop.name if book.shop.present?
      end
      row :user do |book|
        book.user.email if book.user.present?
      end
      row :created_at
      row :updated_at
    end
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :author
      f.input :price
      f.input :quantity
      f.input :shop_id, as: :select, collection: Shop.all.collect { |shop| [shop.name, shop.id] }
      f.input :user_id, as: :select, collection: User.all.collect { |user| [user.email, user.id] }
    end
    f.actions
  end
end
