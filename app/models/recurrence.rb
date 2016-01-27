class Recurrence < ActiveRecord::Base
  belongs_to :occurrence
  belongs_to :schedule
  belongs_to :user

  validates :user_id, presence: true
  validates :schedule_id, presence: true, uniqueness: { scope: [:occurrence_id, :user_id] }, numericality: { only_integer: true}
  validates :occurrence_id, presence:true, numericality: { only_integer: true}
end
