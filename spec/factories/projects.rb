FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description "A test project."
    due_on 1.week.from_now
    association :owner

    trait :with_notes do
      after(:create) { |project| create_list(:note, 5, project: project) }
    end

    trait :due_yesterday do
      due_on 1.day.ago
    end

    trait :due_today do
      due_on Date.current.in_time_zone
    end

    trait :due_tomorrow do
      due_on 1.day.from_now
    end

    trait :invalid do
      name nil
    end

    # Factory inheritance examples ...
    #
    # factory :project_due_yesterday do
    #   due_on 1.day.ago
    # end
    #
    # factory :project_due_today do
    #   due_on Date.current.in_time_zone
    # end
    #
    # factory :project_due_tomorrow do
    #   due_on 1.day.from_now
    # end
  end

  # Non-DRY versions ...
  #
  # factory :project_due_yesterday, class: Project do
  #   sequence(:name) { |n| "Test Project #{n}" }
  #   description "Sample project for testing purposes"
  #   due_on 1.day.ago
  #   association :owner
  # end
  #
  # factory :project_due_today, class: Project do
  #   sequence(:name) { |n| "Test Project #{n}" }
  #   description "Sample project for testing purposes"
  #   due_on Date.today
  #   association :owner
  # end
  #
  # factory :project_due_tomorrow, class: Project do
  #   sequence(:name) { |n| "Test Project #{n}" }
  #   description "Sample project for testing purposes"
  #   due_on 1.day.from_now
  #   association :owner
  # end
end
