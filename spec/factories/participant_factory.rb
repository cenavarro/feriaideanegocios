FactoryGirl.define do
  factory :participant do
    sequence(:carnet) { |n| "2014#{n}" }
    email"participant@test.com"
    name "Test"
  end
end

