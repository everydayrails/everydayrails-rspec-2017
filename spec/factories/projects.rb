FactoryBot.define do
  # factory :project do
  #   sequence(:name) { |n| "Project #{n}" }
  #   description "Sample project for testing purposes"
  #   due_on 1.week.from_now
  #   association :owner
  #
  #   # 昨日が締め切りのプロジェクト
  #   factory :project_due_yesterday do
  #     due_on 1.week.ago
  #   end
  #
  #   # 今日が締め切りのプロジェクト
  #   factory :project_due_today do
  #     due_on Date.current.in_time_zone
  #   end
  #
  #   # 明日が締め切りのプロジェクト
  #   factory :project_due_tomorrow do
  #     due_on 1.day.from_now
  #   end
  # end

  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description "Sample project for testing purposes"
    due_on 1.week.from_now
    association :owner

    # メモ付きのプロジェクト
    trait :with_notes do
      after(:create) { |project| create_list(:note, 5, project: project) }
    end
    
    # 締め切りが昨日
    trait :due_yesterday do
      due_on 1.day.ago
    end

    # 締め切りが今日
    trait :due_today do
      due_on Date.current.in_time_zone
    end

    # 締め切りが明日
    trait :due_today do
      due_on 1.day.from_now
    end
  end


end
