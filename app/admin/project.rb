ActiveAdmin.register Project do
  permit_params :code, :name, :stand, :phase, :motivation, :description, :advantage, :category_id, :judge_id
end
