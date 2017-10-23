class Note < ApplicationRecord
  belongs_to :project
  belongs_to :user

  delegate :name, to: :user, prefix: true

  validates :message, presence: true

  scope :search, ->(term) {
    where("LOWER(message) LIKE ?", "%#{term.downcase}%")
  }

  has_attached_file :attachment

  validates_attachment :attachment,
    content_type: {
      content_type: [
        "image/jpeg",
        "image/gif",
        "image/png",
        "application/pdf",
      ],
    }
end
