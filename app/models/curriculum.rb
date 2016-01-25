class Curriculum < ActiveRecord::Base
  belongs_to :resource
  belongs_to :student
  belongs_to :schedule
  has_many :lessons
  has_many :recurrences, through: :schedule

  validates :resource_id, presence: true, uniqueness: { scope: :student_id }, numericality: { only_integer: true}
  validates :student_id, presence: true, numericality: { only_integer: true}
end
