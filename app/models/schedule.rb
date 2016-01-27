class Schedule < ActiveRecord::Base
  belongs_to :user
  belongs_to :pace
  belongs_to :curriculum
  has_many :lessons, through: :curriculum
  has_many :recurrences
  has_many :occurrences, through: :recurrences

  validates :user_id, presence: true
  validates :curriculum_id, presence: true, uniqueness: { scope: :user_id }, numericality: { only_integer: true}
  validates :pace_id, presence: true, numericality: { only_integer: true}
  validates :start_date, presence: true
end
