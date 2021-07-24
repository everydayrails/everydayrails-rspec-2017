FactoryBot.define do
  factory :note do
    message "My important note."
    association :project
    association { project.owner }
  end
end
