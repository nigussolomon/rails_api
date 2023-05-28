class Todo < ApplicationRecord
  COMPLETE = "complete".freeze
  INCOMPLETE = "incomplete".freeze
  PENDING = "pending".freeze

  STATUSES = [COMPLETE, INCOMPLETE, PENDING].freeze

  validates :title, :description, :status, :user_id, :reminder, presence: true
  validates :status, inclusion: {:in => STATUSES}
  
end
