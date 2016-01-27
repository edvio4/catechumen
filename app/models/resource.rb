class Resource < ActiveRecord::Base
  belongs_to :unit_type
  belongs_to :division_type
  belongs_to :subject
  has_many :curriculums
  has_many :students, through: :curriculums
  belongs_to :user

  validates :title, presence: true, uniqueness: { scope: :user_id }
  validates :user_id, presence: true
  validates :units, presence: true, format: { with: /[a-zA-Z]|\d+/, message: "only allows numbers or a single letter" }
  validates :unit_type_id, presence: true
  validates :subject, presence: true
  validates :division_units,
    presence: { message: "You selected a division type, but forgot to enter the division units"}, if: :division_type_selected?,
    format: { with: /[a-zA-Z]|\d+/, message: "only allows numbers or a single letter" },
    allow_nil: false
  validates :division_type_id,
    presence: { message: "You entered division units, but forgot to select a division type"}, if: :division_units_filled?

  private

  def errors_empty?
    self.errors.empty?
  end

  def division_units_filled?
    division_units.nil? ? false : !division_units.empty?
  end

  def division_type_selected?
    division_type_id.nil? ? false : !division_type_id.to_s.empty?
  end
end
