ActiveAdmin.register FairPeriod do
  actions :all, except: [:destroy, :new]

  permit_params :started_at, :ended_at

  filter :started_at
  filter :ended_at

  index do
    selectable_column
    column :started_at
    column :ended_at
    actions
  end


  form do |f|
    f.inputs "Periodo Feria" do
      f.input :started_at, as: :datepicker
      f.input :ended_at, as: :datepicker
    end
    f.actions
  end

  show do |fair_period|
    attributes_table do
      row :started_at
      row :ended_at
    end
  end
end

