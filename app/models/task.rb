class Task < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :status, inclusion: { in: %w[open paused closed] }
end
