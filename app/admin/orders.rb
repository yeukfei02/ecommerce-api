# frozen_string_literal: true

ActiveAdmin.register Order do
  menu label: 'Orders', priority: 6

  permit_params :order_detail, :shop_id, :user_id

  filter :order_detail
  filter :shop_id
  filter :user_id
  filter :created_at

  index do
    selectable_column
    id_column
    column :order_detail
    column :shop_id do |order|
      link_to order.shop.name, "/admin/shops/#{order.shop.id}" if order.shop.present?
    end
    column :user_id do |order|
      link_to order.user.email, "/admin/users/#{order.user.id}" if order.user.present?
    end
    column :created_at
    column :updated_at
    actions
  end

  show do
    attributes_table do
      row :order_detail
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
      f.input :order_detail
      f.input :shop_id, as: :select, collection: Shop.all.collect { |shop| [shop.name, shop.id] }
      f.input :user_id, as: :select, collection: User.all.collect { |user| [user.email, user.id] }
    end
    f.actions
  end
end
