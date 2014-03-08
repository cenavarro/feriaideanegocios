ActiveAdmin.register Participant do
  permit_params :carnet, :name, :email, :phone, :career_id
end
