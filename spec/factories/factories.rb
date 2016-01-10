FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Name#{n}" }
  end
end
