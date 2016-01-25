class Recurrence < ActiveRecord::Base
  belongs_to :occurrence
  belongs_to :schedule

  validates :schedule_id, presence: true, uniqueness: { scope: :day_id }, numericality: { only_integer: true}
  validates :day_id, presence:true, numericality: { only_integer: true}
end
