FactoryGirl.define do
  factory :user do 
    name "James"
    sequence(:email) { |n| "james#{n}@james.com" }
    password "soup"
    organization { |a| a.association(:organization) }
    # organization_id organization.id 
    factory :invalid_user do
      email nil
    end
  end
end