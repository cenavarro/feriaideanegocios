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

  scope :all, default: true do |participant|
    if current_admin_user.admin?
      Participant.all
    else
      participants_ids = current_admin_user.projects.map(&:participants).flatten.map(&:id)
      Participant.where('id in (?)', participants_ids)
    end
  end
end

