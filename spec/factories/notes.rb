FactoryBot.define do
  factory :note do
    message "My important note."
    association :project
    # association :user
    user { project.owner }
  end
end
