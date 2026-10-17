class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :status, inclusion: { in: %w[open paused closed] }
end
