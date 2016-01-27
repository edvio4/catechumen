class Lesson < ActiveRecord::Base
  belongs_to :curriculum
  belongs_to :user

  validates :user_id, presence: true
  validates :unit, presence: true,
    format: { with: /[a-zA-Z]|\d+/, message: "only allows numbers or a single letter" },
    uniqueness: { scope: [:curriculum, :division_unit, :user_id] }
  validates :division_unit, allow_blank: true, allow_nil: true,
    format: { with: /[a-zA-Z]|\d+/, message: "only allows numbers or a single letter" }

  def start_time
    self.scheduled_date
  end

  private

  def has_division?
    return true if division_unit.nil?
    division_unit.empty?
  end

end
