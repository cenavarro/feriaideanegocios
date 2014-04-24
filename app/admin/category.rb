ActiveAdmin.register Category do
  menu parent: 'Mantenimiento'
  permit_params :name

  index do
    selectable_column
    column :name
    actions
  end
end

