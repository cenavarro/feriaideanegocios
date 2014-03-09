ActiveAdmin.register Judge do
  menu priority: 2

  permit_params :username, :email, :password, :password_confirmation, :phase

  index do
    selectable_column
    column :username
    column :phase
    actions
  end

  filter :email

  form do |f|
    f.inputs "Judge Details" do
      f.input :username
      f.input :phase, as: :select, collection: [1, 2], include_blank: false
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end

