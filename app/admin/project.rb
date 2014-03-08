ActiveAdmin.register Project do
  menu priority: 3

  permit_params :code, :name, :stand, :phase, :motivation, :description, :advantage, :category_id, :judge_id
end

