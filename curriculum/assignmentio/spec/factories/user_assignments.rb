FactoryGirl.define do
  factory :user_assignment do
    association :assignment, :factory => :assignment
    association :user
    status "completed"
  end
end
