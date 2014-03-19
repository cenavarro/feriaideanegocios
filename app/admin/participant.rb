ActiveAdmin.register Participant do
  menu priority: 4

  permit_params :carnet, :name, :email, :phone, :career_id

  index do
    selectable_column
    column :carnet
    column :name
    column :email
    column :phone
    column :career
    actions
  end
end

