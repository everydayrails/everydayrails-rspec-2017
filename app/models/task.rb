class Task < ApplicationRecord
  belongs_to :project

  validates :project, presence: true
  validates :name, presence: true
end
