ActiveAdmin.register Project do
  menu priority: 1
  permit_params :code, :name, :stand, :phase, :motivation, :description, :advantage, :category_id, :judge_id, participant_ids: []

  scope :current, default: true

  Project.old.pluck(:created_at).map(&:year).uniq.each do |year|
    scope(year.to_s) { |scope| scope.where('extract(year from created_at) = ?', year) }
  end

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
    column 'Motivado por curso' do |project|
      project.motivated
    end
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
      f.input :motivated, as: :select, collection: ['No', 'Si']
      f.input :phase
      f.input :participants, as: :check_boxes, collection: Participant.all, member_label: Proc.new { |p| " #{p.carnet} - #{p.name}" }
    end
    f.actions
  end
end

