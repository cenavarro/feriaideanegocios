ActiveAdmin.register Participant do
  menu priority: 4

  permit_params :carnet, :name, :email, :phone, :career_id
end

