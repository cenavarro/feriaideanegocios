FactoryGirl.define do
  factory :judge do
    sequence(:username) { |n| "juez#{n}" }
    password "password"
    password_confirmation "password"
  end
end
