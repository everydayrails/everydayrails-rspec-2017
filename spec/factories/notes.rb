FactoryBot.define do
  factory :note do
    message "My important note."
    association :project
    user { project.owner }
  end
end
