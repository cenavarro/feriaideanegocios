ActiveAdmin.register Judge do
  menu priority: 2
  permit_params :email, :password, :password_confirmation, :phase

  index do
    selectable_column
    id_column
    column :email
    column :phase
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :phase
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "Judge Details" do
      f.input :email
      f.input :phase, as: :select, collection: [1, 2], include_blank: false
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end

