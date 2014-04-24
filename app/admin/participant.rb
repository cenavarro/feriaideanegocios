ActiveAdmin.register Participant do
  menu priority: 4

  permit_params :carnet, :name, :email, :phone, :career_id

  controller do
    def scoped_collection
      if current_admin_user.admin?
        Participant.all
      else
        participants_ids = current_admin_user.projects.map(&:participants).flatten.map(&:id)
        Participant.where('id in (?)', participants_ids)
      end
    end
  end

  index do
    selectable_column
    column :carnet
    column :name
    if current_admin_user.admin?
      column :email
      column :phone
    end
    column :career
    actions if current_admin_user.admin?
  end

  show do |participant|
    attributes_table do
      row :carnet
      row :name
      if current_admin_user.admin?
        row :email
        row :phone
      end
      row :career
    end
  end
end

