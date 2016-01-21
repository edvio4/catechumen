class Lesson < ActiveRecord::Base
  belongs_to :curriculum

  validates :unit, presence: true,
    format: { with: /[a-zA-Z]|\d+/, message: "only allows numbers or a single letter" },
    uniqueness: { scope: [:curriculum, :division_unit] }
  validates :division_unit, allow_blank: true, allow_nil: true,
  format: { with: /[a-zA-Z]|\d+/, message: "only allows numbers or a single letter" },
  uniqueness: { scope: [:curriculum, :unit] }

  private

  def has_division?
    return true if division_unit.nil?
    division_unit.empty?
  end
end
