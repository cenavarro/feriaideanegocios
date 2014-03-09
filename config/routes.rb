FeriaIdeaNegocios::Application.routes.draw do
  devise_for :judges
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'admin/assing_projects/assign' => 'admin/assign_projects#assign', as: 'assing_project'
  root 'home#index'
end
