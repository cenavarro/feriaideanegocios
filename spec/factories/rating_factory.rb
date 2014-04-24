FactoryGirl.define do
  factory :rating do
    criteria_1 0
    criteria_2 0
    criteria_3 0
    criteria_4 0
    criteria_5 0
    phase 1

    factory :rating_with_info do
      before(:create) do |rating, evaluator|
        rating.judge = create(:judge)
        rating.project = create(:project_with_participants)
      end
    end
  end
end

