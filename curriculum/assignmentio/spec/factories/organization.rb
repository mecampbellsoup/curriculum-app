FactoryGirl.define do
  factory :organization do 
    sequence(:subdomain) {|n|"flatiron#{n}"    }
    name "flatiron"
  end
end