FactoryGirl.define do
  factory :note do
    message "My important note."
    association :project
    association :user
  end
end
