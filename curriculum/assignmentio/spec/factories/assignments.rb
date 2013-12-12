FactoryGirl.define do
  factory :assignment do 
    name "Assignment number 1"
    content "a bunch of content"

    factory :invalid_assignment do
      name nil
    end

    trait :incomplete_assignment do
      ignore do
        user nil
      end
      after(:create) do |assignment, evaluator|
        FactoryGirl.create(:user_assignment, :assignment => assignment, :user => evaluator.user, :status => "Incomplete")
      end
    end

    trait :submitted_assignment do
      ignore do
        user nil
      end
      after(:create) do |assignment, evaluator|
        FactoryGirl.create(:user_assignment, :assignment => assignment, :user => evaluator.user, :status => "Submitted")
      end
    end

    trait :graded_assignment do
      ignore do
        user nil
      end
      after(:create) do |assignment, evaluator|
        FactoryGirl.create(:user_assignment, :assignment => assignment, :user => evaluator.user, :status => "Graded")
      end
    end
  end

end