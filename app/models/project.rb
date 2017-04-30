class Project < ApplicationRecord
  validates :name, presence: true, uniqueness: { scope: :user_id }

  belongs_to :owner, class_name: User, foreign_key: :user_id
  has_many :notes
  has_many :tasks
end
