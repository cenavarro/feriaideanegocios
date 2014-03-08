ActiveAdmin.register Judge do
  menu priority: 3

  permit_params :username, :email, :password, :password_confirmation

  index do
    selectable_column
    column :username
    actions
  end

  filter :email

  form do |f|
    f.inputs "Judge Details" do
      f.input :username
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end
end

