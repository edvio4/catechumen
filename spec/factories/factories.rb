FactoryGirl.define do
  factory :student do
    sequence(:name) { |n| "Name#{n}" }
  end

  factory :resource do
    sequence(:title) { |n| "Book#{n}" }
    sequence(:units) { |n| n }
  end

  factory :unit_type do
    name 'Lessons'
  end

end
