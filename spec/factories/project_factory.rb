FactoryGirl.define do
  factory :project do
    name 'Testing Project'
    motivation 'Motivation'
    description 'Descripcion'
    advantage 'Advantages'

    factory :project_with_participants do
      before(:create) do |project, evaluator|
        project.participants << FactoryGirl.create(:participant)
      end
    end
  end
end

