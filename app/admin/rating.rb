ActiveAdmin.register Rating do
  permit_params :judge_id, :project_id, :phase, :criteria_1, :criteria_2, :criteria_3, :criteria_4, :criteria_5, :criteria_6, :criteria_7

  index do
    selectable_column
    if current_admin_user.admin?
      column :judge
    end
    column :project
    column :phase
    actions
  end

  scope :all, default: true do |ratings|
    if current_admin_user.admin?
      Rating.all
    else
      current_admin_user.ratings
    end
  end

  filter :judge
  filter :project
  filter :phase

  form do |f|
    f.inputs do
      if current_admin_user.admin?
        f.input :judge, as: :select, collection: Judge.all.map{ |j| [j.email, j.id] }, include_blank: false
        f.input :project, include_blank: false
        f.input :phase
      else
        if f.object.new_record?
          f.input :project, as: :select, collection: (current_admin_user.unrated_projects), include_blank: false
        else
          f.input :project_id, as: :hidden
        end
        f.input :judge_id, as: :hidden, value: current_admin_user.id
        f.input :phase, as: :hidden, value: current_admin_user.phase
      end
      f.input :criteria_1
      f.input :criteria_2
      f.input :criteria_3
      f.input :criteria_4
      f.input :criteria_5
      if !current_admin_user.admin? && current_admin_user.phase == 2
        f.input :criteria_6
        f.input :criteria_7
      end
    end
    f.actions
  end
end

