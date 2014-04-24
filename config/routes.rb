FeriaIdeaNegocios::Application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  post 'admin/assing_projects/assign' => 'admin/assign_projects#assign', as: 'assing_project'
  post 'admin/conclude_phase/pass_projects' => 'admin/conclude_phase#pass_projects', as: 'admin_pass_projects'
  root 'home#index'

  resources :projects, only: [:create]
end
