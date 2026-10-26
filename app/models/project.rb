class Project < ApplicationRecord
  has_many :tasks, dependent: :destroy

  validates :name, presence: true
  validates :status, inclusion: { in: %w[open paused closed] }

  def task_status_count
    tasks.group(:status).count
  end

  def format_datetime(created_or_updated)
    if created_or_updated.day == Time.now.day
      created_or_updated.strftime("Today, %I:%M %P")
    else
      created_or_updated.strftime("%B %e, %Y")
    end
  end
end
