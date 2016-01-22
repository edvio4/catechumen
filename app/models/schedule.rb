class Schedule < ActiveRecord::Base
  has_one :curriculum
  has_many :lessons, through: :curriculum
  has_many :recurrences
  has_many :occurrences, through: :recurrences

  validates :curriculum_id, presence: true, uniqueness: true, numericality: { only_integer: true}
  validates :pace_id, presence: true, numericality: { only_integer: true}
  validates :start_date, presence: true

end
