ActiveAdmin.register Project do
  menu priority: 1
  permit_params :code, :name, :stand, :phase, :motivation, :description, :advantage, :category_id, :judge_id, participant_ids: []

  controller do
    def scoped_collection
      if current_admin_user.admin?
        Project.all
      else
        current_admin_user.projects
      end
    end
  end

  index do
    selectable_column
    column :code
    column :name
    column :category
    column :phase
    column :stand
    column "Participantes" do |project|
      project.participants.map { |p| link_to p.carnet, admin_participant_path(p) }.join('</br>').html_safe
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :category_id, as: :select, collection: Category.all.map {|c| [c.name, c.id] }
      f.input :code
      f.input :name
      f.input :motivation
      f.input :description
      f.input :advantage
      f.input :stand
      f.input :phase
      f.input :participants, as: :check_boxes, collection: Participant.all, member_label: Proc.new { |p| " #{p.carnet} - #{p.name}" }
    end
    f.actions
  end
end

