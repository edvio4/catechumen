class Occurrence < ActiveRecord::Base
  has_many :recurrences
  has_many :schedules, through: :recurrences

  before_validation :capitalize_name

  validates :day, presence: true, inclusion: { in: %w(Sunday Monday Tuesday Wednesday Thursday Friday Saturday), message: "not a valid day of the week" }

  private

  def capitalize_name
    self.day = day.capitalize
  end
end
