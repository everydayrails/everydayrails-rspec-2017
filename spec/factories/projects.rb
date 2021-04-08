FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description "A test project."
    due_on 1.week.from_now
    association :owner

    # traits and callback
    # method create_list provided by Factory Bot
    trait :with_notes do
      after(:create) { |project| create_list(:note, 5, project: project) }
    end
    # CAREFUL create_list needs the associated model to be created–in

    # factory inheritance
    factory :project_due_yesterday do
      due_on 1.day.ago
    end

    factory :project_due_today do
      due_on Date.current.in_time_zone
    end

    # or compose test data using traits
    trait :due_tomorrow do
      due_on 1.day.from_now
    end
  end
end
