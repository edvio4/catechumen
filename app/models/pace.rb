class Pace < ActiveRecord::Base
  has_many :curriculums

  validates :pace, presence: true, inclusion: { in: %w(1/10 1/9 1/8 1/7 1/6 1/5 1/4 1/3 1/2 1 2 3 4 5 6 7 8 9 10), message: "not a valid pace" }
end
