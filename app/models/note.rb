class Note < ApplicationRecord
  belongs_to :project
  belongs_to :user

  delegate :name, to: :user, prefix: true
end
